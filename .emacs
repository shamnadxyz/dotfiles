; Add melpa package-archive
(require 'package)
(add-to-list 'package-archives
             '("melpa-stable" . "https://stable.melpa.org/packages/") t)
(package-initialize)

; Set JetBrainsMono as the default font
(add-to-list 'default-frame-alist
             '(font . "JetBrainsMono Nerd Font Mono-16"))

;; Remove GUI components
(menu-bar-mode -1)
(scroll-bar-mode -1)
(tool-bar-mode -1)

(load-theme 'catppuccin :no-confirm)
(set-frame-parameter nil 'alpha-background 80)

(setq display-line-numbers-type 'relative)
(global-display-line-numbers-mode 1)

(setq org-log-done 'time)

(setq evil-want-keybinding nil)

(setq evil-undo-system 'undo-redo)

(require 'evil)
(evil-mode 1)

(require 'evil-collection)
(evil-collection-init)

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(org-agenda-files '())
 '(package-selected-packages '(catppuccin-theme evil evil-collection magit)))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
