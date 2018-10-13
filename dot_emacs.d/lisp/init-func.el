
(defun back_to_current_dir()
  (interactive)
  (setq cur_file_dir  (file-name-directory buffer-file-name))
  (cd cur_file_dir)
  (message (concat "Back to current directory: "cur_file_dir)))

(defun open-my-emacs-init-file()
  (interactive)
  (message "Load emacs.d config!")
  (cd "~/.emacs.d")
  (fzf))

(defun open-my-vim-init-file()
  (interactive)
  (message "Load vim config!")
  (cd "~/.config/nvim/")
  (fzf))

;; 重置配置文件
(defun reload_init_config_file()
  (interactive)
  (eval-buffer)
  (message "Eval-buffer Successful!!!"))

;;Mac 设置剪切板共享
(defun copy-from-osx ()
  (shell-command-to-string "pbpaste"))

(defun paste-to-osx (text &optional push)
  (let ((process-connection-type nil))
    (let ((proc (start-process "pbcopy" "*Messages*" "pbcopy")))
      (process-send-string proc text)
      (process-send-eof proc))))

(defun chandler/toggle-copy-to-osx()
  (interactive)
  (if (equal interprogram-cut-function 'paste-to-osx)
      (progn
        (setq interprogram-cut-function nil)
        (message "Copy to osx OFF")
        )
    (progn
      (setq interprogram-cut-function 'paste-to-osx)
      (message "Copy to osx ON!")
      )
    )
  )


(defun search-Document()
  (interactive)
  (cd "~/Documents/")
  (fzf))

(provide 'init-func)
