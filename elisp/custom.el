;;; custom.el -- Ben's Emacs Custom File
;;; Commentary:
;;;   I have no commentary here.
;;; Code:
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(eshell-prompt-function
   (lambda nil
     (concat
      (propertize
       (abbreviate-file-name
        (eshell/pwd))
       (quote face)
       (\`
        (:foreground
         (\,
          (face-foreground
           (quote eshell-ls-directory))))))
      (propertize "$ "
                  (quote face)
                  (\`
                   (:foreground
                    (\,
                     (face-foreground
                      (quote default)))))))))
 '(eshell-prompt-regexp "^[^#$
]* ?[#$] ")
 '(fringe-mode (quote (12 . 12)) nil (fringe))
 '(ibuffer-saved-filter-groups
   (quote
    (("work"
      ("AV"
       (saved . "AV"))
      ("Dotfiles"
       (saved . "Dotfiles"))
      ("Dropbox"
       (saved . "Dropbox"))))))
 '(ibuffer-saved-filters
   (quote
    (("AV"
      (filename . "src/av"))
     ("Dotfiles"
      (filename . "/dotfiles/"))
     ("Dropbox"
      (filename . ".*/Dropbox/"))
     ("programming"
      (or
       (derived-mode . prog-mode)
       (mode . ess-mode)
       (mode . compilation-mode)))
     ("text document"
      (and
       (derived-mode . text-mode)
       (not
        (starred-name))))
     ("TeX"
      (or
       (derived-mode . tex-mode)
       (mode . latex-mode)
       (mode . context-mode)
       (mode . ams-tex-mode)
       (mode . bibtex-mode)))
     ("web"
      (or
       (derived-mode . sgml-mode)
       (derived-mode . css-mode)
       (mode . javascript-mode)
       (mode . js2-mode)
       (mode . scss-mode)
       (derived-mode . haml-mode)
       (mode . sass-mode)))
     ("gnus"
      (or
       (mode . message-mode)
       (mode . mail-mode)
       (mode . gnus-group-mode)
       (mode . gnus-summary-mode)
       (mode . gnus-article-mode))))))
 '(icomplete-mode t nil (icomplete))
 '(indicate-buffer-boundaries (quote right))
 '(mouse-avoidance-mode (quote jump) nil (avoid))
 '(mouse-wheel-mode t)
 '(ns-antialias-text t)
 '(ns-command-modifier (quote meta))
 '(ns-right-command-modifier (quote super))
 '(package-archives
   (quote
    (("melpa-stable" . "http://stable.melpa.org/packages/")
     ("melpa" . "http://melpa.org/packages/"))))
 '(package-selected-packages
   (quote
    (org-bullets which-key csound-mode slime go-mode bazel-mode json-mode markdown-mode ## yaml-mode rtags projectile php-mode magit flycheck flx-ido editorconfig company color-theme-sanityinc-solarized cmake-mode use-package)))
 '(partial-completion-mode nil)
 '(safe-local-variable-values
   (quote
    ((flycheck-clang-language-standard "c++11")
     (flycheck-gcc-language-standard "c++11")))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(default ((t (:family "Fira Code" :foundry "outline" :slant normal :weight normal :height 102 :width normal))))
 '(cursor ((t (:background "#ff0000"))))
 '(fixed-pitch ((t (:family "Fira Code" :weight normal :height 102 :width normal))))
 '(font-lock-builtin-face ((t (:foreground "#859900"))))
 '(font-lock-comment-face ((t (:foreground "#93a1a1" :italic t :family "Source Code Variable"))))
 '(font-lock-constant-face ((t (:foreground "#2aa198"))))
 '(font-lock-function-name-face ((t (:foreground "#268bd2"))))
 '(font-lock-keyword-face ((t (:foreground "#859900"))))
 '(font-lock-preprocessor-face ((t (:foreground "#dc322f"))))
 '(font-lock-string-face ((t (:foreground "#2aa198"))))
 '(font-lock-type-face ((t (:foreground "#b58900"))))
 '(font-lock-variable-name-face ((t (:foreground "#268bd2"))))
 '(font-lock-warning-face ((t (:foreground "#dc322f" :bold t))))
 '(header-line ((t (:foreground "#073642" :weight bold))))
 '(hl-line ((t (:background "#073642"))))
 '(isearch ((t (:background "#859900" :foreground "#fdf6e3"))))
 '(italic ((t (:family "Source Code Variable" :foundry "outline" :slant oblique :weight normal :height 102 :width normal))))
 '(line-number ((t (:foreground "#586e75" :background "#073642"))))
 '(line-number-current-line ((t (:background "#586e75" :foreground "#002b36"))))
 '(link ((t (:foreground "#268bd2" :underline t))))
 '(link-visited ((t (:inherit link :foreground "#6c71c4"))))
 '(mode-line ((t (:background "#93a1a1" :foreground "#002b36"))))
 '(mode-line-buffer-id ((t (:inherit mode-line :foreground "#002b36" :weight bold))))
 '(mode-line-inactive ((t (:background "#93a1a1" :foreground1 "#93a1a1"))))
 '(my-org-bullets-face ((t (:family "Sans Serif"))) t)
 '(org-block ((t (:inherit fixed-pitch :background "#002028" :foreground unspecified))))
 '(org-code ((t (:inherit fixed-pitch :foreground unspecified))))
 '(org-document-title ((t (:inherit default :weight bold :foreground "#839496" :font "Source Sans Pro" :height 1.3 :underline nil))))
 '(org-indent ((t (:inherit (org-hide fixed-pitch)))))
 '(org-level-1 ((t (:inherit default :weight semi-bold :foreground "#839496" :font "Source Sans Pro" :height 1.2))))
 '(org-level-2 ((t (:inherit default :weight semi-bold :foreground "#839496" :font "Source Sans Pro" :height 1.1))))
 '(org-level-3 ((t (:inherit default :weight semi-bold :foreground "#839496" :font "Source Sans Pro"))))
 '(org-level-4 ((t (:inherit default :weight normal :foreground "#839496" :font "Source Sans Pro"))))
 '(org-level-5 ((t (:inherit default :weight normal :foreground "#839496" :font "Source Sans Pro"))))
 '(org-level-6 ((t (:inherit default :weight normal :foreground "#839496" :font "Source Sans Pro"))))
 '(org-level-7 ((t (:inherit default :weight normal :foreground "#839496" :font "Source Sans Pro"))))
 '(org-level-8 ((t (:inherit default :weight normal :foreground "#839496" :font "Source Sans Pro"))))
 '(org-table ((t (:inherit fixed-pitch :background "#002028"))))
 '(org-tag ((t (:foreground "#268bd2"))))
 '(variable-pitch ((t (:family "Source Sans Pro" :height 120 :weight normal)))))

;;; custom.el ends here
