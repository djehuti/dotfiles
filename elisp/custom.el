;;; custom.el -- Ben's Emacs Custom File
;;; Commentary:
;;;   I have no commentary here.
;;; Code:
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(blink-cursor-mode nil)
 '(column-number-mode t)
 '(custom-enabled-themes (quote (sanityinc-solarized-dark)))
 '(custom-safe-themes
   (quote
    ("d677ef584c6dfc0697901a44b885cc18e206f05114c8a3b7fde674fce6180879" "4cf3221feff536e2b3385209e9b9dc4c2e0818a69a1cdb4b522756bcdf4e00a4" "4aee8551b53a43a883cb0b7f3255d6859d766b6c5e14bcb01bed572fcbef4328" default)))
 '(enable-recursive-minibuffers t)
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
 '(flycheck-flake8-maximum-line-length 100)
 '(fringe-mode (quote (12 . 12)) nil (fringe))
 '(goto-address-highlight-p t)
 '(ibuffer-saved-filter-groups
   (quote
    (("work"
      ("AV"
       (saved . "AV"))
      ("Dotfiles"
       (filename . "/dotfiles/"))
      ("Dropbox"
       (saved . "Dropbox"))))))
 '(ibuffer-saved-filters
   (quote
    (("AV"
      (filename . "src/av"))
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
 '(inhibit-startup-screen t)
 '(initial-scratch-message nil)
 '(line-move-visual nil)
 '(line-number-mode nil)
 '(menu-bar-mode nil)
 '(minibuffer-max-depth nil)
 '(mouse-avoidance-mode (quote jump) nil (avoid))
 '(mouse-wheel-mode t)
 '(next-line-add-newlines nil)
 '(normal-erase-is-backspace nil)
 '(ns-antialias-text t)
 '(ns-command-modifier (quote meta))
 '(ns-right-command-modifier (quote super))
 '(org-confirm-babel-evaluate nil)
 '(org-hide-emphasis-markers t)
 '(org-special-ctrl-a/e t)
 '(org-src-fontify-natively t)
 '(org-src-tab-acts-natively t)
 '(org-startup-indented t)
 '(org-tags-column 0)
 '(package-archives
   (quote
    (("melpa-stable" . "http://stable.melpa.org/packages/")
     ("melpa" . "http://melpa.org/packages/"))))
 '(package-selected-packages
   (quote
    (org-bullets which-key csound-mode slime go-mode bazel-mode json-mode markdown-mode ## yaml-mode rtags projectile php-mode magit flycheck flx-ido editorconfig company color-theme-sanityinc-solarized cmake-mode use-package)))
 '(partial-completion-mode nil)
 '(rst-indent-comment 4)
 '(rst-indent-field 4)
 '(rst-indent-literal-minimized 4)
 '(rst-indent-literal-normal 4)
 '(rst-indent-width 4)
 '(safe-local-variable-values
   (quote
    ((flycheck-clang-language-standard "c++11")
     (flycheck-gcc-language-standard "c++11"))))
 '(scroll-bar-mode nil)
 '(scroll-step 1)
 '(tool-bar-mode nil)
 '(vc-follow-symlinks t))
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
 '(hl-line ((t (:background "#073642"))))
 '(isearch ((t (:background "#859900" :foreground "#fdf6e3"))))
 '(italic ((t (:family "Source Code Variable" :foundry "outline" :slant oblique :weight normal :height 102 :width normal))))
 '(line-number ((t (:foreground "#586e75"))))
 '(line-number-current-line ((t (:background "#586e75" :foreground "#002b36"))))
 '(mode-line ((t (:background "#93a1a1" :foreground "#002b36"))))
 '(mode-line-buffer-id ((t (:inherit mode-line :foreground "#002b36" :weight bold))))
 '(mode-line-inactive ((t (:background "#93a1a1" :foreground1 "#93a1a1"))))
 '(header-line ((t (:foreground "#073642" :weight bold))))
 '(org-block ((t (:inherit fixed-pitch :background "#002028" :foreground unspecified))))
 '(org-table ((t (:inherit fixed-pitch :background "#002028"))))
 '(org-code ((t (:inherit fixed-pitch :foreground unspecified))))
 '(org-tag ((t (:foreground "#268bd2"))))
 '(org-document-title ((t (:inherit default :weight bold :foreground "#839496" :font "Source Sans Pro" :height 1.3 :underline t))))
 '(org-indent ((t (:inherit (org-hide fixed-pitch)))))
 '(org-level-1 ((t (:inherit default :weight semi-bold :foreground "#839496" :font "Source Sans Pro" :height 1.2))))
 '(org-level-2 ((t (:inherit default :weight semi-bold :foreground "#839496" :font "Source Sans Pro" :height 1.1))))
 '(org-level-3 ((t (:inherit default :weight semi-bold :foreground "#839496" :font "Source Sans Pro"))))
 '(org-level-4 ((t (:inherit default :weight normal :foreground "#839496" :font "Source Sans Pro"))))
 '(org-level-5 ((t (:inherit default :weight normal :foreground "#839496" :font "Source Sans Pro"))))
 '(org-level-6 ((t (:inherit default :weight normal :foreground "#839496" :font "Source Sans Pro"))))
 '(org-level-7 ((t (:inherit default :weight normal :foreground "#839496" :font "Source Sans Pro"))))
 '(org-level-8 ((t (:inherit default :weight normal :foreground "#839496" :font "Source Sans Pro"))))
 '(link ((t (:foreground "#268bd2" :underline t))))
 '(link-visited ((t (:inherit link :foreground "#6c71c4"))))
 '(variable-pitch ((t (:family "Source Sans Pro" :height 120 :weight normal)))))

;;; custom.el ends here
