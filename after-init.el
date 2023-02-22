;;; after-init.el -- override key binding

;;; M-x all-the-icons-install-fonts

;;; buffer-move
(use-package init-buffer-move :ensure nil)

(use-package init-rect-mark :ensure nil)

(use-package init-eshell-toggle :ensure nil)

(use-package init-korean :ensure nil)

(use-package init-editorconfig :ensure nil)

(use-package init-ffip :ensure nil)

(use-package init-jbseo :ensure nil)

(use-package helm-ls-git)

;; grep 에서 헤더 없에기
;; https://stackoverflow.com/questions/16122801/remove-header-information-from-rgrep-grep-output-in-emacs
;; You can later widen to reveal these lines again with C-xnw.

(defun delete-grep-header ()
  (save-excursion
    (with-current-buffer grep-last-buffer
      (goto-line 5)
      (narrow-to-region (point) (point-max)))))

(defadvice grep (after delete-grep-header activate) (delete-grep-header))
(defadvice rgrep (after delete-grep-header activate) (delete-grep-header))

;; (global-set-key (kbd "C-M-g") 'rgrep)

;; Magit
(global-set-key (kbd "C-x g") 'magit-status)

;; helm
(global-set-key [remap ibuffer] 'helm-buffers-list)
(global-set-key (kbd "C-x C-p") 'helm-browse-project)



(defun up-down-case-char ()
  ;; mark & get cursor-char
  (interactive)
  (set-mark-command ())
  (forward-char 1)
  (let ((myStr (buffer-substring (region-beginning) (region-end))))
    ;; make upper-case selected region
    (if (string-equal myStr (upcase myStr))
        (downcase-region (region-beginning) (region-end))
      (upcase-region (region-beginning) (region-end)))))

(global-set-key [(control ?`)] 'up-down-case-char)


(defun other-window-reverse (&optional _beg _end)
  "Nativate window back"
  (interactive)
  (other-window -1))

(global-set-key (kbd "C->") 'other-window)
(global-set-key (kbd "C-<") 'other-window-reverse)


;;; C-[ 세번 누르면 ESC 새번 누른 것과 같은 효과인데, keyboard-escape-quit가 실행되면서 프레임 분할이 다 꺼짐. 짜증나니 없애버림.
(global-unset-key (kbd "M-ESC ESC"))


;; 왼쪽 윈도우를 App 키로 윈도우에서 remap 하고, App을 Super키로 쓴다.
(setq w32-pass-apps-to-system nil)
(setq w32-apps-modifier 'super)

(when (member "Symbola" (font-family-list))
  (set-fontset-font t 'unicode "Symbola" nil 'prepend))

; expend all tab to spaces
;; no tabs by default. modes that really need tabs should enable
;; indent-tabs-mode explicitly. makefile-mode already does that, for
;; example.
(setq-default indent-tabs-mode nil)
;; if indent-tabs-mode is off, untabify before saving

;; but in emacs 24?!
(add-hook 'write-file-hooks
 (lambda ()
   (if (not indent-tabs-mode)
    (untabify (point-min) (point-max)))
   nil))


(use-package smart-shift
  :init
  (global-smart-shift-mode 1))

(use-package yaml-mode)

(use-package indent-tools
  :bind
  (:map yaml-mode-map
        ("C-c >" . 'indent-tools-hydra/body)
        ("C-c C-c C-f" . 'yafolding-toggle-element)
        ("C-M-p" . 'indent-tools-goto-previous-sibling)
        ("C-M-n" . 'indent-tools-goto-next-sibling)
        ("C-M-d" . 'indent-tools-goto-child)
        ("C-M-u" . 'indent-tools-goto-parent)
        ("C-M-e" . 'indent-tools-goto-end-of-tree)))

(when (boundp 'scroll-bar-mode)
  (scroll-bar-mode 0))

(add-hook 'lsp-mode-hook
 (lambda ()
  (set-face-attribute 'lsp-face-highlight-textual nil :background "#666" :foreground "#ffffff")
  (set-face-attribute 'lsp-face-highlight-read nil :background "#666" :foreground "#ffff99")
  (set-face-attribute 'lsp-face-highlight-write nil :background "#666" :foreground "#ff99ff")
 ))

;; M-, 뒤로가기로 복구
(define-key c-mode-base-map "\M-," (function rtags-location-stack-back))

;; helm buffer detail 켜기
(setq helm-buffer-details-flag t)

(use-package ansi-color
    :hook (compilation-filter . ansi-color-compilation-filter))

(provide 'after-init)
;;; after-init.el ends here
