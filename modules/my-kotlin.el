(require 'prelude-programming)

(prelude-require-packages '(flycheck-kotlin gradle-mode))

(with-eval-after-load 'kotlin-mode
  (defun my-kotlin-mode-defaults ()
    (setq whitespace-line-column 120)
    (flycheck-kotlin-setup)
    (flycheck-mode +1)
    (gradle-mode +1)
    (auto-fill-mode +1)
    (setf gradle-use-gradlew t)
    (setf gradle-gradlew-executable "./gradlew")
    (setq kotlin-tab-width 4)
    (subword-mode +1))
  (setq my-kotlin-mode-hook 'my-kotlin-mode-defaults)
  (add-hook 'kotlin-mode-hook (lambda ()
                                (run-hooks 'my-kotlin-mode-hook))))
