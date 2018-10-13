
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                        ;               系统相关             ;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; 允许在minibuffer中使用指令
(setq enable-recursive-minibuffers t)

;; 更新文件
(global-auto-revert-mode t)
;;编辑下选择替换
(delete-selection-mode 1)

;; 取消备份文件
(setq auto-save-default nil)
(setq make-backup-files nil)

(recentf-mode 1)
(setq recentf-max-menu-items 25)

;; 关闭报警音
(setq ring-bell-function 'ignore)

;;递归删除和递归拷贝
(setq dired-recursive-deletes 'always
      dired-recursive-copies 'always)

;;设置鼠标滚动
(setq mouse-wheel-scroll-amount '(1 ((shift) . 1))
      mouse-wheel-progressive-speed nil
      mouse-wheel-follow-mouse 't)


;;其他系统 设置剪切板共享
;; (setq x-select-enable-clipboard t)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                        ;                  UI相关            ;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(global-linum-mode 1)                   ; always show line numbers
;;高亮当前行
(global-hl-line-mode 1)
;;状态栏
(setq ns-use-srgb-colorspace nil)

;;设置行高
(setq line-spacing 3)

;;替换yes/no为y/n
(fset 'yes-or-no-p 'y-or-n-p)

;; 启动新快捷键C-x C-j 可以快速打开当前文件的目录
(setq dired-dwin-target 1)

;; 延迟加载
(with-eval-after-load 'dired (define-key dired-mode-map (kbd "RET") 'dired-find-alternate-file))
(put 'dired-find-alternate-file 'disabled nil)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                        ;               编辑相关             ;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; 关闭缩进
;; (electric-indent-mode 1)

;;设置各种文件编码
(prefer-coding-system 'utf-8)
(setq buffer-file-coding-system 'utf-8-unix
      default-file-name-coding-system 'utf-8-unix
      default-keyboard-coding-system 'utf-8-unix
      default-process-coding-system '(utf-8-unix . utf-8-unix)
      default-sendmail-coding-system 'utf-8-unix
      default-terminal-coding-system 'utf-8-unix)

(set-default 'truncate-lines t)
(setq-default tab-width 4)
(setq-default indent-tabs-mode nil)
(use-package smart-tabs-mode
  :ensure t
  :config
  (add-hook 'after-init-hook 'smart-tabs-mode)
  )

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                        ;             Ibuffer 配置           ;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

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

(provide 'init-better-default)
