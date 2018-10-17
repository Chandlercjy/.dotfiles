;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                        ;              Theme 主题            ;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Ps: GUI下的 One-dark 更友好
(use-package atom-one-dark-theme
  :ensure t
  :config
  (load-theme 'atom-one-dark t)
  ;; 修复终端下显示颜色过深问题
  (add-to-list 'default-frame-alist '(background-color . "#282d3d")))
(set-background-color "#282d3d")


;; (use-package doom-themes
;;   :ensure t
;;   :config
;;   ;; (load-theme 'doom-opera t)
;;   (load-theme 'doom-one t)
;;   )

;; (use-package zenburn-theme
;;   :ensure t
;;   :config
;;   (load-theme 'zenburn t)
;;   )


;; (use-package color-theme-approximate
;;   :ensure t
;;   :config
;;   (color-theme-approximate-on)
;;   )
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                        ;                主界面              ;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(use-package linum-relative
  :ensure t
  :config
  (global-linum-mode 1)
  (linum-relative-global-mode 1)
  )

(scroll-bar-mode -1)
(tool-bar-mode -1)
(menu-bar-mode 0)

;;去掉边框
(set-face-attribute 'fringe nil
                    :foreground nil
                    :background nil)
(set-frame-parameter nil 'internal-border-width 0)
(set-window-buffer nil (current-buffer))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                        ;                状态栏              ;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(display-time-mode 1) ;; 常显
(setq display-time-24hr-format t) ;;格式

(use-package spaceline
  :ensure t
  :config
  (spaceline-spacemacs-theme)
  (setq spaceline-highlight-face-func 'spaceline-highlight-face-evil-state)
  (set-face-attribute 'spaceline-evil-normal nil :background "SkyBlue2")
  (set-face-attribute 'spaceline-evil-emacs nil :background "DarkGoldenrod2")
  (set-face-attribute 'spaceline-evil-insert nil :background "#8de461")
  (set-face-attribute 'spaceline-evil-replace nil :background "#ec7870")
  (set-face-attribute 'spaceline-evil-motion nil :background "#plum3")
  (set-face-attribute 'spaceline-evil-visual nil :background "#f7c58f")
  )


;;;; Rich Minority
(use-package rich-minority
  :ensure t
  :config
  (progn
    (setq rm-blacklist
          '(" WK"        ;which-key
            " hc"        ;hardcore mode
            " AC"        ;auto-complete
            " vl"        ;global visual line mode enabled
            " Wrap"      ;shows up if visual-line-mode is enabled for that buffer
            " Omit"      ;omit mode in dired
            " yas"       ;yasnippet
            " drag"      ;drag-stuff-mode
            " VHl"       ;volatile highlights
            " ctagsU"    ;ctags update
            " Undo-Tree" ;undo tree
            " wr"        ;Wrap Region
            " SliNav"    ;elisp-slime-nav
            " Fly"       ;Flycheck
            " PgLn"      ;page-line-break
            " ElDoc"     ;eldoc
            " GG"        ;ggtags
            " hs"        ;hideshow
            " hs+"       ;
            " ez-esc"    ;easy-escape
            " ivy"       ;ivy
            " h"         ;hungry-delete-mode
            " (*)"       ;beacon
            ))
    (setq rm-text-properties '(("\\` Ovwrt\\'" 'face 'font-lock-warning-face) ;Overwrite
                               ("\\` mc:[0-9]+ *\\'" 'face 'font-lock-keyword-face) ;Multiple cursors
                               ("\\` rk\\'" 'display (propertize "​[]" 'face 'font-lock-warning-face)) ;Region bindings
                               \\\

                               ("\\` Abbrev\\'" 'display "​@")   ;Abbrev
                               ("\\` Ind\\'"    'display "​*>")  ;org indent
                               ("\\` Outl\\'"   'display "​ø")   ;outline
                               ("\\` Server\\'" 'display "​Σ")   ;Server
                               ("\\` μ\\'"      'display "​μ")   ;modi-mode
                               ("\\` Wg\\'"     'display "​w")   ;writegood
                               ("\\` Vis\\'"    'display "​V")   ;visible-mod
                               ("\\` Temp\\'"   'display "​t"))) ;temp-mode
    (with-eval-after-load 'setup-font-check
      (if font-symbola-p
          (progn
            (add-to-list 'rm-text-properties '("\\` Hi\\'"   'display "​🞵")) ;Hi-Lock
            (add-to-list 'rm-text-properties '("\\` Tail\\'" 'display "​🢛")) ;Auto revert tail
            (add-to-list 'rm-text-properties '("\\` =>\\'"   'display "​➠")) ;aggressive indent
            (add-to-list 'rm-text-properties '("\\` ARev\\'" 'display "​⭮")) ;auto revert
            (add-to-list 'rm-text-properties '("\\` Fill\\'" 'display "​⮒"))) ;auto fill
        (progn
          (add-to-list 'rm-text-properties '("\\` Hi\\'"   'display "​H"))
          (add-to-list 'rm-text-properties '("\\` Tail\\'" 'display "​Tail."))
          (add-to-list 'rm-text-properties '("\\` =>\\'"   'display "​aI."))
          (add-to-list 'rm-text-properties '("\\` ARev\\'" 'display "​aR."))
          (add-to-list 'rm-text-properties '("\\` Fill\\'" 'display "​aF.")))))))

(setq evil-normal-state-tag   (propertize " <NORMAL> " 'face '((:background "SkyBlue2" :foreground "#282d3d")))
      evil-emacs-state-tag    (propertize " <EMACS> " 'face '((:background "Darkgoldenrod2"  :foreground "black")))
      evil-insert-state-tag   (propertize " <INSERT> " 'face '((:background "#8de461"    :foreground "#282d3d")))
      evil-replace-state-tag  (propertize " <REPLACE> " 'face '((:background "#ec7870"      :foreground "#282d3d")))
      evil-motion-state-tag   (propertize " <MOTION> " 'face '((:background "orange"          :foreground "#282d3d")))
      evil-visual-state-tag   (propertize " <VISUAL> " 'face '((:background "#f7c58f"           :foreground "#282d3d")))
      evil-operator-state-tag (propertize " <OPERATOR> " 'face '((:background "SkyBlue2"    :foreground "#282d3d")))
      )

(set-face-foreground 'mode-line "#afabab")
(set-face-background 'mode-line "black")
(set-face-background 'mode-line-inactive "#2b323d")


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                        ;               开始界面             ;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(use-package dashboard
  :ensure t
  :config (setq dashboard-banners-directory "~/.emacs.d/banner/")
  (setq dashboard-startup-banner 666)
  (dashboard-setup-startup-hook)
  (setq dashboard-items '((recents  . 5)
                          (bookmarks . 5)
                          (agenda . 5)
                          (registers . 5)
                          (projects . 5)))
  (setq dashboard-banner-logo-title ""))

(setq initial-buffer-choice (lambda () (get-buffer "*dashboard*")))



;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                        ;                文件树               ;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;


(use-package treemacs
  :ensure t
  :defer t
  :init
  (with-eval-after-load 'winum
    (define-key winum-keymap (kbd "M-0") #'treemacs-select-window))
  :config
  (progn
    (setq treemacs-collapse-dirs              (if (executable-find "python") 3 0)
          treemacs-deferred-git-apply-delay   0.5
          treemacs-display-in-side-window     t
          treemacs-file-event-delay           5000
          treemacs-file-follow-delay          0.2
          treemacs-follow-after-init          t
          treemacs-follow-recenter-distance   0.1
          treemacs-goto-tag-strategy          'refetch-index
          treemacs-indentation                2
          treemacs-indentation-string         " "
          treemacs-is-never-other-window      nil
          treemacs-no-png-images              nil
          treemacs-project-follow-cleanup     nil
          treemacs-persist-file               (expand-file-name ".cache/treemacs-persist" user-emacs-directory)
          treemacs-recenter-after-file-follow nil
          treemacs-recenter-after-tag-follow  nil
          treemacs-show-hidden-files          t
          treemacs-silent-filewatch           nil
          treemacs-silent-refresh             nil
          treemacs-sorting                    'alphabetic-desc
          treemacs-space-between-root-nodes   t
          treemacs-tag-follow-cleanup         t
          treemacs-tag-follow-delay           1.5
          treemacs-width                      35)

    ;; The default width and height of the icons is 22 pixels. If you are
    ;; using a Hi-DPI display, uncomment this to double the icon size.
    ;;(treemacs-resize-icons 44)

    (treemacs-follow-mode t)
    (treemacs-filewatch-mode t)
    (treemacs-fringe-indicator-mode t)
    (pcase (cons (not (null (executable-find "git")))
                 (not (null (executable-find "python3"))))
      (`(t . t)
       (treemacs-git-mode 'extended))
      (`(t . _)
       (treemacs-git-mode 'simple))))
  (setq treemacs-icon-root (propertize "* " 'face 'treemacs-root-face))

  :bind
  (:map global-map
        ("<f2>"   . treemacs)
        ("M-0"       . treemacs-select-window)
        ("C-x t 1"   . treemacs-delete-other-windows)
        ("C-x t B"   . treemacs-bookmark)
        ("C-x t C-t" . treemacs-find-file)
        ("C-x t M-t" . treemacs-find-tag))

  )

(use-package treemacs-evil
  :ensure t
  :after treemacs evil
  :config
  (evil-define-key 'treemacs treemacs-mode-map (kbd "TAB") #'treemacs-TAB-action)
  (evil-define-key 'treemacs treemacs-mode-map (kbd "h") #'treemacs-TAB-action)
  (evil-define-key 'treemacs treemacs-mode-map (kbd "l") #'treemacs-TAB-action)
  (evil-define-key 'treemacs treemacs-mode-map (kbd ".") #'treemacs-toggle-show-dotfiles)
  )

(use-package treemacs-projectile
  :ensure t
  :after treemacs projectile)


(provide 'init-ui)
