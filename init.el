;; -*- lexical-binding: t; -*-

(require 'package)
(add-to-list 'package-archives '("melpa" . "http://melpa.org/packages/") t)
(add-to-list 'package-archives '("elpa" . "http://elpa.gnu.org/packages/") t)
(package-initialize)

(put 'upcase-region 'disabled nil)
(put 'downcase-region 'disabled nil)

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(package-selected-packages
   '(smartparens edts rg git-link dired-subtree dired-collapse dired-rainbow magit diff-hl exec-path-from-shell lsp-pyright lsp-python-ms python-mode company lsp-ui lsp-mode flycheck rustic use-package)))

(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )


;; --------------------
;; -- start keybindings

(defun m/insert-line-below ()
  "Insert an empty line below the current line."
  (interactive)
  (end-of-line)
  (call-interactively 'newline-and-indent))

(defun m/copy-command ()
  (if (eq system-type 'darwin)
    "pbcopy -pboard general"
    "pc"))
    ;; "xclip -i -sel clipboard"))

(defun m/copy-region ()
  "Copy region, or from the last marker to the current cursor position."
  (interactive)
  (shell-command-on-region
   (region-beginning)
   (region-end)
   (m/copy-command)))

(defun m/copy-region-pastebin ()
  "Copy region, or from the last mark to current cursor position into a paste code."
  (interactive)
  (shell-command-on-region
   (region-beginning)
   (region-end)
   "pc"))

(defun m/copy-buffer ()
  (interactive)
  (call-interactively #'set-mark-command)
  (shell-command-on-region
   (beginning-of-buffer)
   (end-of-buffer)
   (m/copy-command))
  (call-interactively #'pop-global-mark)
  (keyboard-quit))

(defun m/scroll-down ()
  (interactive)
  (scroll-up-line))

(defun m/scroll-up ()
  (interactive)
  (scroll-down-line))

(defvar mv/diff-hl-on nil "Whether diff-hl has been toggled on or not.
Used to determine whether to reload after magit refreshes.")

(defun m/toggle-diff-hl ()
  (interactive)
  (call-interactively #'global-diff-hl-mode)
  (call-interactively #'diff-hl-dired-mode)
  (call-interactively #'diff-hl-flydiff-mode)
  (call-interactively #'diff-hl-margin-mode)
  (setq mv/diff-hl-on (not mv/diff-hl-on)))

(defun m/reload-diff-hl ()
  (interactive)
  (when mv/diff-hl-on
    (progn
      (m/toggle-diff_hl)
      (m/toggle-diff-hl))))

(defun m/open-git-link ()
  (interactive)
  (setq git-link-open-in-browser t)
  (call-interactively #'git-link)
  (setq git-link-open-in-browser nil))

;; sometimes our remotes are just named "github" since they're going
;; through our ssh config. rewrite these to github.com
(defun m/git-link-github (hostname dirname filename branch commit start end)
  (git-link-github "github.com" dirname filename branch commit start end))


(add-hook 'after-init-hook
          '(lambda ()
             (global-unset-key (kbd "C-o"))
             (global-unset-key (kbd "C-l"))
             (global-set-key (kbd "C-o") #'m/insert-line-below)
             (global-set-key (kbd "C-M-a") #'move-beginning-of-line)
             (global-set-key (kbd "C-j") #'newline-and-indent)
             (global-set-key (kbd "RET") #'newline-and-indent)
             (global-set-key (kbd "C-M-j") #'m/scroll-down)
             (global-set-key (kbd "C-M-k") #'m/scroll-up)
             (global-set-key (kbd "C-M-e") #'m/scroll-down)
             (global-set-key (kbd "C-M-y") #'m/scroll-up)
             (global-set-key (kbd "C-x C-b") #'ibuffer)
             (global-set-key (kbd "C-l e") #'tab-bar-switch-to-next-tab)
             (global-set-key (kbd "C-l E") #'tab-bar-switch-to-prev-tab)
             (global-set-key (kbd "C-x t t") #'tab-new)
             (global-set-key (kbd "C-x t u") #'tab-bar-undo-close-tab)
             (global-set-key (kbd "C-x t k") #'tab-close)
             (global-set-key (kbd "C-l L") #'global-display-line-numbers-mode)
             (global-set-key (kbd "C-l C-c") #'m/copy-region)
             (global-set-key (kbd "C-l C-p") #'m/copy-region-pastebin)
             (global-set-key (kbd "C-l g r") #'m/reload-diff-hl)
             (global-set-key (kbd "C-l g g") #'m/toggle-diff-hl)
             (global-set-key (kbd "C-l g o") #'m/open-git-link)
             (global-set-key (kbd "C-l g l") #'git-link)
             ))

;; python mode overwrites some keybindings we previously set
(add-hook 'python-mode-hook
          '(lambda ()
             (define-key python-mode-map (kbd "C-M-a") #'move-beginning-of-line)
             (define-key python-mode-map (kbd "C-M-e") #'m/scroll-down)
             ))

;; -- end keybindings
;; -----------------


;; delete trailing whitespace on save
(add-hook 'before-save-hook #'delete-trailing-whitespace)

;; hide menu bar
(menu-bar-mode -1)

;; enable tab bar
(tab-bar-mode 1)
;; and default new tabs to scratch
(setq tab-bar-new-tab-choice "*scratch*")

;; highlight cursor line, change hl-line color to blue-ish
(global-hl-line-mode 1)
(set-face-attribute 'hl-line nil :inherit nil :background "#1E4D6B")

;; only use spaces
(setq-default indent-tabs-mode nil)

;; auto insert closing quotes, parens, etc
(electric-pair-mode 1)

;; follow version-controlled symlinks, don't ask everytime
(setq vc-follow-symlinks t)

;; auto updates files when they change on disk
(global-auto-revert-mode t)

;; also auto refresh dired, but be quiet about it
(setq global-auto-revert-non-file-buffers t)
(setq auto-revert-verbose nil)

;; scroll one line an a time when cursor is close to the end
(setq-default scroll-step 1)
(setq-default scroll-margin 7)
(setq-default scroll-preserve-screen-position 1)

;; relative line numbers
(setq-default display-line-numbers-type 'relative)
(global-display-line-numbers-mode t)

;; make searches case insensitive
(setq case-fold-search t)

;; tab mods
(local-set-key (kbd "TAB") 'tab-to-tab-stop)
(setq indent-tabs-mode t)
(setq-default electric-indent-inhibit t)
(setq backward-delete-char-untabify-method 'hungry)
(setq whitespace-style '(face tabs tab-mark trailing))
(setq whitespace-display-mappings
      '((tab-mark 9 [124 9] [92 9]))) ; 124 is the ascii ID for '\|'
(global-whitespace-mode)


;; -----------------
;; -- start packages

;; make sure use-package is installed
(unless (package-installed-p 'use-package)
  (package-refresh-contents)
  (package-install 'use-package))


;; theme
(use-package zenburn-theme)
(load-theme 'zenburn t)


;; Fix $PATH
(use-package exec-path-from-shell
  :ensure
  :hook (after-init . exec-path-from-shell-initialize)
  :custom
  (exec-path-from-shell-variables
   '("PATH" "MANPATH" "LOLA_HOME"
     "PIPENV_VERBOSITY" "PIPENV_DONT_LOAD_ENV"
     "PIPENV_MAX_DEPTH" "PYENV_ROOT"
     ))
  (exec-path-from-shell-check-startup-files nil)
  (exec-path-from-shell-arguments '("-l")))
;; also, make sure shell-commands execute with bash and
;; see our bashrc so aliases are picked up
(setq shell-file-name "bash")
(setq shell-command-switch "-ic")


;; lsp config
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


;; linting
(use-package flycheck :ensure
  :config
  (add-hook 'after-init-hook 'global-flycheck-mode)
  (setq flycheck-display-errors-function nil
        flycheck-erlang-include-path '("../include")
        flycheck-erlang-library-path '()
        flycheck-check-syntax-automatically '(save)))
;;(global-flycheck-mode t) ;; enable flycheck globally


;; completions
(defun indent-or-complete ()
  (interactive)
  (if (looking-at "\\_>")
    (company-complete-common)
    (indent-according-to-mode)))

(use-package company
  :ensure
  :bind
  (:map company-active-map
        ("C-n". company-select-next)
        ("C-p". company-select-previous)
        ("M-<". company-select-first)
        ("M->". company-select-last))
  (:map company-mode-map
        ("<tab>". indent-or-complete)
        ("TAB". indent-or-complete))
  )
(global-company-mode 1)


;; open in git
(use-package git-link
  :ensure)

(eval-after-load 'git-link
 '(progn
   (add-to-list 'git-link-remote-alist
     '("^github$" m/git-link-github))
   ))


;; better buffer selection
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

(ido-mode 'both) ;; enable for buffers and files


;; python mode and lsp
(use-package python-mode :ensure)

(use-package python
  :defer t
  :ensure
  :config
  (add-hook 'python-mode-hook #'highlight-indent-guides-mode)
  ;; Redefine the python-mypy flycheck checker to account for projectile-compilation-dir
  (flycheck-define-checker python-mypy
    "Mypy syntax and type checker.  Requires mypy>=0.580.
  See URL `http://mypy-lang.org/'."
    :command ("mypy"
              "--show-column-numbers"
              (config-file "--config-file" flycheck-python-mypy-config)
              (option "--cache-dir" flycheck-python-mypy-cache-dir)
              source-original)
    :error-patterns
    ((error line-start (file-name) ":" line (optional ":" column)
            ": error:" (message) line-end)
     (warning line-start (file-name) ":" line (optional ":" column)
              ": warning:" (message) line-end)
     (info line-start (file-name) ":" line (optional ":" column)
           ": note:" (message) line-end))
    :modes python-mode
    ;; Ensure the file is saved, to work around
    ;; https://github.com/python/mypy/issues/4746.
    :predicate flycheck-buffer-saved-p
    ;; :working-directory (lambda (checker)
    ;;                      (or (projectile-compilation-dir)
    ;;                          default-directory))
    )
  (add-to-list 'flycheck-disabled-checkers 'python-flake8))

;; python lsp using pyright language server
;; requires `npm install -g pyright`
(use-package lsp-pyright
  :ensure
  :hook (python-mode . (lambda ()
                         (require 'lsp-pyright)
                         (lsp-deferred)))
  :custom
  (lsp-pyright-use-library-code-for-types t)
  (lsp-pyright-multi-root t)
  (lsp-pyright-auto-import-completions t)
  (lsp-pyright-auto-search-paths t)
  :bind
  (:map python-mode-map
        ("C-c C-d" . lsp-describe-thing-at-point)))


;; ripgrep
(use-package rg :ensure)
(rg-enable-default-bindings)


;; rust mode and lsp
;; https://robert.kra.hn/posts/2021-02-07_rust-with-emacs
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


;; open files to the same cursor position
(use-package saveplace :ensure)
(save-place-mode 1)


;; magit
(use-package magit :ensure
  :bind
    (:map magit-mode-map
          ;; global company mode means tab doesn't work.
          ;; use [o]pen instead
          ("o" . magit-section-toggle)))


;; ------------------
;; -- dired extensions

;; colorful files
(use-package dired-rainbow
  :ensure
  :config
  (progn
    (dired-rainbow-define-chmod directory "#6cb2eb" "d.*")
    (dired-rainbow-define html "#eb5286" ("css" "less" "sass" "scss" "htm" "html" "jhtm" "mht" "eml" "mustache" "xhtml"))
    (dired-rainbow-define xml "#f2d024" ("xml" "xsd" "xsl" "xslt" "wsdl" "bib" "json" "msg" "pgn" "rss" "yaml" "yml" "rdata"))
    (dired-rainbow-define document "#9561e2" ("docm" "doc" "docx" "odb" "odt" "pdb" "pdf" "ps" "rtf" "djvu" "epub" "odp" "ppt" "pptx"))
    (dired-rainbow-define markdown "#ffed4a" ("org" "etx" "info" "markdown" "md" "mkd" "nfo" "pod" "rst" "tex" "textfile" "txt"))
    (dired-rainbow-define database "#6574cd" ("xlsx" "xls" "csv" "accdb" "db" "mdb" "sqlite" "nc"))
    (dired-rainbow-define media "#de751f" ("mp3" "mp4" "MP3" "MP4" "avi" "mpeg" "mpg" "flv" "ogg" "mov" "mid" "midi" "wav" "aiff" "flac"))
    (dired-rainbow-define image "#f66d9b" ("tiff" "tif" "cdr" "gif" "ico" "jpeg" "jpg" "png" "psd" "eps" "svg"))
    (dired-rainbow-define log "#c17d11" ("log"))
    (dired-rainbow-define shell "#f6993f" ("awk" "bash" "bat" "sed" "sh" "zsh" "vim"))
    (dired-rainbow-define interpreted "#38c172" ("py" "ipynb" "rb" "pl" "t" "msql" "mysql" "pgsql" "sql" "r" "clj" "cljs" "scala" "js"))
    (dired-rainbow-define compiled "#4dc0b5" ("asm" "cl" "lisp" "el" "c" "h" "c++" "h++" "hpp" "hxx" "m" "cc" "cs" "cp" "cpp" "go" "f" "for" "ftn" "f90" "f95" "f03" "f08" "s" "rs" "hi" "hs" "pyc" ".java"))
    (dired-rainbow-define executable "#8cc4ff" ("exe" "msi"))
    (dired-rainbow-define compressed "#51d88a" ("7z" "zip" "bz2" "tgz" "txz" "gz" "xz" "z" "Z" "jar" "war" "ear" "rar" "sar" "xpi" "apk" "xz" "tar"))
    (dired-rainbow-define packaged "#faad63" ("deb" "rpm" "apk" "jad" "jar" "cab" "pak" "pk3" "vdf" "vpk" "bsp"))
    (dired-rainbow-define encrypted "#ffed4a" ("gpg" "pgp" "asc" "bfe" "enc" "signature" "sig" "p12" "pem"))
    (dired-rainbow-define fonts "#6cb2eb" ("afm" "fon" "fnt" "pfb" "pfm" "ttf" "otf"))
    (dired-rainbow-define partition "#e3342f" ("dmg" "iso" "bin" "nrg" "qcow" "toast" "vcd" "vmdk" "bak"))
    (dired-rainbow-define vc "#0074d9" ("git" "gitignore" "gitattributes" "gitmodules"))
    (dired-rainbow-define-chmod executable-unix "#38c172" "-.*x.*")
    ))

;; collapse empty dirs
(use-package dired-collapse :ensure)
(dired-collapse-mode 1)

;; show a subtree when opening dirs
(use-package dired-subtree :ensure
  :bind
  (:map dired-mode-map
        ("i". dired-subtree-toggle)
        ("o". dired-subtree-toggle)
        ("C-i". dired-subtree-toggle)
        ("C-o". dired-subtree-toggle)
        ))


;; show line diff in gutter
(use-package diff-hl :ensure)

; refresh gutter after updates
(add-hook 'magit-pre-refresh-hook #'m/reload-diff-hl)
(add-hook 'magit-post-refresh-hook #'m/reload-diff-hl)


;; better parens
(use-package smartparens :ensure)
(require 'smartparens-config)
(smartparens-global-mode 1)
(smartparens-strict-mode 1)
