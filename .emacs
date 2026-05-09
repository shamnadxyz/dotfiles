; Add melpa package-archive
(require 'package)
(add-to-list 'package-archives
             '("melpa-stable" . "https://stable.melpa.org/packages/") t)
(package-initialize)

; Set JetBrainsMono as the default font
(add-to-list 'default-frame-alist
             '(font . "Iosevka NF-14"))

;; Remove GUI components
(menu-bar-mode -1)
(scroll-bar-mode -1)
(tool-bar-mode -1)

(global-display-line-numbers-mode 1)
(global-hl-line-mode 1)

(setq display-line-numbers-type 'relative)
(setq inhibit-startup-screen t)
(setq org-log-done 'time)
(setq vc-follow-symlinks t)

; (load-theme 'modus-operandi :no-confirm)
(load-theme 'modus-vivendi :no-confirm)

(use-package evil
  :ensure t
  :init
  (setq evil-want-C-u-scroll t)
  :custom
  (evil-want-keybinding nil)
  (evil-undo-system 'undo-redo)
  :config
  (evil-mode 1))

(use-package evil-collection
  :ensure t
  :config
 (evil-collection-init))
 
(use-package vertico
  :ensure t
  :config
  (vertico-mode 1))

(use-package orderless
  :ensure t
  :custom
  (completion-styles '(orderless basic))
  (completion-category-overrides '((file (styles partial-completion))))
  (completion-pcm-leading-wildcard t)) ;; Emacs 31: partial-completion behaves like substring

(use-package magit
  :ensure t
  :bind ("C-c g s" . magit-status))

(use-package company
  :ensure t
  :hook (after-init . global-company-mode)
  :config
  ;; trigger completion
  (define-key evil-insert-state-map (kbd "C-SPC")
    #'company-complete)
  ;; accept completion
  (define-key company-active-map (kbd "C-y")
    #'company-complete-selection))
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(package-selected-packages nil))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
