(set-language-environment "Korean")
(setq default-input-method "korean-hangul")

;; init-util.el 에서 덮어쓴걸 다시 복구
(global-set-key [(control \\)] #'toggle-input-method)

;현재 버퍼를 다른 encoding으로 변환하여 저장하고자 할 때는
;C-x C-m f 키(또는 M-x set-buffer-file-coding-system)를 누른 뒤
;원하는 encoding(예, utf-8, cp949, euc-kr 등등)을 입력하고 엔터를 입력한다.

;현재 버퍼의 encoding이 적절하지 않아서 특정 encoding으로 다시 읽어오고자 한다면
;C-x C-m r 키를 누른 뒤
;원하는 encoding(예, utf-8, cp949, euc-kr 등등)을 입력하고 엔터를 친다.

(setq-default file-name-coding-system 'utf-8)
(setq-default buffer-coding-system 'utf-8)
(prefer-coding-system 'utf-8)
(set-default-coding-systems 'utf-8)

(provide 'init-korean)
