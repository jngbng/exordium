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

(setq lsp-clangd-version "15.0.6")

(setq exordium-rtags-cmake t)

;; build 디렉토리 만들 때 -DCMAKE_EXPORT_COMPILE_COMMANDS=1 옵션 줘야 한다. 알아서 안되나?
(setq exordium-rtags-cmake-build-dir "build")

(setq exordium-enable-electric-pair-mode nil)

(setq exordium-use-magit-fullscreen nil)

(setq exordium-smerge-show-dispatch nil)

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

(provide 'prefs)
;;; prefs.el ends here
