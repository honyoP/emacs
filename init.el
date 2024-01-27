(menu-bar-mode -1)
(tool-bar-mode -1)
(scroll-bar-mode -1)

(display-line-numbers-mode 1)

;; Stops emacs yapping and fucking up my configs
(setq disabled-command-function nil)
(setq custom-file "~/.config/emacs/.emacs-custom.el")
(unless (file-exists-p custom-file)
  (write-region "" nil custom-file))
(load-file custom-file)

(require 'package)
(add-to-list 'package-archives '("melpa" . "https://melpa.org/packages/") t)
(package-initialize)
(setq use-package-always-ensure t)

(use-package company)
(add-hook 'after-init-hook 'global-company-mode)

(use-package god-mode)

(use-package all-the-icons)

(use-package treemacs
  :defer t)

(use-package doom-modeline
  :init (doom-modeline-mode 1)
  :config (column-number-mode 1))

(use-package doom-themes
  :config
  (doom-themes-org-config)
  (doom-themes-visual-bell-config)
  (load-theme 'doom-one t))

(use-package dashboard
  :config
  (dashboard-setup-startup-hook))
(setq initial-buffer-choice (lambda () (get-buffer-create "*dashboard*")))

(use-package lsp-mode
  :init (setq lsp-keymap-prefix "C-c l")
  :command lsp)
(add-hook 'prog-mode-hook #'lsp)

(use-package lsp-ui)

(use-package dap-mode
  :config
  (dap-auto-configure-mode)
  :bind
  (("<f7>" . dap-step-in)
   ("<f8>" . dap-next)
   ("<f9>" . dap-continue)))

(require 'dap-firefox)

(global-set-key (kbd "<escape>") #'god-mode-all)
(global-set-key (kbd "M-0") #'treemacs)
