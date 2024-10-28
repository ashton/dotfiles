;;; $DOOMDIR/config.el -*- lexical-binding: t; -*-

;; Place your private configuration here! Remember, you do not need to run 'doom
;; sync' after modifying this file!


;; Some functionality uses this to identify you, e.g. GPG configuration, email
;; clients, file templates and snippets. It is optional.
(setq user-full-name "Matheus Ashton"
      user-mail-address "matheusashton@gmail.com")

;; Doom exposes five (optional) variables for controlling fonts in Doom:
;;
;; - `doom-font' -- the primary font to use
;; - `doom-variable-pitch-font' -- a non-monospace font (where applicable)
;; - `doom-big-font' -- used for `doom-big-font-mode'; use this for
;;   presentations or streaming.
;; - `doom-unicode-font' -- for unicode glyphs
;; - `doom-serif-font' -- for the `fixed-pitch-serif' face
;;
;; See 'C-h v doom-font' for documentation and more examples of what they
;; accept. For example:
;;
;;(setq doom-font (font-spec :family "Fira Code" :size 12 :weight 'semi-light)
;;      doom-variable-pitch-font (font-spec :family "Fira Sans" :size 13))
(setq doom-font (font-spec :family "JetBrainsMono Nerd Font" :size 16))
(setq doom-symbol-font (font-spec :family "JetBrainsMono Nerd Font" :size 16))

;; If you or Emacs can't find your font, use 'M-x describe-font' to look them
;; up, `M-x eval-region' to execute elisp code, and 'M-x doom/reload-font' to
;; refresh your font settings. If Emacs still can't find your font, it likely
;; wasn't installed correctly. Font issues are rarely Doom issues!

;; There are two ways to load a theme. Both assume the theme is installed and
;; available. You can either set `doom-theme' or manually load a theme with the
;; `load-theme' function. This is the default:
(setq doom-theme 'doom-ayu-mirage)

;; This determines the style of line numbers in effect. If set to `nil', line
;; numbers are disabled. For relative line numbers, set this to `relative'.
(setq display-line-numbers-type t)

;; Always start maximized
(add-to-list 'initial-frame-alist '(fullscreen . maximized))

(setq read-process-output-max (* 1024 1024)
      projectile-project-search-path '("~/dev/pessoal")
      project-enable-caching nil

      evil-split-window-below t
      evil-vsplit-window-right t
      +format-on-save-enabled-modes '(dart-mode))

(add-to-list 'auto-mode-alist '("\\.repl\\'" . clojure-mode))

;; LSP config
(use-package! lsp-mode
  :commands lsp
  :config
  (add-hook 'lsp-after-apply-edits-hook (lambda (&rest _) (save-buffer)))
  (setq lsp-semantic-tokens-enable t))

(use-package! lsp-treemacs
  :config
  (setq lsp-treemacs-error-list-current-project-only t))

(use-package! clojure-mode
  :config
  (setq clojure-indent-style 'align-arguments)
  (set-popup-rule! "*cider-test-report*" :side 'right :width 0.4)
  (set-popup-rule! "^\\*cider-repl" :side 'bottom :quit nil))

(use-package! clj-refactor
  :after clojure-mode
  :config
  (set-lookup-handlers! 'clj-refactor-mode nil)
  (setq cljr-add-ns-to-blank-clj-files nil ; use lsp
        cljr-magic-require-namespaces
        '(("s"   . "schema.core")
          ("gen" . "common-test.generators")
          ("ex" . "common-core.exceptions.core")
          ("types.money" . "common-core.types.money")
          ("types.time" . "common-core.types.time")
          ("types.numeric" . "common-core.types.numeric")
          ("misc" . "common-core.misc"))))

(use-package! paredit
  :hook ((clojure-mode . paredit-mode)
         (emacs-lisp-mode . paredit-mode)))

(use-package! evil-cleverparens
  :hook ((emacs-lisp-mode . evil-cleverparens-mode)
         (clojure-mode . evil-cleverparens-mode)))

(use-package! treemacs-nerd-icons
  :after treemacs
  :config (treemacs-load-theme "nerd-icons"))

(after! projectile
  (add-to-list 'projectile-project-root-files-bottom-up "pubspec.yaml")
  (add-to-list 'projectile-project-root-files-bottom-up "BUILD")
  (add-to-list 'projectile-project-root-files-bottom-up "project.clj"))

(add-hook! 'projectile-after-switch-project-hook :append
  (treemacs-add-and-display-current-project-exclusively)
  (when (eq (treemacs-current-visibility) 'visible) (treemacs)))


(load! "+org")
(load! "+bindings")
(load! "+nubank")
