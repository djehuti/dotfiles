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
 '(default ((t (:height 120 :family "Iosevka"))))
 '(cursor ((t (:background "#ff0000")))))

;;; custom.el ends here
