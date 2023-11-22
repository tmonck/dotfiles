

;;; $DOOMDIR/config.el -*- lexical-binding: t; -*-

;; DO NOT EDIT THIS FILE DIRECTLY!
;; This file is auto-generated from ../doom.org

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

;; Or set it to `:none' to disable formatting
(setq-hook! 'nxml-mode-hook +format-with :none)

;; Place your private configuration here! Remember, you do not need to run 'doom
;; sync' after modifying this file!

;; Some functionality uses this to identify you, e.g. GPG configuration, email
;; clients, file templates and snippets.
;; (setq user-full-name "John Doe"
;;      user-mail-address "john@doe.com")
(setq user-full-name "Tom Monck"
      user-mail-address "tom@monck.info")

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
;;  doom-variable-pitch-font (font-spec :family "sans" :size 13))
;; (setq doom-font (font-spec :family "JetBrains Mono")
;;       doom-variable-pitch-font (font-spec :family "DejaVu Sans"))

(use-package! nerd-icons)
(use-package! treemacs-nerd-icons
  :config
  (treemacs-load-theme "nerd-icons"))
(setq doom-themes-treemacs-theme "nerd-icons")
(setq doom-themes-treemacs-theme "Default")



;; There are two ways to load a theme. Both assume the theme is installed and
;; available. You can either set `doom-theme' or manually load a theme with the
;; `load-theme' function. The is the default: doom-one
;; (setq doom-theme 'doom-one)
;;(setq doom-theme 'doom-acario-dark)
 (setq doom-theme 'doom-material-dark)
;; (setq doom-theme 'doom-ir-black)
;; (setq doom-theme 'doom-moonlight)
;; (setq doom-theme 'doom-challenger-deep)

(use-package! treemacs-all-the-icons )
(setq doom-themes-treemacs-theme "Default")

(use-package! treemacs-icons-dired)

(after! dired
  (treemacs-icons-dired-enable-once)
  )

(if (eq initial-window-system 'x)                 ; if started by emacs command or desktop file
    (toggle-frame-maximized)
  (toggle-frame-fullscreen))

(doom/set-frame-opacity 90)

;; Set magit to full screen
(setq magit-display-buffer-function `magit-display-buffer-fullframe-status-v1)

(setq display-line-numbers-type `relative)

;; (setq ansible-vault-password-file 'nil)

(setq org-directory "~/org/")

;; (setq org-agenda-files (directory-files-recursively "~/org" "\\`\\\(\\.org\\\|[0-9]\\\{8\\\}\\\(\\.gpg\\\)?\\\)\\'"))
;; (setq org-agenda-file-regexp "\\.org$")

(require 'org-faces)

(dolist (face '((org-level-1 . 1.2)
                (org-level-2 . 1.1)
                (org-level-3 . 1.05)
                (org-level-4 . 1.0)
                (org-level-5 . 1.1)
                (org-level-6 . 1.1)
                (org-level-7 . 1.1)
                (org-level-8 . 1.1)))
  (set-face-attribute (car face) nil :font "DejaVu Sans" :weight 'medium :height (cdr face)))
;; Make the document title a bit bigger
(set-face-attribute 'org-document-title nil :font "DejaVu Sans" :weight 'bold :height 1.3)

;; Make sure certain org faces use the fixed-pitch face when variable-pitch-mode is on
(set-face-attribute 'org-block nil :foreground nil :inherit 'fixed-pitch)
(set-face-attribute 'org-table nil :inherit 'fixed-pitch)
(set-face-attribute 'org-formula nil :inherit 'fixed-pitch)
(set-face-attribute 'org-code nil :inherit '(shadow fixed-pitch))
(set-face-attribute 'org-verbatim nil :inherit '(shadow fixed-pitch))
(set-face-attribute 'org-special-keyword nil :inherit '(font-lock-comment-face fixed-pitch))
(set-face-attribute 'org-meta-line nil :inherit '(font-lock-comment-face fixed-pitch))
(set-face-attribute 'org-checkbox nil :inherit 'fixed-pitch)

(setq org-journal-dir "~/org/journal/")

(after! org
  (setq org-journal-file-format "%Y%m%d"
      org-journal-date-format "%A, %d %B %Y"
      org-journal-time-format 'nil ;; this is the defau;t entry. I set it to nil since I like to have one file for the whole day and don't use timestamps in my entry
      org-journal-file-header "#+TITLE: %A, %d %B %Y Daily Journal\nTreat yourself better today\n* Daily Questions\n1. On a scale of 1-10 how positive am I feeling?\n2. What is today's Goal?\n** Thinks to remember\nYou don't have to do something you get to.\nYou don't need todo something you want to.\nEnsure you understand the What and the Why, then have a generalized plan."
      ;; org-journal-file-header "#+TITLE: Daily Journal\nTreat yourself better today\n* Daily Questions\n1. On a scale of 1-10 how positive am I feeling?\n2. What is today's Goal?\n** Thinks to remember\nYou don't have to do something you get to.\nYou don't need todo something you want to.\nEnsure you understand the What and the Why, then have a generalized plan.\n* [/] TODOs\n** TODO\n* Meetings"
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

(let ((roamdir '"~/dsmonckcrazy/toms_files/roamNotes"))
(use-package! org-roam
  :init
  (setq org-roam-directory roamdir)
  (setq org-roam-v2-ack 't)
  )
)

(setq org-roam-capture-templates
'(("d" "default" plain
   "%?"
   :target (file+head "%<%Y%m%d%H%M%S>-${slug}.org" "#+title: ${title}\n#+category: ${title}")
  :unnarrowed t)
 ("l" "programing languages" plain
   "* Characteristics\n\n- Family: %?\n- Inspired by: \n\n*Reference:\n\n"
  :target (file+head "%<%Y%m%d%H%M%S>-${slug}.org" "#+title: ${title}")
  :unnarrowed t)
 ("p" "project" plain
  "* Goals\n\n%?\n* Tasks\n\n** TODO Add initial tasks\n\n* Dates"
  :target (file+head "%<%Y%m%d%H%M%S>-${slug}.org" "#+title: ${title}\n#+category: ${title}\n#+filetags: Project")
  :unnarrowed t)
 ))

(setq org-roam-dailies-directory "journals/")
(setq org-roam-dailies-capture-templates
      '(("d" "default" entry "* %<%I:%M %p>: %?"
         :if-new (file+head "%<%Y-%m-%d>.org" "#+TITLE: %<%A, %d %B %Y>\n#+filetags: journal\nTreat yourself better today\n* Daily Questions\n1. On a scale of 1-10 how positive am I feeling?\n2. What is today's Goal?\n** Thinks to remember\nYou don't have to do something you get to.\nYou don't need todo something you want to.\nEnsure you understand the What and the Why, then have a generalized plan.\n* [/] TODOs\n** TODO\n* Meetings"))))

(after! org-roam
  (map! :leader
        (:prefix-map ("r" . "org-roam")
         (:prefix-map ("n" . "new")
          (:prefix-map ("d" . "dailies")
           :desc "Today" "c" #'org-roam-dailies-capture-today
           :desc "Tomorrow" "t" #'org-roam-dailies-capture-tomorrow
           :desc "Yesterday" "y" #'org-roam-dailies-capture-yesterday)
          (:prefix-map ("n" . "notes")
           :desc "Find" "f" #'org-roam-node-find
           :desc "Insert" "i" #'org-roam-node-insert)
          ))))

(use-package! org-auto-tangle
  :defer t
  :hook (org-mode . org-auto-tangle-mode)
  :config
  (setq org-auto-tangle-default t))

(require 'ox-confluence)

(use-package! org-jira)
(setq org-jira-working-dir "~/org/jira")

;;(setq jiralib-url "https://bandwidth-jira.atlassian.net")

(after! auth-source
  (setq auth-sources (nreverse auth-sources)))

;; (defun efs/presentation-setup ()
;;   ;; Hide the mode line
;;   ;; (hide-mode-line-mode 1)

;;   ;; Display images inline
;;   (org-display-inline-images) ;; Can also use org-startup-with-inline-images

;;   ;; Scale the text.  The next line is for basic scaling:
;;   (setq text-scale-mode-amount 3)
;;   (text-scale-mode 1))
;; (defun efs/presentation-end ()
;;   ;; Show the mode line again
;;   ;; (hide-mode-line-mode 0)

;;   ;; Turn off text scale mode (or use the next line if you didn't use text-scale-mode)
;;   (text-scale-mode 0))

;;   ;; If you use face-remapping-alist, this clears the scaling:
;;   ;; (setq-local face-remapping-alist '((default variable-pitch default))))
;; (use-package! org-tree-slide
;;   :hook ((org-tree-slide-play . efs/presentation-setup)
;;          (org-tree-slide-stop . efs/presentation-end))
;;   ;; (add-hook 'org-tree-slide-play-hook #'+org-present-hide-blocks-h)
;;   :config
;;   (when (featurep! :editor evil)
;;     (map! :map org-tree-slide-mode-map
;;           :n [C-right] #'org-tree-slide-move-next-tree
;;           :n [C-left]  #'org-tree-slide-move-previous-tree)
;;     (add-hook 'org-tree-slide-mode-hook #'evil-normalize-keymaps))
;;   :custom
;;   (org-tree-slide-slide-in-effect t)
;;   (org-tree-slide-activate-message "Presentation started!")
;;   (org-tree-slide-deactivate-message "Presentation finished!")
;;   (org-tree-slide-header t)
;;   (org-tree-slide-breadcrumbs " > ")
;;   (org-image-actual-width nil))

;; Configure fill width
;; (setq visual-fill-column-width 110
;;       visual-fill-column-center-text t)

;; ;; Function to house the modifications for org-present to make it look nice when it starts
;; (defun my/org-present-start ()
;;   ;; Tweak font sizes
;;   (setq-local face-remapping-alist '((default (:height 1.5) variable-pitch)
;;                                      (header-line (:height 4.0) variable-pitch)
;;                                      (org-document-title (:height 1.75) org-document-title)
;;                                      (org-code (:height 1.55) org-code)
;;                                      (org-verbatim (:height 1.55) org-verbatim)
;;                                      (org-block (:height 1.25) org-block)
;;                                      (org-block-begin-line (:height 0.7) org-block)))

;;   ;; Set a blank header line string to create blank space at the top
;;   (setq header-line-format " ")

;;   ;; Since we are presenting let's hide the emphasis markers to make things a little prettier
;;   (setq org-hide-emphasis-markers t)

;;   ;; Display inline images automatically
;;   (org-display-inline-images)

;;   ;; Center the presentation and wrap lines
;;   (visual-fill-column-mode 1)
;;   (visual-line-mode 1))

;; ;; Undo the presentation setup when we end the presentation
;; (defun my/org-present-end ()
;;   ;; Reset font customizations
;;   (setq-local face-remapping-alist '((default variable-pitch default)))

;;   ;; Clear the header line string so that it isn't displayed
;;   (setq header-line-format nil)

;;   ;; Stop displaying inline images
;;   (org-remove-inline-images)
;;   ;; Stop centering the document
;;   (visual-fill-column-mode 0)
;;   (visual-line-mode 0))

;; ;; Register hooks with org-present
;; (use-package! org-present
;;   :commands org-present-mode
;;   ;; :bind-keymap
;;   ;; ("SPC" . org-present-mode-keymap)
;;   :hook ((org-present-mode . my/org-present-start)
;;          (org-present-mode-quit . my/org-present-end)))
;; ;; (after! org-present-mode
;; ;;   (when (featurep! :editor evil)
;; ;;     (map! :map org-present-mode-keymap
;; ;;           :n [C-right] #'org-present-next
;; ;;           :n [C-left]  #'org-present-prev))
;; ;;   )

(use-package! org-pandoc-import :after org)

(after! org
  (setq org-fontify-done-headline nil))

;; (after! org (setq org-hide-emphasis-markers t))

(after! org
  (setq org-log-done t)
  (setq org-log-into-drawer t))

(when (version<= "9.2" (org-version))
    (require 'org-tempo))

(after! org
  (add-to-list 'org-structure-template-alist '("sh" . "src sh"))
  (add-to-list 'org-structure-template-alist '("js" . "src js"))
  (add-to-list 'org-structure-template-alist '("el" . "src emacs-lisp"))
  (add-to-list 'org-structure-template-alist '("py" . "src python")))

(use-package! lsp-grammarly
  :hook (text-mode . (lambda()
                       (require 'lsp-grammarly)
                       (lsp))))

(setq langtool-bin "/opt/homebrew/bin/languagetool")

(use-package! dap-mode)
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

;; Use shopify-cli / theme-check-language-server for Shopify's liquid syntax
;; (with-eval-after-load 'lsp-mode
;;   (add-to-list 'lsp-language-id-configuration
;;     '(shopify-mode . "shopify"))

  ;; (lsp-register-client
  ;;   (make-lsp-client :new-connection (lsp-stdio-connection "actions-languageserver")
  ;;                    :activation-fn (lsp-activate-on "yaml")
  ;;                    :server-id 'actions-languageserver))

;;(lsp-generate-settings "/Users/tmonck/code/languageservices/package.json" 'lsp-gha)

(use-package! lsp-ui
  :hook (lsp-mode . lsp-ui-mode)
  :custom
  (lsp-ui-doc-position 'bottom))

(use-package! python-mode
  :mode "\\.py\\'"
  :hook (python-mode . lsp-deferred))

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

;; Add a hook?
(use-package! go-mode
  :mode "\\.go\\'"
  ;; :hook (go-mode . #'lsp-deferred)
  :config
  (require 'dap-go)
  (dap-go-setup))

;; (defun lsp-go-install-save-hooks ()
;;   (add-hook 'before-save-hook #'lsp-format-buffer t t)
;;   (add-hook 'before-save-hook #'lsp-organize-imports t t))
;; (add-hook 'go-mode-hook #'lsp-go-install-save-hooks)
(setq lsp-go-build-flags '["-tags=integration"])

(use-package! vue-mode
  :mode "\\.vue\\'"
  :hook (vue-mode . lsp-deferred)
  :config
  (require 'dap-node)
  (dap-node-setup))

(use-package! go-mode
  :mode "\\.go\\'"
  :config
  (require 'dap-go)
  (dap-go-setup))

(add-to-list 'auto-mode-alist '("\\.bash_aliases\\'" . sh-mode))
(add-to-list 'auto-mode-alist '("\\.bash_colors\\'" . sh-mode))
;; (add-to-list '+format-on-save-enabled-modes (not ("yaml-mode")))

(setq workspaces-on-switch-project-behavior 't)

(use-package! copilot
  :hook (prog-mode . copilot-mode)
  :bind (:map copilot-completion-map
              ("M-]" . 'copilot-next-completion)
              ("<t  ab>" . 'copilot-accept-completion)
              ("TAB" . 'copilot-accept-completion)
              ("C-TAB" . 'copilot-accept-completion-by-word)
              ("C-<tab>" . 'copilot-accept-completion-by-word)))
