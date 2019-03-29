;;; emacs --- Ben's ~/.emacs file
;;;
;;; Commentary:
;;;  This is a minimal .emacs file that just loads my full configuration
;;;  from a more extensive setup file in my elisp directory.
;;;
;;; Code:

;; Mode selection: 'home or 'work.
(defvar bcox-emacs-mode 'work
  "Sets whether we are setting up a home ('home) or work ('work) setup.")

(defvar bcox-elisp-dir (expand-file-name ".elisp" "~")
  "The directory where my custom elisp files live.")

(add-to-list 'load-path bcox-elisp-dir)
(org-babel-load-file (expand-file-name "emacs-config.org" bcox-elisp-dir))

;;; emacs ends here

;; Local Variables:
;; mode: emacs-lisp
;; End:
