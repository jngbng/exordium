;;; prefs --- preferance override
;;; Commentary:

;;; Code:
(setq exordium-helm-everywhere t)

(setq exordium-spell-check nil)

;; 한/영이랑 인코딩 설정등이 안보임. 어떻게 고치나?
(setq exordium-enable-powerline nil)

(setq initial-major-mode 'text-mode)
(setq initial-scratch-message nil)

(setq exordium-display-line-numbers nil)

(setq lsp-clangd-version "18.1.3")

(setq exordium-rtags-cmake t)

;; build 디렉토리 만들 때 -DCMAKE_EXPORT_COMPILE_COMMANDS=1 옵션 줘야 한다. 알아서 안되나?
(setq exordium-rtags-cmake-build-dir "build")

(setq exordium-enable-electric-pair-mode nil)

(setq exordium-use-magit-fullscreen nil)

(setq exordium-smerge-show-dispatch nil)

(setq exordium-complete-mode nil)

;; Font
(cond ((daemonp)
       (message "Setting prefs for emacsclient")
       (setq default-frame-alist
             (append '((font   . "Manaco 12")
                       ;; (font   . "Consolas 13")
                       (top    . 0)
                       (left   . 50)
                       (width  . 110)
                       (height . 71))
                     default-frame-alist)))
      (t
       (message "Setting prefs for emacs")
       (setq exordium-preferred-fonts '(("Monaco"    . 120)
                                        ("Consolas"  . 120)
                                        ("Monospace" . 120)
                                        ("Mono"      . 120)))))

(setq exordium-lsp-ui-doc-enable nil)
(setq exordium-lsp-ui-peek-enable nil)

(setq helm-always-two-windows nil)

(setq lsp-headerline-breadcrumb-enable nil)

;; M-C-l switch back and forth between the 2 top buffers

;; auto complete 가 helm이랑 연계되면서 망가졌다. 일단 시그니처 자동으로 띄우는거 끔.
;; https://emacs-lsp.github.io/lsp-mode/tutorials/how-to-turn-off/
(setq lsp-signature-auto-activate nil) ;; you could manually request them via `lsp-signature-activate`

(provide 'prefs)
;;; prefs.el ends here
