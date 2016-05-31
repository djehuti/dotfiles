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
 '(custom-safe-themes
   (quote
    ("d677ef584c6dfc0697901a44b885cc18e206f05114c8a3b7fde674fce6180879" "4cf3221feff536e2b3385209e9b9dc4c2e0818a69a1cdb4b522756bcdf4e00a4" "4aee8551b53a43a883cb0b7f3255d6859d766b6c5e14bcb01bed572fcbef4328" default)))
 '(enable-recursive-minibuffers t)
 '(flycheck-flake8-maximum-line-length 120)
 '(fringe-mode (quote (4 . 4)) nil (fringe))
 '(icomplete-mode t nil (icomplete))
 '(indicate-buffer-boundaries (quote right))
 '(inhibit-startup-screen t)
 '(initial-scratch-message nil)
 '(line-move-visual nil)
 '(line-number-mode t)
 '(menu-bar-mode nil)
 '(minibuffer-max-depth nil)
 '(mouse-avoidance-mode (quote jump) nil (avoid))
 '(mouse-wheel-mode t nil (mwheel))
 '(next-line-add-newlines nil)
 '(normal-erase-is-backspace nil)
 '(ns-antialias-text t)
 '(ns-command-modifier (quote meta))
 '(ns-right-command-modifier (quote super))
 '(partial-completion-mode nil)
 '(rst-indent-comment 4)
 '(rst-indent-field 4)
 '(rst-indent-literal-minimized 4)
 '(rst-indent-literal-normal 4)
 '(rst-indent-width 4)
 '(safe-local-variable-values
   (quote
    ((flycheck-clang-language-standard "c++11")
     (flycheck-gcc-language-standard "c++11")
     (flycheck-gcc-include-path
      ("/home/bcox/src/av/source" "/home/bcox/src/av/deps"))
     (flycheck-gcc-include-path
      (quote
       ("/home/bcox/src/av/source" "/home/bcox/src/av/deps")))
     (flycheck-gcc-include-path
      (list "/home/bcox/src/av/source" "/home/bcox/src/av/deps")))))
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
 '(trailing-whitespace ((t (:background "#ccd8ff")))))
;;; custom.el ends here
