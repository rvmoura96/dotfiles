;; Remove welcome message
(setq inhibit-startup-message t)


;; Remove menus
(menu-bar-mode -1)
(tool-bar-mode -1)

;; line-numbers
(global-linum-mode t)
(setq column-number-mode t)

;; Font size
(set-face-attribute 'default nil :height 170)

;; whitespace-mode
(global-whitespace-mode t)


(require 'package)
(setq package-enable-at-startup nil)
(add-to-list 'package-archives
	     '("melpa" . "http://melpa.org/packages/"))
(package-initialize)

(unless (package-installed-p 'use-package)
  (package-refresh-contents)
  (package-install 'use-package))

(use-package evil
  :ensure t
  :config (evil-mode))

(use-package python-mode
  :ensure t)

(use-package feature-mode
  :ensure t
  :config
  (progn
    (setq feature-default-language "pt")
    ))

(use-package centaur-tabs
  :ensure t
  :demand
  :config
  (progn
    (centaur-tabs-mode t)
    (centaur-tabs-headline-match)
    (setq centaur-tabs-style "bar")
    (setq centaur-tabs-set-bar 'over)
    (setq centaur-tabs-set-modified-marker t)
    (setq centaur-tabs-modified-marker "*")
    (centaur-tabs-change-fonts "arial" 160)
    (setq centaur-tabs-set-icons t)
    (setq centaur-tabs-height 32))
  :bind
  ("C-<prior>" . centaur-tabs-backward)
  ("C-<next>" . centaur-tabs-forward))

(use-package which-key
  :ensure t
  :config (which-key-mode))

(use-package counsel
  :ensure t)

(use-package swiper
  :ensure t
  :init
  (progn
    (ivy-mode 1)
    (setq ivy-use-virtual-buffers t)
    (setq enable-recursive-minibuffers t)
    (global-set-key "\C-f" 'swiper)
    (global-set-key (kbd "<f1> l") 'counsel-find-library)
    ))


(use-package all-the-icons
  :ensure t)

(use-package neotree
  :ensure t
  :config
  (progn
    (setq neo-theme (if (display-graphic-p) 'icons 'arrow))
    )
  :bind (("C-=". 'neotree-toggle))
  )

(use-package auto-complete
  :ensure t
  :init
  (progn
    (ac-config-default)
    (global-auto-complete-mode t)
    )
  )


(use-package yaml-mode
  :ensure t)

(use-package spaceline
  :ensure t
  :config
  (spaceline-emacs-theme))

(use-package solarized-theme
  :ensure t
  :config
  (load-theme 'solarized-light t))

(use-package shell-pop
 :ensure t
 :config
 (progn
   (setq shell-pop-shell-type (quote ("ansi-term" "*ansi-term*" (lambda nil (ansi-term shell-pop-term-shell)))))
   (global-set-key (kbd "C-'") 'shell-pop)
   (setq shell-pop-term-shell "/bin/bash")
   (shell-pop--set-shell-type 'shell-pop-shell-type shell-pop-shell-type)))

(use-package flycheck
  :ensure t
  :init
  (global-flycheck-mode t))

;; Shortcuts
(evil-define-key 'normal evil-normal-state-map (kbd "g t") 'centaur-tabs-forward)
(evil-define-key 'normal evil-normal-state-map (kbD "g T") 'centaur-tabs-backward)
(evil-define-key 'normal neotree-mode-map (kbd "TAB") 'neotree-enter)
(evil-define-key 'normal neotree-mode-map (kbd "SPC") 'neotree-quick-look)
(evil-define-key 'normal neotree-mode-map (kbd "q") 'neotree-hide)
(evil-define-key 'normal neotree-mode-map (kbd "RET") 'neotree-enter)
(evil-define-key 'normal neotree-mode-map (kbd "g") 'neotree-refresh)
(evil-define-key 'normal neotree-mode-map (kbd "n") 'neotree-next-line)
(evil-define-key 'normal neotree-mode-map (kbd "p") 'neotree-previous-line)
(evil-define-key 'normal neotree-mode-map (kbd "A") 'neotree-stretch-toggle)
(evil-define-key 'normal neotree-mode-map (kbd "H") 'neotree-hidden-file-toggle)
(global-set-key (kbd "C-<tab>") 'other-window)
(global-set-key (kbd "C-/") 'comment-line)
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(ansi-color-faces-vector
   [default default default italic underline success warning error])
 '(ansi-color-names-vector
   ["black" "#d55e00" "#009e73" "#f8ec59" "#0072b2" "#cc79a7" "#56b4e9" "white"])
 '(package-selected-packages
   (quote
    (flycheck shell-pop solarized-theme evil use-package))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
