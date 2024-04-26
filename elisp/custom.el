;;; custom.el -- Ben's Emacs Custom File
;;; Commentary:
;;;   I have no commentary here.
;;; Code:
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(custom-enabled-themes '(solarized-light))
 '(eshell-prompt-function
   (lambda nil
     (concat
      (propertize
       (abbreviate-file-name
        (eshell/pwd))
       'face
       `(:foreground ,(face-foreground 'eshell-ls-directory)))
      (propertize "$ " 'face
                  `(:foreground ,(face-foreground 'default))))))
 '(eshell-prompt-regexp "^[^#$
]* ?[#$] ")
 '(fringe-mode 0 nil (fringe))
 '(icomplete-mode t nil (icomplete))
 '(mouse-avoidance-mode 'jump nil (avoid))
 '(mouse-wheel-mode t)
 '(package-selected-packages
   '(cmake-mode
     editorconfig
     flx-ido
     go-mode
     json-mode
     magit
     markdown-mode
     php-mode
     rust-mode
     solarized-theme
     sudo-edit
     swift-mode
     terraform-mode
     typescript-mode
     use-package
     yaml-mode))
 '(partial-completion-mode nil))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(mode-line-buffer-id ((t (:foreground "#fdf6e3" :underline nil))))
 '(mode-line-inactive ((t (:foreground "#b8c0c4" :background "#93a1a1" :box nil :underline nil :overline nil))))
 '(mode-line ((t (:foreground "#fdf6e3" :background "#839496" :box nil :underline nil :overline nil))))
 '(line-number ((t (:foreground "#fdf6e3" :background "#ddd7c8"))))
 '(line-number-current-line ((t (:foreground "#839496" :background "#eee8d5"))))
 '(default ((t (:height 135 :family "Iosevka"))))
 '(cursor ((t (:background "#ff0000")))))

;;; custom.el ends here
