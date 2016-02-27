;;; oblique.el --- insert an Oblique Strategy in a mail header

;; Author: 1993 Barry A. Warsaw, Century Computing, Inc. <bwarsaw@cen.com>
;; Maintainer:    bwarsaw@cen.com
;; Created:       February 1993
;; Version:       $Revision: 1.4 $
;; Last Modified: $Date: 1993/10/08 15:03:03 $
;; Keywords: Oblique Strategy, Brian Eno

;; Copyright (C) 1993 Barry A. Warsaw
;; Some of the Oblique Strategies may or may not be copyright other
;; people. I don't know.

;; This file is not part of GNU Emacs.

;; This program is free software; you can redistribute it and/or modify
;; it under the terms of the GNU General Public License as published by
;; the Free Software Foundation; either version 2 of the License, or
;; (at your option) any later version.
;; 
;; This program is distributed in the hope that it will be useful,
;; but WITHOUT ANY WARRANTY; without even the implied warranty of
;; MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
;; GNU General Public License for more details.
;; 
;; You should have received a copy of the GNU General Public License
;; along with this program; if not, write to the Free Software
;; Foundation, Inc., 675 Mass Ave, Cambridge, MA 02139, USA.

;; LCD Archive Entry
;; oblique|Barry A. Warsaw|bwarsaw@cen.com
;; |insert an Oblique Strategy in a mail header
;; |$Date: 1993/10/08 15:03:03 $|$Revision: 1.4 $|

;; Code:

(defconst os-strategies
  '("What wouldn't you do?"
    "Left channel, right channel, center channel"
    "Use an old idea"
    "Not building a wall but making a brick"
    "Consider different fading systems"
    "Destroy - nothing"
    "Destroy - the most important thing"
    "What mistakes did you make last time?"
    "Give way to your worst impulse"
    "Change nothing and continue with immaculate consistency"
    "Don't stress one thing more than another"
    "Make a sudden, destructive, unpredictable action; incorporate"
    "Distorting time"
    ""
    "Breathe more deeply"
    "Don't be afraid of things because they're easy to do"
    "Don't be frightened of cliches"
    "Humanize something free of error"
    "Do we need holes?"
    "Ask your body"
    "Don't be frightened to display your talents"
    "(Organic) machinery"
    "Tape your mouth (given by Rita Saarikko)"
    "Water"
    "Emphasize differences"
    "How would you have done it?"
    "Just carry on"
    "Twist the spine"
    "Get your neck massaged"
    "Cluster Analysis"
    "Mute and continue"
    "Reverse"
    "Do nothing for as long as possible"
    "Bridges - build"
    "Bridges - burn"
    "Always give yourself credit for having more than personality (given by Arto Lindsay)"
    "It is quite possible (after all)"
    "Always first steps"
    "Cut a vital connection"
    "Balance the consistency principle with the inconsistency principle"
    "You can only make one dot at a time"
    "Allow an easement (an easement is the abandonment of a stricture)"
    "Think of the radio"
    "Do something boring"
    "Discover the recipes you are using and abandon them"
    "Idiot Glee"
    "Do the words need changing?"
    "Tidy up"
    "Discard an axiom"
    "Question the heroic approach"
    "Overtly resist change"
    "Use an unacceptable color"
    "What are you really thinking about just now?"
    "Imagine the piece as a set of disconnected events"
    "Lost in useless territory"
    "The most important thing is the thing most easily forgotten"
    "Take away the elements in order of apparent non-importance"
    "Abandon normal instruments"
    "Intentions - nobility of"
    "Intentions - humility of"
    "Intentions - credibility of"
    "What are the sections sections of? Imagine a caterpillar moving"
    "Infinitesimal gradations"
    "The tape is now the music"
    "A very small object. Its center"
    "What would your closest friend do?"
    "Honor thy error as a hidden intention"
    "Look at the order in which you do things."
    "Remove the ambiguities and convert to specifics"
    "Use `unqualified' people"
    "Be extravagant"
    "The inconsistency principle"
    "Trust in the you of now"
    "Remove specifics and convert to ambiguities"
    "Revaluation (a warm feeling)"
    "Go slowly all the way round the outside"
    "Give the name away"
    "Disciplined self-indulgence"
    "You don't have to be ashamed of using your own ideas"
    "What is the Reality of the situation?"
    "You are an engineer"
    "Be dirty"
    "Use fewer notes"
    "Accept advice"
    "Listen to the quiet voice"
    "Do the washing up"
    "Assemble some of the elements in a group and treat the group"
    "State the problem in words as clearly as possible"
    "Only one element of each kind"
    "Is there something missing"
    "Change instrument roles"
    "Accretion"
    "Disconnect from desire"
    "Lowest common denominator"
    "Go outside. Shut the door."
    "Are there sections? Consider transitions"
    "Children - speaking"
    "Children - singing"
    "Faced with a choice - do both (given by Dieter Rot)"
    "Emphasize repetitions"
    "Simple subtraction"
    "Consult other sources - promising"
    "Consult other sources - unpromising"
    "Towards the insignificant"
    "Turn it upside down"
    "Decorate, decorate"
    "Ghost echoes"
    "Short circuit"
    "Take a break"
    "Simply a matter of work"
    "Remember those quiet evenings"
    "Emphasize the flaws"
    "Mechanicalize something idiosyncratic"
    "Ask people to work against their better judgement"
    "Look closely at the most embarrassing details and amplify them"
    "Work at a different speed"
    "Put in earplugs"
    "Is the information correct?"
    "Define an area as `safe' and use it as an anchor"
    "A line has two sides"
    "Fill every beat with something"
    "Use filters"
    "Spectrum analysis"
    "Feed the recording back out of the medium"
    "Make a blank valuable by putting it in an exquisite frame"
    "Courage!"
    "Cascades"
    "Convert a melodic element into a rhythmic element"
    "Repetition is a form of change"
    "Is it finished?"
    "Make an exhaustive list of everything you might do and do the last thing on the list"
    "Don't break the silence"
    "Into the impossible"
    "Every image begins with a single dot (given by Mao Tse Neve)"
    
; mine start here.    tr
    "Remove the structure, keep the elements"
    "Remove the elements, keep the structure"
    "Invert the figure and the ground"
    "How would it appear if you were blind?"
    "Stand on your head"
    "Do the next step as quickly as you can, without thinking"
    "Repeat a previously succesful strategy"
    "Try to fail"
    "Punch holes in your canvas"
    "Make a door into a window"
    "Put everything in one place"
    "How would this appear to an extra-terrestrial?"
    "Remove unnecessary detail"
    "Concentrate on the very end"
    "Flip a coin"
    "Go out and steal the first sound you here"
    "Emphasize the silences between the notes"
    "Subvert your original idea"
    "Revert to your original idea"
    "Remove half of everything"
    "Ask a friend"
    "Ask a stranger"
    "Do the opposite of what you would normally do"
    "Suppose you are under water"
    "Tear it into pieces"
    "Attempt uniformity"
    "Embrace the irrational"
    "Work out every detail"
    
    )
  "List of Oblique Strategies.")

(defvar os-mail-header "X-Oblique-Strategy"
  "*Mail header to contain saying. Don't include the end colon.")


(defun os-mail-add-header (header contents &optional replace)
  "Add the specified HEADER to the current message, with given CONTENTS.  
If the header already exists, the contents are left unchanged, unless optional 
argument REPLACE is non-nil."
  (save-excursion
    (let ((header-exists (mail-position-on-field header)))
      ;; Delete old contents if REPLACE is set
      (if (and header-exists replace)
	  (delete-region
	   (point)
	   (progn (re-search-backward (concat header ": "))
		  (goto-char (match-end 0)))))
      ;; Add new contents if REPLACE is set, or this is a new header.
      (if (or (not header-exists) replace)
	  (progn (insert contents) contents)))))

(defun os-choose-strategy ()
  "Randomly choose an Oblique Strategy."
  (nth (random (length os-strategies)) os-strategies))

(defun os-insert (arg)
  "Inserts an Oblique Strategy.
Display the Strategy in the minibuffer, unless optional universal ARG
is given, in which case it inserts the strategy in the current buffer
at point."
  (interactive "P")
  (if arg
      (insert (os-choose-strategy))
    (message "%s" (os-choose-strategy))))

(defun os-header ()
  "Inserts a mail header with a chosen Oblique Strategy."
  (os-mail-add-header os-mail-header (os-choose-strategy)))


(random t)


(provide 'oblique)
