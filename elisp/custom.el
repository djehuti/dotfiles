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
 '(diary-file "~/org/diary")
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
           (quote eshell-ls-directory-face))))))
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
 '(fringe-mode (quote (8 . 8)) nil (fringe))
 '(goto-address-highlight-p t)
 '(icomplete-mode t nil (icomplete))
 '(indicate-buffer-boundaries (quote right))
 '(inhibit-startup-screen t)
 '(initial-scratch-message nil)
 '(line-move-visual nil)
 '(line-number-mode t)
 '(menu-bar-mode t)
 '(minibuffer-max-depth nil)
 '(mouse-avoidance-mode (quote jump) nil (avoid))
 '(mouse-wheel-mode t)
 '(next-line-add-newlines nil)
 '(normal-erase-is-backspace nil)
 '(ns-antialias-text t)
 '(ns-command-modifier (quote meta))
 '(ns-right-command-modifier (quote super))
 '(org-agenda-files (quote ("~/org/agenda.org")))
 '(org-src-fontify-natively t)
 '(package-selected-packages
   (quote
    (csound-mode slime go-mode bazel-mode json-mode markdown-mode ## yaml-mode rtags projectile php-mode magit flycheck flx-ido editorconfig company color-theme-sanityinc-solarized cmake-mode use-package)))
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
 '(cursor ((t (:background "#ff0000"))))
 '(font-lock-builtin-face ((t (:foreground "#859900"))))
 '(font-lock-comment-face ((t (:foreground "#93a1a1" :italic t))))
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
 '(mode-line ((t (:background "#93a1a1" :foreground "#002b36"))))
 '(mode-line-inactive ((t (:background "#93a1a1" :foreground1 "#93a1a1"))))
 '(region ((t (:background "#ddddcc"))))
 '(trailing-whitespace ((t (:background "#ccd8ff"))))
 '(vertical-border ((t (:background "#aaaa99" :foreground "#aaaa99")))))

;;; custom.el ends here
