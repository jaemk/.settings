;; -*- lexical-binding: t; -*-

(require 'package)
(add-to-list 'package-archives '("melpa" . "http://melpa.org/packages/") t)
(package-initialize)

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(package-selected-packages
   '(lsp-python-ms python-mode company lsp-ui lsp-mode flycheck rustic use-package)))

(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )

;; -- alter keybindings
(defun insert-line-below ()
  "Insert an empty line below the current line."
  (interactive)
  (end-of-line)
  (call-interactively 'newline-and-indent))

(add-hook 'after-init-hook
	  '(lambda ()
             (global-unset-key (kbd "C-o"))
             (global-unset-key (kbd "C-l"))
             (global-set-key (kbd "C-o") #'insert-line-below)
             (global-set-key (kbd "C-M-e") #'move-beginning-of-line)
             (global-set-key (kbd "C-j") #'newline-and-indent)
             (global-set-key (kbd "RET") #'newline-and-indent)
             (global-set-key (kbd "C-x C-b") #'ibuffer)
             (global-set-key (kbd "C-l e") #'tab-bar-switch-to-next-tab)
             (global-set-key (kbd "C-l E") #'tab-bar-switch-to-prev-tab)
             (global-set-key (kbd "C-x t t") #'tab-new)
             (global-set-key (kbd "C-x t u") #'tab-bar-undo-close-tab)
             (global-set-key (kbd "C-x t k") #'tab-close)
             (global-set-key (kbd "C-l L") #'global-display-line-numbers-mode)
             ))


(add-hook 'python-mode-hook
          '(lambda ()
             (define-key python-mode-map (kbd "C-M-e") #'move-beginning-of-line)
             ))

(add-hook 'before-save-hook #'delete-trailing-whitespace)

;; hide menu bar
(menu-bar-mode -1)

;; enable tab bar
(tab-bar-mode 1)
(setq tab-bar-new-tab-choice "*scratch*")

;; highlight cursor line, change hl-line color
(global-hl-line-mode 1)
(set-face-attribute 'hl-line nil :inherit nil :background "#1E4D6B")

;; only use spaces
(setq-default indent-tabs-mode nil)

;; follow symlinks
(setq vc-follow-symlinks t)

;; Auto revert files when they change
(global-auto-revert-mode t)

;; Also auto refresh dired, but be quiet about it
(setq global-auto-revert-non-file-buffers t)
(setq auto-revert-verbose nil)

;; scroll one line an a time when cursor is within 5 lines of end
(setq-default scroll-step 1)
(setq-default scroll-margin 5)
(setq-default scroll-preserve-screen-position 1)

;; relative line numbers
(setq-default display-line-numbers-type 'relative)
(global-display-line-numbers-mode t)

;; -- packages
(unless (package-installed-p 'use-package)
  (package-refresh-contents)
  (package-install 'use-package))

(use-package zenburn-theme)
(load-theme 'zenburn t)

(use-package python-mode :ensure)

(use-package rustic
  :ensure
  :bind (:map rustic-mode-map
              ("M-j" . lsp-ui-imenu)
              ("M-?" . lsp-find-references)
              ("C-c C-c l" . flycheck-list-errors)
              ("C-c C-c a" . lsp-execute-code-action)
              ("C-c C-c r" . lsp-rename)
              ("C-c C-c q" . lsp-workspace-restart)
              ("C-c C-c Q" . lsp-workspace-shutdown)
              ("C-c C-c s" . lsp-rust-analyzer-status))
  :config
  ;; uncomment for less flashiness
  ;; (setq lsp-eldoc-hook nil)
  ;; (setq lsp-enable-symbol-highlighting nil)
  ;; (setq lsp-signature-auto-activate nil)

  ;; comment to disable rustfmt on save
  (setq rustic-format-on-save t)
  (add-hook 'rustic-mode-hook 'rk/rustic-mode-hook))

(defun rk/rustic-mode-hook ()
  ;; so that run C-c C-c C-r works without having to confirm, but don't try to
  ;; save rust buffers that are not file visiting. Once
  ;; https://github.com/brotzeit/rustic/issues/253 has been resolved this should
  ;; no longer be necessary.
  (when buffer-file-name
    (setq-local buffer-save-without-query t)))

(use-package lsp-mode
  :ensure
  :commands lsp
  :custom
  ;; what to use when checking on-save. "check" is default, I prefer clippy
  (lsp-rust-analyzer-cargo-watch-command "clippy")
  (lsp-eldoc-render-all t)
  (lsp-idle-delay 0.6)
  (lsp-rust-analyzer-server-display-inlay-hints t)
  :config
  (add-hook 'lsp-mode-hook 'lsp-ui-mode))

(use-package lsp-ui
  :ensure
  :commands lsp-ui-mode
  :custom
  (lsp-ui-peek-always-show t)
  (lsp-ui-sideline-show-hover t)
  (lsp-ui-doc-enable nil))

(use-package flycheck :ensure)
(global-flycheck-mode t) ;; enable flycheck globally

(use-package company
  :ensure
  :bind
  (:map company-active-map
              ("C-n". company-select-next)
              ("C-p". company-select-previous)
              ("M-<". company-select-first)
              ("M->". company-select-last))
  (:map company-mode-map
        ("<tab>". tab-indent-or-complete)
        ("TAB". tab-indent-or-complete)))

(use-package ido
  :ensure
  :init
  (lambda ()
    (setq
     ido-save-directory-list-file "~/.emacs.d/cache/ido.last"

     ido-ignore-buffers ;; ignore these guys
     '("\\` " "^\*Mess" "^\*Back" ".*Completion" "^\*Ido" "^\*trace"

       "^\*compilation" "^\*GTAGS" "^session\.*" "^\*")
     ido-work-directory-list '("~/" "~/Desktop" "~/Documents" "~src")
     ido-case-fold  t                 ; be case-insensitive

     ido-enable-last-directory-history t ; remember last used dirs
     ido-max-work-directory-list 30   ; should be enough
     ido-max-work-file-list      50   ; remember many
     ido-use-filename-at-point nil    ; don't use filename at point (annoying)
     ido-use-url-at-point nil         ; don't use url at point (annoying)

     ido-enable-flex-matching nil     ; don't try to be too smart
     ido-max-prospects 8              ; don't spam my minibuffer
     ido-confirm-unique-completion t  ; wait for RET, even with unique completion

     ;; when using ido, the confirmation is rather annoying...
     confirm-nonexistent-file-or-buffer nil)))

(ido-mode 'both) ;; for buffers and files
