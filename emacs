;;; emacs --- Ben's ~/.emacs file
;;;
;;; Commentary:
;;;  This is a minimal .emacs file that just loads my full configuration
;;;  from a more extensive setup file in my elisp directory.
;;;
;;;  This file is copied, not linked, to ~/.emacs.
;;;  Any customizations in this file will be local and not saved
;;;  in version control, unless the original is modified.
;;;
;;; Code:

(defvar bcox-copyright-org "Ben Cox"
  "Copyright owner to insert in copyright notices.")

(defvar bcox-copyright-format "Copyright %s, %d, All rights reserved.\n"
  "Format used for copyright notices. Should include %s (org) and %d (year).")

;; Instead of changing this, make ~/.elisp a symlink. (setup.yml does.)
(defvar bcox-elisp-dir (expand-file-name ".elisp" "~")
  "The directory where my custom elisp files live.")

(add-to-list 'load-path bcox-elisp-dir)
(org-babel-load-file (expand-file-name "emacs-config.org" bcox-elisp-dir))

;;; emacs ends here

;; Local Variables:
;; mode: emacs-lisp
;; End:
