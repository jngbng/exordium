;;; init-zig.el --- Configuration for Zig            -*- lexical-binding: t -*-

;;; Commentary:
;;
;; -------------- -------------------------------------------------------
;; Key            Definition
;; -------------- -------------------------------------------------------
;; TBD            TBD
;;
;; Features:
;; - TBD

;;; Code:

(eval-when-compile
  (unless (featurep 'init-require)
    (load (file-name-concat (locate-user-emacs-file "modules") "init-require"))))
(exordium-require 'init-prefs)
(exordium-require 'init-lib)

;; (setq zig-indent-offset 2)

(use-package reformatter
  :defer t)

(defun zig--delete-compilation-window ()
  "Delete all windows showing *compilation* buffer"
  (interactive)
  (delete-windows-on "*compilation*"))

(use-package zig-mode
  ;; :ensure nil
  :defer t
  :config
  (autoload 'zig-mode "zig-mode" nil t)
  (add-to-list 'auto-mode-alist '("\\.\\(zig\\|zon\\)\\'" . zig-mode))
  ;; (add-hook 'zig-mode-hook #'lsp-deferred)
  ;; (add-hook 'compilation-filter-hook 'ansi-color-compilation-filter)

  ;; Set TERM for comint-derived modes like shell-mode
  (setq comint-terminfo-terminal "dumb-emacs-ansi")

  (advice-add 'zig--run-cmd :around
              (lambda (f cmd &optional source &rest args)
                (apply f cmd source (append '("--color" "off") args))))

  (defun zig-build-run ()
    "Create an executable from the current buffer and run it immediately."
    (interactive)
    (zig--run-cmd "build" "run" (concat "-Doptimize=" zig-run-optimization-mode)))

  :hook
  ((zig-mode . lsp-deferred)
   (zig-mode . yas-minor-mode))

  :bind (:map zig-mode-map
         ("C-c r" . #'zig-build-run)
         ("C-c C-q" . #'zig--delete-compilation-window)
         )
  )

(with-eval-after-load 'compile
  (add-to-list 'compilation-environment "TERM=dumb-emacs-ansi")
  (add-hook 'compilation-filter-hook 'ansi-color-compilation-filter))

(provide 'init-zig)

;;; init-zig.el ends here
