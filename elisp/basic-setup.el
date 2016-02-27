;; Find things out about Emacs and the system.
(setq
 xemacs-p  (or (not (null (string-match "XEmacs" emacs-version)))
               (not (null (string-match "Lemacs" emacs-version))))
 emacs24-p (not (null (string-match "^24\\." emacs-version)))
 emacs23-p (not (null (string-match "^23\\." emacs-version)))
 emacs22-p (not (null (string-match "^22\\." emacs-version)))
 xwindow-p (eq window-system 'x)
 osxgui-p  (eq window-system 'ns)
 mac-p     (eq system-type 'darwin)
 gui-p (or xwindow-p osxgui-p)
)

(blink-cursor-mode nil)

(setq this-host-name (getenv "HOSTNAME"))

(require 'cmake-mode)

;; Let me do all sorts of dangerous (NOT!) stuff.
(put 'eval-expression 'disabled nil)
(put 'narrow-to-region 'disabled nil)
(put 'upcase-region 'disabled nil)


;; Miscellaneous preferences
(setq
 diary-file "~/.diary"
 require-final-newline nil)
(make-variable-buffer-local 'require-final-newline)
(setq-default show-trailing-whitespace t)
; (setq-default x-stretch-cursor t)
(setq-default default-indicate-empty-lines t)
(setq-default indicate-empty-lines t)
(setq-default c-tab-always-indent nil)


;; Display tab characters with an alternate background color.
(progn (make-face 'tab-face)
       (set-face-background 'tab-face "#ccd8ff")
       (make-face 'cr-face)
       (set-face-foreground 'cr-face "#ffffff")
       (set-face-background 'cr-face "#f08080")
       (setq colortab-display-table (make-display-table))
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
)

(font-lock-add-keywords 'c++-mode
 '(
   ("\\(// *TODO.*$\\)" 1 font-lock-warning-face prepend)
   ("\\(/\\* *TODO.*$\\)" 1 font-lock-warning-face prepend)
   ("\\(/\\* *TODO.*\\*/\\)" 1 font-lock-warning-face prepend)
   ("\\<\\(public\\|private\\|protected\\):" . font-lock-keyword-face)
   )
)
(font-lock-add-keywords 'c-mode
 '(
   ("\\(// *TODO.*$\\)" 1 font-lock-warning-face prepend)
   ("\\(/\\* *TODO.*$\\)" 1 font-lock-warning-face prepend)
   ("\\(/\\* *TODO.*\\*/\\)" 1 font-lock-warning-face prepend)
   )
)


;; Turn off the *Messages* buffer
(setq message-log-max nil)
(kill-buffer "*Messages*")


;; Helper for compilation. Close the compilation window if
;; there was no error at all.
(defun compilation-exit-autoclose (status code msg)
  ;; If M-x compile exists with a 0
  (when (and (eq status 'exit) (zerop code))
    ;; then bury the *compilation* buffer, so that C-x b doesn't go there
    (bury-buffer)
    ;; and delete the *compilation* window
    (delete-window (get-buffer-window (get-buffer "*compilation*"))))
  ;; Always return the anticipated result of compilation-exit-message-function
  (cons msg code))
;; Specify my function (maybe I should have done a lambda function)
(setq compilation-exit-message-function 'compilation-exit-autoclose)


;; set C-mode indentation style

(c-add-style "cox" '("stroustrup"
                     (indent-tabs-mode nil)
                     (c-tab-always-indent nil)
                     (c-indent-level . 4)
                     (c-continued-statement-offset . 4)
                     (c-brace-offset . 0)
                     (c-brace-imaginary-offset . 0)
                     (c-argdecl-indent . 0)
                     (c-label-offset . -4)
                     (c-basic-offset . 4)))

;--------------------------------------;
; C++ Indentation, Thanks to Joe Lisee ;
;--------------------------------------;

(c-add-style "uatc-c-style"
  '((c-auto-newline                 . nil)
    (c-basic-offset                 . 4)
    (c-comment-only-line-offset     . 0)
    (c-hanging-braces-alist         . ((substatement-open after)
                                       (brace-list-open)))
    (c-offsets-alist                . ((arglist-close . c-lineup-arglist)
                                       (case-label . 2)
                                       (substatement-open . 0)
                                       (block-open . 0) ; no space before {
                                       (inline-open . 0) ; no space before {
                                       (knr-argdecl-intro . -)
                                       (innamespace . 0)))
    (c-hanging-colons-alist         . ((member-init-intro before)
                                       (inher-intro)
                                       (case-label after)
                                       (label after)
                                       (access-label after)))
    (c-cleanup-list                 . (scope-operator
                                       empty-defun-braces
                                       defun-close-semi))))

(setq-default indent-tabs-mode nil)
(c-set-offset 'comment-intro 0)
(setq c-default-style "uatc-c-style")


;; Set Java-mode indentation style
(defun my-java-mode-common-hook ()
  (show-paren-mode 1)
  (setq tab-width 8
        show-paren-style 'expression
        c-tab-always-indent nil
        indent-tabs-mode nil)
  (setq c-hanging-braces-alist
        (append '((class-open after)
                  (defun-open after)
                  (inline-open after))
                c-hanging-braces-alist))
  (setq c-offsets-alist
        (append '((func-decl-cont . ++))
                c-offsets-alist))
  (c-toggle-auto-hungry-state -1)
  )

;; Set this fucking variable, goddamnit.
(defun my-c-mode-tab-setting ()
  (setq c-tab-always-indent nil
        indent-tabs-mode nil
        truncate-lines t))


;; Use rust-mode.
(autoload 'rust-mode "rust-mode" nil t)


;; Use fundamental-mode for Makefiles and VBS files.  And a few others
;; Use perl-mode (not prolog-mode) when appropriate.
(setq auto-mode-alist
      (append '(("Makefile$" . fundamental-mode)
                ("\\.toml$" . fundamental-mode)
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

;; Use gid.
(autoload 'gid "id-utils")

; (add-hook 'c-mode-common-hook 'my-java-mode-common-hook)
(add-hook 'c-mode-common-hook 'my-c-mode-tab-setting)
(add-hook 'cmake-mode-hook
          '(lambda ()
             (setq indent-tabs-mode nil)
             (setq cmake-tab-width 4)))
(add-hook 'lisp-interaction-mode-hook '(lambda () (setq c-tab-always-indent nil)))
(add-hook 'rst-mode-hook '(lambda () (setq indent-tabs-mode nil)))

;; And use font-lock for all relevant modes.
(global-font-lock-mode 1)

;; Here are some handy functions for quick & dirty editing & file viewing
(defun dont-do-backups (foo) "Cause emacs never to do any backups."
  (setq make-backup-files nil)
  (message "Will not make backup files."))

(defun dont-write-files (foo) "Cause emacs to find all files in readonly mode."
  (add-hook 'find-file-hooks
            '(lambda () (setq buffer-read-only t)))
  (message "Edits will be read-only."))

(setq do-separate-minibuffer nil)
(defun do-separate-minibuf (foo)
  "Cause emacs to create a separate minibuffer frame."
  (setq do-separate-minibuffer t))

;; Add those functions to our command line switches.
(setq command-switch-alist
      (append
       command-switch-alist
       '(("-nobackup" . dont-do-backups)
         ("-readonly" . dont-write-files)
         ("-minibuf" . do-separate-minibuf)
         )))


;; When I'm in text mode, put me in auto-fill-mode
;; and make sure my files end with a newline.
(add-hook 'text-mode-hook
          '(lambda ()
             (setq require-final-newline t)
             (auto-fill-mode 1)))


;; Determines whether a file is under a directory containing
;; a P4 config file.
(defun is-file-under-p4 (fpath) "foo"
  (setq dirname
        (if (file-directory-p fpath) fpath
          (substring (file-name-directory fpath) 0
           (1- (length (file-name-directory fpath))))))

  (setq penvname (getenv "P4CONFIG"))
  (if (not penvname) (setq penvname "P4ENV"))

  (setq foundit nil)
  (while (not (or foundit (string= dirname "")))
    (setq penvfile (concat dirname "/" penvname))
    (if (file-regular-p penvfile)
        (setq foundit t)
      (setq dirname (file-name-directory dirname))
      (setq dirname (substring dirname 0 (1- (length dirname))))))
  foundit
)


;; Determines whether a file is in a git repo.
(defun is-file-under-git (fpath) "foo"
  (setq dirname
        (if (file-directory-p fpath) fpath
          (substring (file-name-directory fpath) 0
           (1- (length (file-name-directory fpath))))))

  (setq foundit nil)
  (while (not (or foundit (string= dirname "")))
    (setq gitdir (concat dirname "/.git"))
    (if (file-directory-p gitdir)
        (setq foundit t)
      (setq dirname (file-name-directory dirname))
      (setq dirname (substring dirname 0 (1- (length dirname))))))
  foundit
)


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
               ((is-file-under-p4 name) nil)
               (t))))


;; Ange-FTP interferes with DFS filenames that contain colons.
;; (It thinks "/.:/fs/foo" is file "/fs/foo" on FTP server ".".)
;; But now that I'm not using DFS anymore...
;(setq file-name-handler-alist nil)


;; GO AWAY, version control!!!!
;(setq rcs-active nil)


;; I'm, like, dangerous, or something.
(setq auto-save-list-file-name nil)


;; This is used by the include-sig function, below.
(defun append-file (fname) "Append a file at the end of the current buffer."
  (save-excursion
    (goto-char (point-max))
    (insert-file-contents fname)))

;; Eno's Oblique Strategies.
(autoload 'os-insert "oblique" nil t)
(defun do-oblique (arg) "Insert an Oblique Strategy."
       (interactive "p")
       (os-insert t)
       (newline))
; C-c o is a user key.  Note this definition doesn't happen under Emacs 18.
(define-key text-mode-map "\C-co" 'do-oblique)

;; Include a sig or a disclaimer, depending on the prefix arg.
;; Also used to insert an Oblique Strategy (if we're running Emacs 19).
(defun include-sig (arg) "Include a signature."
  (interactive "p")
  (save-excursion
     (if (= arg 1)
         (append-file "~/.sig")
       (append-file "~/.disclaimer"))
;    (goto-char (point-max))
;    (do-oblique)
    ))
; C-c c is a user key.
(define-key text-mode-map "\C-cc" 'include-sig)


(defun settabwidth (arg) "Set tab width to N characters."
  (interactive "p")
  (setq tab-width arg))


;; Allow user to easily make the backspace key work.
(defun remap-help () "Switch HELP from C-h to M-?." (interactive)
  (setq help-char ?\M-?)
  (global-set-key "\e?" 'help-command)
  (global-set-key "\^h" 'delete-backward-char)
  (global-set-key "\e\^h" 'backward-kill-word)
  (global-set-key "\^c\^k" 'compile)
  (define-key isearch-mode-map "\^h" 'isearch-delete-char)
  (define-key ctl-x-map "h" 'restore-help)
  (define-key ctl-x-map "\t" 'settabwidth)
  (define-key ctl-x-map "t" 'toggle-truncate-lines)
  (message "C-h is no longer HELP key."))

(defun restore-help () "Put HELP back on C-h." (interactive)
  (setq help-char 8)
  (global-set-key "\^h" 'help-command)
  (global-set-key "\e\^h" 'mark-defun)
  (define-key ctl-x-map "h" 'remap-help)
  (message "HELP is on C-h again."))
; C-x h is normally mark-whole-buffer.
(remap-help)


;; This function can be useful in text files;
;; I hate files that have whole bunches of newlines at the end.
(defun fix-file-end () "Remove blank lines from the end of the buffer."
  (interactive)
  (save-excursion
    (goto-char (point-max)) (delete-blank-lines)
    (previous-line 1) (delete-blank-lines))
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


;; Quick key mappings for scrolling up/down by one line.
(defun scroll-up-one-line () "Scroll up one line."
  (interactive)
  (scroll-up 1))
(defun scroll-down-one-line () "Scroll down one line."
  (interactive)
  (scroll-down 1))
(global-set-key [(meta down)] 'scroll-up-one-line)
(global-set-key [(meta up)] 'scroll-down-one-line)


;; Let F12 do toggle-truncate-lines
(global-set-key [(f12)] 'toggle-truncate-lines)


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


;; Setup some key preferences.
; C-x b is normally list-buffers.
(define-key ctl-x-map     "\C-b"     'buffer-menu)
; C-x f is normally set-fill-column.
(define-key ctl-x-map     "f"        'auto-fill-mode)
; These keys are normally undefined.
(define-key esc-map       "g"        'goto-line)
(define-key esc-map       "o"        'overwrite-mode)
(define-key ctl-x-map     "%"        'query-replace-regexp)
(define-key esc-map       "`"        'set-mark-command)
(define-key text-mode-map "\C-cf"    'fundamental-mode)
(global-set-key [end] 'end-of-line)
(global-set-key [home] 'beginning-of-line)
(global-set-key [C-end] 'end-of-buffer)
(global-set-key [C-home] 'beginning-of-buffer)
(global-set-key (kbd "C-<tab>") 'indent-rigidly)


;; (load "desktop")
;; (desktop-load-default)
;; (desktop-read)

;; Use the server on OS X or other server.
(if gui-p
    (progn
      (load-library "hl-line")
      (add-hook 'find-file-hooks '(lambda () (hl-line-mode 1)))
      (server-start)))

(if (or emacs23-p emacs24-p)
    (progn
      (set-language-environment "Latin-1")))


;; Give me the ability to set a frame's title easily.
(defun set-frame-title (newtitle)
  "Set the title of the selected frame."
  (interactive "sNew frame title: ")
  (modify-frame-parameters (selected-frame) (list (cons 'name newtitle))))


(setq frame-title-format "%b")
(setq icon-title-format "%b")


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

(if emacs24-p
    (progn
      (require 'package)
      (add-to-list 'package-archives
                   '("melpa" . "http://stable.melpa.org/packages/") t)
      (package-initialize)
      ;(package-install 'flycheck)
      (require 'flycheck)
      (global-flycheck-mode)
      (require 'company)
      (add-hook 'after-init-hook 'global-company-mode)
      (require 'editorconfig)
      (editorconfig-mode 1)))

(add-hook 'term-setup-hook
          '(lambda ()
             (if (not gui-p)
                 (progn
                   (setq white-frame-alist
                         (list '(menu-bar-lines . 0)
                               ))
                   (setq initial-frame-alist white-frame-alist)
                   (setq default-frame-alist white-frame-alist)
                   ))
             (if osxgui-p
                 (progn
                   (if do-separate-minibuffer
                       (progn
                         (setq the-minibuffer-frame
                               (make-initial-minibuffer-frame nil))
                         (modify-frame-parameters the-minibuffer-frame
                                                  '((name . "Minibuffer")
                                                    (icon-name . "Minibuffer")
                                                    (vertical-scroll-bars)
                                                    ))))
                   (setq sized-frame-alist
                         (list '(menu-bar-lines . 0)
                               '(width . 80) '(height . 40)
                               (cons 'minibuffer (not do-separate-minibuffer))
                               ))
                   (setq initial-frame-alist sized-frame-alist)
                   (setq default-frame-alist sized-frame-alist)
                   (load-library "color-theme")
                   (load-library "color-theme-solarized")
                   (color-theme-solarized-light)
                   ))
             (if xwindow-p
                 (progn
                   (if mac-p
                       (setq fontname "Menlo-7")
                     (setq fontname "DejaVu Sans Mono-10"))
                   (if do-separate-minibuffer
                       (progn
                         (setq the-minibuffer-frame
                               (make-initial-minibuffer-frame
                                (car (x-display-list))))
                         (modify-frame-parameters the-minibuffer-frame
                                                  (list '(name . "Minibuffer")
                                                        '(icon-name . "Minibuffer")
                                                        (cons 'font fontname)
                                                        '(vertical-scroll-bars)))))
                   (setq sized-frame-alist
                         (list '(menu-bar-lines . 0)
                               '(width . 80) '(height . 40)
                               (cons 'font fontname)
                               (cons 'minibuffer (not do-separate-minibuffer))
                               ))
                   (setq initial-frame-alist sized-frame-alist)
                   (setq default-frame-alist sized-frame-alist)
                   (load-library "color-theme")
                   (load-library "color-theme-solarized")
                   (color-theme-solarized-light)
                   ))
             ))
