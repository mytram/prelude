;;; Code:

(defun kill-dired-buffers ()
  "Kill dired buffers."
  (interactive)
  (mapc (lambda (buffer)
          (when (eq 'dired-mode (buffer-local-value 'major-mode buffer))
            (kill-buffer buffer)))
        (buffer-list)))

(defun gitlab-eshells()
  "Open multiple eshells."
  (interactive)
  (dolist (e '("rails" "ui" "sandbox" "sh"))
    (let ((buffer-name (concat "*gitlab-" e "*")))
      (unless (get-buffer buffer-name)
        (eshell)
        (with-current-buffer "*eshell*"
          (insert "cd ~/gitlab")
          (eshell-send-input)
          (rename-buffer buffer-name))))))

(defun gitlab-shells()
  "Open multiple shells"
  (interactive)
  (progn (shell "*gitlab-web-app*")
         (process-send-string nil "cd ~/gitlab\n"))
  (progn (shell "*gitlab-sh-rails*")
         (process-send-string nil "cd ~/gitlab\n"))
  (progn (shell "*gitlab-sh-ui*")
         (process-send-string nil "cd ~/gitlab\n"))
  (progn (shell "*gitlab-sh*")
         (process-send-string nil "cd ~/gitlab\n"))
  (progn (shell "*gitlab-sandbox*")
         (process-send-string nil "cd ~/gitlab\n")))

(defun github-shells()
  "Open multiple shells"
  (interactive)
  (progn (shell "*github-web-app*")
         (process-send-string nil "cd ~/github\n"))
  (progn (shell "*github-sh-rails*")
         (process-send-string nil "cd ~/github\n"))
  (progn (shell "*github-sh-ui*")
         (process-send-string nil "cd ~/github\n"))
  (progn (shell "*github-sh*")
         (process-send-string nil "cd ~/github\n"))
  (progn (shell "*github-sandbox*")
         (process-send-string nil "cd ~/github\n")))

;; Fonts
(defun dot-set-font (font-name font-size)
  "Set my FONT-NAME with FONT-SIZE."
  (let ((my-preferred-font font-name))
    (set-frame-font (concat my-preferred-font ":pixelsize=" font-size))))

(defun small-font ()
  "Set small font."
  (interactive)
  (dot-set-font "Hack Nerd Font Mono" "15"))
                                        ; (dot-sEt-Font "Source Code Pro for Powerline" "16"))
  ; (dot-set-font "Ubuntu Mono derivative Powerline" "14"))
                                        ;(dot-set-font "Source code Pro for Power line", "14"))

(defun big-font ()
  "Set big font."
  (interactive)
  ; (dot-set-font "Source Code Pro for Powerline" "16"))
  (dot-set-font "Hack Nerd Font Mono" "16"))
                                        ; (dot-set-font "Ubuntu Mono derivative Powerline" "15"))

; (big-font)

(defun large-font ()
  "Set big font."
  (interactive)
;  (dot-set-font "Ubuntu Mono derivative Powerline" "17"))
  (dot-set-font "Hack Nerd Font Mono" "18"))

(big-font)

;;
(global-set-key (kbd "C-x \\") 'align-regexp)
(global-set-key (kbd "C-x rp") 'replace-regexp)

(require 'whitespace)
(setq whitespace-line-column 160) ;; limit line length
(setq whitespace-style '(face lines-tail))

; (require 'multiple-cursors)
; (global-set-key (kbd "C-c m c") 'mc/edit-lines)

(setq markdown-command "/usr/local/bin/pandoc")

(provide 'my-utils)
;;; my-utils.el ends here
