"""Functions to deal with git."""

from __future__ import print_function

import os
import subprocess
import sys

__author__ = 'bcox'

GIT = '/usr/bin/git'
GIT_DIR = '.git'
OBJ_DIR = 'objects'

GREEN = '0;32'
BLUE = '0;34'


class CheckWorkspacesError(Exception):

    """An exception class for the djehuti.git package."""

    pass


class GitError(CheckWorkspacesError):

    """An exception class for git problems found in djehuti.git."""

    def __init__(self, value):
        self.value = value

    def __str__(self):
        return repr(self.value)


def _color(color, msg):
    return '\033[%sm%s\033[0m' % (color, msg)


def real_git_repo(pathname):
    """Returns the real repository root for the given git workdir."""
    curpath = os.path.realpath(pathname)
    counter = 1
    while counter < 100:
        gitpath = os.path.realpath(os.path.join(curpath, GIT_DIR))
        if os.path.isdir(gitpath):
            objdir = os.path.realpath(os.path.join(gitpath, OBJ_DIR))
            return os.path.dirname(os.path.dirname(objdir)) # strip '/.git/objects'
        if curpath == '/':
            raise GitError('The path %s is not under git.' % pathname)
        curpath = os.path.dirname(curpath)
        counter += 1
    raise GitError('The path %s is not under git.' % pathname)


def peer_git_workdirs(repo):
    """
    Returns a list of the git workdirs that point at the given git repo.
    We will only find workdirs that are peers of the given repo in the directory structure.
    @param repo The git repo.
    @returns A list of workdirs for the given repo.
    """
    realrepo = os.path.realpath(repo)
    parent = os.path.realpath(os.path.dirname(realrepo))
    entries = os.listdir(parent)
    workdirs = []
    for entry in entries:
        workdir = os.path.realpath(os.path.join(parent, entry))
        if workdir == realrepo: # don't consider the starting workdir
            continue
        if not os.path.isdir(workdir): # Not a directory (or link to one).
            continue
        try:
            work_repo = real_git_repo(workdir)
        except GitError:
            # This directory isn't under git; skip it
            work_repo = None
        if work_repo == realrepo:
            workdirs.append(workdir)
    return workdirs


def git_branch(workdir):
    """Returns the name of the branch that is checked out in the given workdir."""
    os.chdir(workdir)
    git = subprocess.Popen([GIT, 'branch', '--list'],
                           stdout=subprocess.PIPE, stderr=subprocess.PIPE)
    branches = git.communicate()[0]
    lines = branches.split('\n')
    for line in lines:
        words = line.strip().split(' ')
        if len(words) == 2 and words[0] == '*':
            return words[1]
    return None


def fetch(repo):
    """Runs `git fetch --all --prune` in the given repo."""
    os.chdir(repo)
    with open(os.devnull, 'w') as devnull:
        status = subprocess.call([GIT, 'fetch', '--all', '--prune'],
                                 stdout=devnull, stderr=devnull)
    return status


def check_workspaces(workdir):
    """Print some information about the workspaces checked out from this repo."""
    this_repo = real_git_repo(workdir)
    print(_color(GREEN, 'Repo is "%s".' % this_repo))
    print(_color(GREEN, 'All branches:'))
    os.chdir(this_repo)
    subprocess.call([GIT, 'branch', '-vv'])
    peers = peer_git_workdirs(this_repo)
    all_workdirs = [this_repo]
    all_workdirs.extend(peers)
    print(_color(GREEN, 'All workdirs status:'))
    for workdir in all_workdirs:
        branch = git_branch(workdir)
        message = '%s: %s' % (_color(BLUE, workdir), _color(GREEN, branch))
        print(message)
