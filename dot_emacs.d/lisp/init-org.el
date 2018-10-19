

(use-package org
  :defer 0.01
  :bind (("C-c a" . org-agenda))
  :config

  (setq org-ellipsis "⤵")

  ;; highlight code blocks syntax
  (setq org-src-fontify-natively  t
        org-src-tab-acts-natively t)

  (add-to-list 'org-src-lang-modes (quote ("dot" . graphviz-dot)))

  ;; more sane emphasis regex to export to HTML as substitute of Markdown
  (org-set-emph-re 'org-emphasis-regexp-components
                   '(" \t({"
                     "- \t.,:!?;)}[:multibyte:]"
                     " \t\r\n,"
                     "."
                     1))

  ;; (setq org-hide-leading-stars t)
  (setq org-log-into-drawer t)
  ;; (setq org-hide-emphasis-markers t) ;; 隐藏标记
  (setq org-emphasis-alist
        (quote (("*" bold)
                ("/" italic)
                ("_" underline)
                ("=" (:foreground "yellow" :background "black"))
                ("~" org-verbatim verbatim)
                ("+"
                 (:strike-through t))
                )))
  ;; 设置默认 Org Agenda 文件目录
  ;; (setq org-agenda-files '("~/org"))
  (setq org-directory "~/org"
        org-default-notes-file (concat org-directory "/notes.org"))

  ;; set the archive
  (setq org-archive-location "~/org/archive/%s_archive::datetree/** Archived")
  (setq org-agenda-custom-commands
        '(("Q" . "Custom queries") ;; gives label to "Q"
          ("Qa" "Archive search" search ""
           ((org-agenda-files (file-expand-wildcards "~/org/archive/*.org_archive"))))
          ;; ...other commands here
          ))


  ;; 在执行程序的时候，不需要确认
  (setq org-confirm-babel-evaluate nil)

  (setq org-todo-keywords '((sequence "TODO(t)" "WAIT(w@/!)" "|" "DONE(d!)" "CANCELED(c@)")))
  (add-hook 'org-mode-hook
            (lambda ()
              (setq org-src-ask-before-returning-to-edit-buffer nil)
              (org-indent-mode 1)))


  ;; highlight code blocks syntax in PDF export
  ;; Include the latex-exporter
  (use-package ox-latex)
  ;; Add minted to the defaults packages to include when exporting.
  (add-to-list 'org-latex-packages-alist '("" "minted"))
  (add-to-list 'org-latex-packages-alist '("" "xunicode"))
  ;; Tell the latex export to use the minted package for source
  ;; code coloration.
  (setq org-latex-listings 'minted)
  ;; Let the exporter use the -shell-escape option to let latex
  ;; execute external programs.
  ;; This obviously and can be dangerous to activate!
  (setq org-latex-pdf-process
        '("xelatex -shell-escape -interaction nonstopmode -output-directory %o %f"))

  ;; tasks management
  (setq org-log-done t)
  (setq org-clock-idle-time nil)

  ;; agenda & diary
  (setq org-agenda-include-diary t)
  (setq org-agenda-files '("~/org"))
  (setq org-agenda-inhibit-startup t)

  ;; configure the external apps to open files
  (setq org-file-apps
        '(("\\.pdf\\'" . "zathura %s")
          ("\\.gnumeric\\'" . "gnumeric %s")))

  ;; protect hidden trees for being inadvertily edited (do not work with evil)
  (setq-default org-catch-invisible-edits  'error
                org-ctrl-k-protect-subtree 'error)

  ;; show images inline
  ;; only works in GUI, but is a nice feature to have
  (when (window-system)
    (setq org-startup-with-inline-images t))
  ;; limit images width
  (setq org-image-actual-width '(800))

  ;; :::::: Org-Babel ::::::

  ;; languages supported
  (org-babel-do-load-languages
   (quote org-babel-load-languages)
   (quote (
           (emacs-lisp . t)
           (latex . t)
           (ledger . t)
           (octave . t)
           (org . t)
           (makefile . t)
           (python . t)
           (ipython . t)
           (R . t)
           (ruby . t)
           (sqlite . t)
           (sql . nil))))
  ;; (setq org-babel-python-command "python3")

  ;; refresh images after execution
  ;; (add-hook 'org-babel-after-execute-hook 'org-redisplay-inline-images)
  (add-hook 'org-babel-after-execute-hook 'org-display-inline-images 'append)
  (add-to-list 'org-latex-minted-langs '(ipython "python"))

  (defadvice org-html-paragraph (before org-html-paragraph-advice
                                        (paragraph contents info) activate)
    "Join consecutive Chinese lines into a single long line without
unwanted space when exporting org-mode to html."
    (let* ((origin-contents (ad-get-arg 1))
           (fix-regexp "[[:multibyte:]]")
           (fixed-contents
            (replace-regexp-in-string
             (concat
              "\\(" fix-regexp "\\) *\n *\\(" fix-regexp "\\)") "\\1\\2" origin-contents)))

      (ad-set-arg 1 fixed-contents)))

  (add-to-list 'org-latex-minted-langs '(ipython "python"))

  )

(use-package ob-ipython
  :ensure t
  :defer 1
  :config
  (setq org-babel-async-ipython t)
  )


(use-package org-evil
  :ensure t
  :defer 1
  :bind (
         :map evil-normal-state-map
         ("TAB" . org-cycle)
         )
  :init
  (add-hook 'org-mode-hook #'org-evil-mode)
  ;; (add-hook 'evil-org-mode-hook
  ;;           (lambda ()
  ;;             (evil-org-set-key-theme)))
  ;; (require 'evil-org-agenda)
  ;; (evil-org-agenda-set-keys)

  )

(use-package org-bullets
  :ensure t
  :defer 1
  :config
  (add-hook 'org-mode-hook (lambda () (org-bullets-mode 1)))
  )

(use-package htmlize
  :ensure t
  :defer 5
  )

(use-package org-preview-html
  :ensure t
  :defer 5
  )


(provide 'init-org)
