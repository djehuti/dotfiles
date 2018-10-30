;;; basic-setup.el -- Ben's Emacs Initialization File
;;; Commentary:
;;;   Blah.
;;; Code:


;; Let me do all sorts of dangerous (NOT!) stuff.
(put 'eval-expression 'disabled nil)
(put 'narrow-to-region 'disabled nil)
(put 'upcase-region 'disabled nil)


;; UTF-8 is in for 2018.
(prefer-coding-system 'utf-8)


;; Display tab characters with an alternate background color, except in Go.
(progn (make-face 'tab-face)
       (set-face-background 'tab-face "#ccd8ff")
       (make-face 'cr-face)
       (set-face-foreground 'cr-face "#ffffff")
       (set-face-background 'cr-face "#f08080")
       (defvar colortab-display-table (make-display-table) "Display table for coloring CR and tab characters.")
       (aset colortab-display-table 9
             (vector
              (make-glyph-code 9 'tab-face)
              ))
       (aset colortab-display-table 13
             (vector
              (make-glyph-code 94 'cr-face)
              (make-glyph-code 77 'cr-face)
              ))
       (setq standard-display-table colortab-display-table)
       (defvar go-display-table (make-display-table) "Display table for coloring CR characters.")
       (aset colortab-display-table 13
             (vector
              (make-glyph-code 94 'cr-face)
              (make-glyph-code 77 'cr-face)
              ))
)


(font-lock-add-keywords 'c++-mode
 '(
   ("// *\\(TODO.*$\\)" 1 font-lock-warning-face prepend)
   ("/\\* *\\(TODO.*$\\)" 1 font-lock-warning-face prepend)
   ("/\\* *\\(TODO.*\\)\\*/" 1 font-lock-warning-face prepend)
   ("\\<\\(public\\|private\\|protected\\):" . font-lock-keyword-face)
   )
)
(font-lock-add-keywords 'c-mode
 '(
   ("// *\\(TODO.*$\\)" 1 font-lock-warning-face prepend)
   ("/\\* *\\(TODO.*$\\)" 1 font-lock-warning-face prepend)
   ("/\\* *\\(TODO.*\\)\\*/" 1 font-lock-warning-face prepend)
   )
)
(font-lock-add-keywords 'python-mode
 '(
   ("# *\\(TODO.*$\\)" 1 font-lock-warning-face prepend)
   )
)


;; Helper for compilation. Close the compilation window if
;; there was no error at all.
;; (eval-when-compile (require 'compile))
;; (defun compilation-exit-autoclose (status code msg)
;;   "Close the compilation window if the compile exits successfully.  STATUS.  CODE.  MSG."
;;   ;; If M-x compile exits with a 0
;;   (when (and (eq status 'exit) (zerop code))
;;     ;; then bury the *compilation* buffer, so that C-x b doesn't go there
;;     (bury-buffer)
;;     ;; and delete the *compilation* window
;;     (delete-window (get-buffer-window (get-buffer "*compilation*"))))
;;   ;; Always return the anticipated result of compilation-exit-message-function
;;   (cons msg code))
;; Specify my function (maybe I should have done a lambda function)
;;(setq compilation-exit-message-function 'compilation-exit-autoclose)


;; set C-mode indentation style

(c-add-style "cox" '("stroustrup"
                     (indent-tabs-mode nil)
                     (c-basic-offset . 4)
                     (c-tab-always-indent nil)
                     (c-indent-level . +)
                     (c-continued-statement-offset . +)
                     (c-brace-offset . 0)
                     (c-brace-imaginary-offset . 0)
                     (c-argdecl-indent . 0)
                     (c-label-offset . -)
                     (c-offsets-alist (comment-intro . 0)
                                      (access-label . -3)
                                      (innamespace . 0))))

(setq-default indent-tabs-mode nil)
(c-set-offset 'comment-intro 0)
(eval-when-compile (require 'cc-vars))
(setq c-default-style "cox")

(require 'ido)
(ido-mode t)

;; Use rust-mode.
(autoload 'rust-mode "rust-mode" nil t)


;; Use fundamental-mode for Makefiles and VBS files.  And a few others
;; Use perl-mode (not prolog-mode) when appropriate.
(setq auto-mode-alist
      (append '(("Makefile$" . fundamental-mode)
                ("\\.toml$" . fundamental-mode)
                ("BUILD$" . bazel-mode)
                ("WORKSPACE$" . bazel-mode)
                ("Construct$" . perl-mode)
                ("Conscript$" . perl-mode)
                ("\\.m$" . objc-mode)
                ("\\.mm$" . objc-mode)
                ("\\.pl$" . perl-mode)
                ("\\.ph$" . perl-mode)
                ("\\.pm$" . perl-mode)
                ("\\.x$" . c-mode)
                ("\\.vbs$" . fundamental-mode)
                ("\\.rs$" . rust-mode))
              auto-mode-alist))

(add-hook 'c-mode-common-hook
          '(lambda ()
             (setq c-tab-always-indent nil
                   show-trailing-whitespace t
                   indent-tabs-mode nil
                   truncate-lines t)))
(add-hook 'lisp-interaction-mode-hook '(lambda () (setq c-tab-always-indent nil)))
(add-hook 'rst-mode-hook '(lambda () (setq indent-tabs-mode nil)))
(add-hook 'go-mode-hook '(lambda () (progn
                                      (setq tab-width 4)
                                      (setq buffer-display-table go-display-table))))

;; And use font-lock for all relevant modes.
(global-font-lock-mode 1)

;; Determines whether a file is in a git repo.
(defun is-file-under-git (fpath)
  "Return t if FPATH is under Git control, nil otherwise."
  (let ((dirname (if (file-directory-p fpath) fpath
                   (substring (file-name-directory fpath) 0
                              (1- (length (file-name-directory fpath))))))
        (lastdir nil)
        (foundit nil)
        (gitdir nil))
    (while (not (or foundit (string= dirname "") (string= dirname lastdir)))
      (setq gitdir (concat dirname "/.git"))
      (if (file-directory-p gitdir)
          (setq foundit t)
        (setq lastdir dirname)
        (setq dirname (file-name-directory dirname))
        (setq dirname (substring dirname 0 (1- (length dirname))))))
    foundit))


;; Emacs 19 and later uses this predicate to determine,
;; based on a file's name, whether to make a backup.
;; This function avoids making backups of files in /tmp and /usr/tmp.
(setq backup-enable-predicate
      '(lambda (name)
         (cond ((< (length name) 5) t)
               ((string-equal "/tmp/" (substring name 0 5)) nil)
               ((< (length name) 9) t)
               ((string-equal "/usr/tmp/" (substring name 0 9)) nil)
               ((is-file-under-git name) nil)
               (t))))


;; This function can be useful in text files;
;; I hate files that have whole bunches of newlines at the end.
(defun fix-file-end ()
  "Remove blank lines from the end of the buffer."
  (interactive)
  (save-excursion
    (goto-char (point-max))
    (delete-blank-lines) 
   (forward-line -1)
    (delete-blank-lines))
  (message "Blanks removed from eof."))
; C-c C-f is a user key.
(define-key text-mode-map "\C-c\C-f" 'fix-file-end)

(defun exit-text-file () "Quit, after killing blank lines from the end."
  (interactive)
  (fix-file-end)
  (save-buffers-kill-emacs))
; C-c C-c is a user key.
(define-key text-mode-map "\C-c\C-c" 'exit-text-file)


;; This allows me to just nuke a buffer and the window showing it
;; (or frame, if it's the only window in that frame) all in one swell foop.
(declare-function server-edit "server.el" nil)
(defun kill-buf-n-win () "Kill the current buffer and its associated window."
  (interactive)
  (if (and (boundp 'server-buffer-clients) server-buffer-clients)
      (server-edit)
    (kill-buffer (current-buffer))
    (condition-case nil
        (delete-window)
      (error (delete-frame)))))
; C-x C-k is normally undefined.
(define-key ctl-x-map "\C-k" 'kill-buf-n-win)


;; Org Mode
(require 'org)
;; Org directory
(setq org-directory "~/Dropbox/org")
(setq org-default-notes-file (concat org-directory "/notes.org"))
(setq org-agenda-include-diary t)
;; Links
(setq org-link-abbrev-alist
      '(("phab" . "https://aurora.phacility.com/%s")
         ("google"    . "http://www.google.com/search?q=")))
;; Tags
(setq org-tag-alist '(("BUG" . ?G)
                      (:startgroup . nil)
                      ("Work" . ?W) ("Personal" . ?P) ("SPM" . ?S)
                      (:endgroup . nil)))
;; Drawers
(setq org-drawers '("PROPERTIES" "CLOCK" "LOGBOOK" "RESULTS" "NOTES"))
;; Standard key bindings
(global-set-key "\C-cl" (function org-store-link))
(global-set-key "\C-ca" (function org-agenda))
(global-set-key "\C-cb" (function org-iswitchb))
(global-set-key "\C-cc" (function org-capture))


(define-globalized-minor-mode my-global-goto-address-mode goto-address-mode
  (lambda () (goto-address-mode 1)))

(my-global-goto-address-mode 1)


;; This allows me to swap the positions of windows on the screen.
;; Really it just uses the existing windows and swaps which buffers
;; they're displaying, but the effect is the same.  The selected
;; buffer stays the same (meaning that the cursor is now in the
;; new window on the screen).  Repeated calls to this function will
;; move a buffer around through the window list, like a bubblesort.
(defun swap-windows () "Swap this window and the next one."
  (interactive)
  (if (one-window-p t)
      (message "You eeediot!")
    (save-excursion
      (let
          ((w1 (selected-window))
           (b1 (current-buffer))
           (w2)
           (b2))
        (other-window 1)
        (setq w2 (selected-window))
        (setq b2 (current-buffer))
        (select-window w1)
        (switch-to-buffer b2)
        (select-window w2)
        (switch-to-buffer b1)))))
; C-c w is a user key.
(global-set-key "\C-cw" 'swap-windows)
(global-set-key "\C-cq" 'bury-buffer)


;; Setup some key preferences.
(define-key ctl-x-map     "\C-b"     'buffer-menu)
(define-key ctl-x-map     "f"        'auto-fill-mode)
(define-key esc-map       "o"        'overwrite-mode)
(define-key ctl-x-map     "%"        'query-replace-regexp)
(define-key text-mode-map "\C-cf"    'fundamental-mode)
(global-set-key [end] 'end-of-line)
(global-set-key [home] 'beginning-of-line)
(global-set-key [C-end] 'end-of-buffer)
(global-set-key [C-home] 'beginning-of-buffer)
(global-set-key (kbd "C-<tab>") 'indent-rigidly)
(global-set-key "\^c\^k" 'compile)
(define-key ctl-x-map "t" 'toggle-truncate-lines)
(global-set-key [(f12)] 'toggle-truncate-lines)
(global-set-key [(meta down)] '(lambda (arg) (interactive "p") (scroll-up arg)))
(global-set-key [(meta up)] '(lambda (arg) (interactive "p") (scroll-down arg)))
;; Eno's Oblique Strategies.
(autoload 'os-insert "oblique" nil t)
; C-c o is a user key.
(define-key text-mode-map "\C-co" 'os-insert)


(require 'hl-line)
(add-hook 'find-file-hooks '(lambda () (hl-line-mode 1)))


(defun set-n-columns (n)
  "Make the current frame N columns wide."
  (interactive "p")
  (if (= n 1) (setq n 80))
  (modify-frame-parameters (selected-frame) (list (cons 'width n))))
(defun set-n-rows (n)
  "Make the current frame N rows high."
  (interactive "p")
  (if (= n 1) (setq n 50))
  (modify-frame-parameters (selected-frame) (list (cons 'height n))))

(define-key ctl-x-map "\C-n" 'set-n-columns)
(define-key ctl-x-map "\C-h" 'set-n-rows)
(add-to-list 'default-frame-alist '(width  . 101))
(add-to-list 'default-frame-alist '(height . 50))

(setenv "LANG" "en_US.UTF-8")
(defun mosh (args)
  "Connect to a remote host with mosh."
  (interactive
   (list (read-from-minibuffer "mosh " nil nil nil 'my-mosh-history)))
  (let* ((switches (split-string-and-unquote args))
         (name (concat "mosh " args))
         (termbuf (apply 'make-term name "/usr/local/bin/mosh" nil switches)))
    (set-buffer termbuf)
    (term-mode)
    (term-char-mode)
    (switch-to-buffer termbuf)))

(defun ssh (args)
  "Connect to a remote host with ssh."
  (interactive
   (list (read-from-minibuffer "ssh " nil nil nil 'my-ssh-history)))
  (let* ((switches `("-A" . ,(split-string-and-unquote args)))
         (name (concat "ssh " args))
         (termbuf (apply 'make-term name "/usr/bin/ssh" nil switches)))
    (set-buffer termbuf)
    (term-mode)
    (term-char-mode)
    (switch-to-buffer termbuf)))

(defun bens-fix-tty-colors ()
  "Fix the colors on the TTY."
  (interactive)
  (unless (display-graphic-p (selected-frame))
    (set-face-background 'default "unspecified-bg" (selected-frame))))

(defun insert-aurora-copyright (arg)
  "Insert an Aurora copyright notice with the current year.
With prefix ARG, use that year."
  (interactive "P")
  (let ((current-year (if arg
                          arg
                        (nth 5 (decode-time)))))
    (save-excursion
      (goto-char (point-min))
      (insert
       (format
        "Copyright Aurora Innovation, Inc., %d, All rights reserved.\n"
        current-year))
      (comment-region (point-min) (point)))))
(define-key ctl-x-map "\M-c" 'insert-aurora-copyright)


;(defvar emacs24-p  (not (null (string-match "^24\\." emacs-version))) "True if we are running Emacs 24.")
;(defvar emacs243-p  (not (null (string-match "^24\\.3\\." emacs-version))) "True if we are running Emacs 24.3.")
;(defvar emacs245-p  (not (null (string-match "^24\\.5\\." emacs-version))) "True if we are running Emacs 24.5.")

(set-language-environment "Latin-1")

(require 'package)
(add-to-list 'package-archives
             '("melpa" . "http://melpa.org/packages/") t)
(add-to-list 'package-archives
             '("melpa-stable" . "http://stable.melpa.org/packages/") t)
(package-initialize)

;; manually install use-package package manager
(unless (package-installed-p 'use-package)
  (package-refresh-contents)
  (package-install 'use-package))

;; configure use-package
(setq use-package-always-ensure t)  ;; always download and install packages
(setq use-package-always-pin "melpa")  ;; prefer latest
(eval-when-compile
  (require 'use-package))
(require 'bind-key)
(require 'diminish)

;; YouCompleteMe
(use-package ycmd
  :init
  ;; (set-variable 'ycmd-global-config "~/dotfiles/ycmd_conf.py")
  (set-variable 'ycmd-extra-conf-whitelist `("~/src/av/*"))
  (set-variable 'ycmd-server-command `("python" ,(file-truename "~/src/ycmd/ycmd")))
  :config
  (ycmd-setup)
  (add-hook 'after-init-hook #'global-ycmd-mode))
  
;; flycheck stuff
(use-package flycheck
  :config
  (global-flycheck-mode)
  (add-hook 'c++-mode-hook
            (lambda()
              (setq flycheck-gcc-language-standard "c++14")
              (setq flycheck-clang-language-standard "c++14")))
  (add-hook 'c-mode-hook
            (lambda()
              (setq flycheck-gcc-language-standard "c11")
              (setq flycheck-clang-language-standard "c11")))
  (use-package flycheck-ycmd
    :config
    (flycheck-ycmd-setup))
  (use-package flycheck-rust))

;; C++
;; auto-formatting
(use-package clang-format)
(global-set-key "\C-cl" 'clang-format-buffer)

(use-package projectile
  :config
  (projectile-global-mode))

;; company code autocomplete
(use-package company
  :defer
  :init (global-company-mode)
  :bind ("TAB" . company-indent-or-complete-common)
  :config
  (setq company-idle-delay 1.2)
  (setq company-minimum-prefix-length 2)

  (setq company-backends (delete 'company-semantic company-backends))
  (setq company-backends (delete 'company-clang company-backends))

  (use-package company-c-headers
    :config
    (add-to-list 'company-c-headers-path-system "/usr/include/c++/5"))
  (add-to-list 'company-backends 'company-c-headers)

  (use-package company-ycmd
    :config
    (company-ycmd-setup))

  ;; TODO: remove in favor of ycm jedi completion
  ;; (use-package company-jedi
  ;;  :config
  ;;  (add-to-list 'company-backends 'company-jedi))

  (use-package company-lua)
  (use-package company-racer)
  (use-package company-web)
  (use-package web-completion-data))

(use-package editorconfig
  :diminish
  (editorconfig-mode . "")
  :config
  (editorconfig-mode 1))

;;; basic-setup.el ends here
