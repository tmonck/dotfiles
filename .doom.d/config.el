;;; $DOOMDIR/config.el -*- lexical-binding: t; -*-

;; Place your private configuration here! Remember, you do not need to run 'doom
;; sync' after modifying this file!

;; Some functionality uses this to identify you, e.g. GPG configuration, email
;; clients, file templates and snippets.
(setq user-full-name "Tom Monck"
      user-mail-address "tom.monck@dudesolutions.com")

;; Doom exposes five (optional) variables for controlling fonts in Doom. Here
;; are the three important ones:
;;
;; + `doom-font'
;; + `doom-variable-pitch-font'
;; + `doom-big-font' -- used for `doom-big-font-mode'; use this for
;;   presentations or streaming.
;;
;; They all accept either a font-spec, font string ("Input Mono-12"), or xlfd
;; font string. You generally only need these two:
;; (setq doom-font (font-spec :family "monospace" :size 12 :weight 'semi-light)
;;       doom-variable-pitch-font (font-spec :family "sans" :size 13))

;; There are two ways to load a theme. Both assume the theme is installed and
;; available. You can either set `doom-theme' or manually load a theme with the
;; `load-theme' function. The is the default: doom-one
(setq doom-theme 'doom-acario-dark)

(if (eq initial-window-system 'x)                 ; if started by emacs command or desktop file
    (toggle-frame-maximized)
  (toggle-frame-fullscreen))

;; Set magit to full screen
(setq magit-display-buffer-function `magit-display-buffer-fullframe-status-v1)

;; This determines the style of line numbers in effect. If set to `nil', line
;; numbers are disabled. For relative line numbers, set this to `relative'.
(setq display-line-numbers-type `relative)

(setq org-directory "~/org/")

(after! org
  (setq org-fontify-done-headline nil))

(setq org-journal-dir "~/org/journal/")

(after! org
  (setq org-journal-file-format "%Y%m%d"
      org-journal-date-format "%A, %d %B %Y"
      org-journal-time-format 'nil ;; this is the defau;t entry. I set it to nil since I like to have one file for the whole day and don't use timestamps in my entry
      org-journal-file-header "#+TITLE: Daily Journal\n"
      org-journal-enable-agenda-integration 't))

(after! org
  (map! :leader
        (:prefix-map ("j" . "org-journal")
         (:prefix-map ("n" . "new entries")
          :desc "New journal entry" "n" #'org-journal-new-entry
          :desc "New date journal entry" "d" #'org-journal-new-date-entry
          :desc "New scheduled journal entry" "s" #'org-journal-new-scheduled-entry)
         (:prefix-map ("o" . "open entries")
          :desc "Current journal entry" "c" #'org-journal-open-current-journal-file
          :desc "Previous journal entry" "p" #'org-journal-open-previous-entry
          :desc "Next journal entry" "n" #'org-journal-open-next-entry)
         :desc "Search journal entry" "s" #'org-journal-search-entry)))

;; (after! org (setq org-hide-emphasis-markers t))

;; (after! org
  ;; (setq org-log-done t)
  ;; (setq org-log-into-drawer t)0

(when (version<= "9.2" (org-version))
    (require 'org-tempo))

(after! org
  (add-to-list 'org-structure-template-alist '("sh" . "src sh"))
  (add-to-list 'org-structure-template-alist '("js" . "src js"))
  (add-to-list 'org-structure-template-alist '("el" . "src emacs-lisp"))
  (add-to-list 'org-structure-template-alist '("py" . "src python")))

(use-package dap-mode)
(setq dap-auto-configure-features '(sessions locals controls tooltip))

(after! dap-mode
  (map! :leader
        (:prefix-map ("d" . "dap commands")
        (:prefix-map ("d" . "dap-debug commands")
         :desc "Select a debug template to execute" "n" #'dap-debug
         :desc "Run most recently executed templated" "l" #'dap-debug-last
         :desc "Select a recent template to run" "r" #'dap-debug-recent
         :desc "Disconnect from current session" "d" #'dap-disconnect)
        (:prefix-map ("s" . "dap-debug session commands")
         :desc "Delete current session bufer" "d" #'dap-delete-session
         :desc "Delete all session buffers" "D" #'dap-delete-all-sessions)
        (:prefix-map ("b" . "dap-breakpoint commands")
         :desc "Add breakpoint" "a" #'dap-breakpoint-added
         :desc "Toggle breakpoint" "t" #'dap-breakpoint-toggle
         :desc "Add breakpoint condition" "c" #'dap-breakpoint-condition
         :desc "Add breakpoint hit condition" "h" #'dap-breakpoint-hit-condition
         :desc "Add breadkpoint log message" "l" #'dap-breakpoint-log-message
         :desc "Delete breakpoint" "d" #'dap-breakpoint-delete
         :desc "Delete all breakpoints" "D" #'dap-breakpoint-delete-all)
        :desc "dap-hydra" "h" #'dap-hydra)))

;; (dap-register-debug-template
;;  "Debug Server"
;;  (list :type "node"
;;        :request "launch"
;;        :program "${workspaceFolder}/path/to/program"
;;        :outFiles ["${workspaceFolder/path/to/out/files}"]
;;        :name "Debug Server")
;;  )

(defun efs/lsp-mode-setup ()
  (setq lsp-headerline-breadcrumb-segments '(path-up-to-project file symbols))
  (lsp-headerline-breadcrumb-mode 't))

(use-package! lsp-mode
  :commands (lsp lsp-deferred)
  :hook (lsp-mode . efs/lsp-mode-setup)
  :init
  (setq lsp-keymap-prefix "C-c l")
  :config
  (lsp-enable-which-key-integration t))

(use-package! lsp-ui
  :hook (lsp-mode . lsp-ui-mode)
  :custom
  (lsp-ui-doc-position 'bottom))

(use-package! typescript-mode
  :mode "\\.ts\\'"
  :hook (typescript-mode . lsp-deferred)
  :config
  (setq typescript-indent-level 2)
  (require 'dap-node)
  (dap-node-setup) ;; Automatically installs Node debug adapter if needed
)

(use-package! js2-mode
  :mode "\\.js\\'"
  :hook (js2-mode . lsp-deferred)
  :config
  (require 'dap-node)
  (dap-node-setup))

(use-package! vue-mode
  :mode "\\.vue\\'"
  :hook (vue-mode . lsp-deferred)
  :config
  (require 'dap-node)
  (dap-node-setup))

;; Here are some additional functions/macros that could help you configure Doom:
;;
;; - `load!' for loading external *.el files relative to this one
;; - `use-package!' for configuring packages
;; - `after!' for running code after a package has loaded
;; - `add-load-path!' for adding directories to the `load-path', relative to
;;   this file. Emacs searches the `load-path' when you load packages with
;;   `require' or `use-package'.
;; - `map!' for binding new keys
;;
;; To get information about any of these functions/macros, move the cursor over
;; the highlighted symbol at press 'K' (non-evil users must press 'C-c c k').
;; This will open documentation for it, including demos of how they are used.
;;
;; You can also try 'gd' (or 'C-c c d') to jump to their definition and see how
;; they are implemented.
