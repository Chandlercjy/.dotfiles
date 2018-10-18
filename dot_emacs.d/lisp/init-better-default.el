;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                        ;               系统相关             ;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(use-package dired
  :defer 1
  :config
  (put 'dired-find-alternate-file 'disabled nil)
  (define-key dired-mode-map (kbd "RET") 'dired-find-alternate-file)
  ;; 启动新快捷键C-x C-j 可以快速打开当前文件的目录
  (setq dired-dwin-target 1)

  ;;递归删除和递归拷贝
  (setq dired-recursive-deletes 'always
        dired-recursive-copies 'always)

  ;; 其他
  ;; 允许在minibuffer中使用指令
  (setq enable-recursive-minibuffers t)

  ;; 更新文件
  (add-hook 'prog-mode-hook #'auto-revert-mode)

  ;; 取消备份文件
  (setq auto-save-default nil)
  (setq make-backup-files nil)

  (use-package recentf
    ;; :hook(prog-mode . recentf-mode)
    :defer 3
    :config
    (setq recentf-max-menu-items 25)
    )

  ;; 关闭报警音
  (setq ring-bell-function 'ignore)

  ;;设置鼠标滚动
  (setq mouse-wheel-scroll-amount '(1 ((shift) . 1))
        mouse-wheel-progressive-speed nil
        mouse-wheel-follow-mouse 't)
  )


;;其他系统 设置剪切板共享
;; (setq x-select-enable-clipboard t)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                        ;                  UI相关            ;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                        ;               编辑相关             ;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; 关闭缩进
;; (electric-indent-mode 1)

(use-package smart-tabs-mode
  :ensure t
  :defer 1
  :hook (prog-mode . smart-tabs-mode)
  :config
  (setq-default tab-width 4)
  (setq-default indent-tabs-mode nil)
  (set-default 'truncate-lines t)

  ;;设置各种文件编码
  (prefer-coding-system 'utf-8)
  (setq buffer-file-coding-system 'utf-8-unix
        default-file-name-coding-system 'utf-8-unix
        default-keyboard-coding-system 'utf-8-unix
        default-process-coding-system '(utf-8-unix . utf-8-unix)
        default-sendmail-coding-system 'utf-8-unix
        default-terminal-coding-system 'utf-8-unix)

  (global-linum-mode 1)                   ; always show line numbers
  ;;高亮当前行
  (global-hl-line-mode 1)
  ;;状态栏
  (setq ns-use-srgb-colorspace nil)

  ;;设置行高
  (setq line-spacing 3)

  ;;替换yes/no为y/n
  (fset 'yes-or-no-p 'y-or-n-p)
  )

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                        ;             Ibuffer 配置           ;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(use-package ibuffer
  :defer 1
  :config
  (setq ibuffer-saved-filter-groups
        (quote (("default"
                 ("dired" (mode . dired-mode))
                 ("org" (name . "^.*org$"))
                 ("shell" (or
                           (mode . eshell-mode)
                           (mode . shell-mode)
                           (mode . term-mode)
                           )
                  )
                 ("programming" (or
                                 (mode . python-mode)
                                 (mode . emacs-lisp-mode)
                                 (mode . typescript-mode)
                                 (mode . c++-mode)
                                 )
                  )
                 ("emacs" (or
                           (name . "^\\*scratch\\*$")
                           (name . "^\\*Messages\\*$")))
                 ))))

  (add-hook 'ibuffer-mode-hook
            (lambda ()
              (ibuffer-auto-mode 1)
              (ibuffer-switch-to-saved-filter-groups "default")))

  ;; don't show these
  ;;(add-to-list 'ibuffer-never-show-predicates "zowie")
  ;; Don't show filter groups if there are no buffers in that group
  (setq ibuffer-show-empty-filter-groups nil)

  ;; Don't ask for confirmation to delete marked buffers
  (setq ibuffer-expert t)


  )

(provide 'init-better-default)
