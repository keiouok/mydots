;;;
;;; 日本語表示のため
;;;
(set-language-environment "Japanese")
(setq kanji-display-code 3)
(setq kanji-input-code 3)
(setq kanji-process-code 3)
(setenv "LC_TIME" "C")
;;;

(line-number-mode t)            ; カーソル位置の行数を表示する
(setq next-line-add-newlines nil) ; 最終行でのC-nは改行しない
(setq enable-double-n-syntax t) ; nnで「ん」が入力できる 


;;; BS とDEL の交換 (Help起動をDELで)
(cond ((eq window-system 'x)
       (define-key function-key-map [delete] [8])
       (put 'delete 'ascii-character 8)
       (load "term/keyswap"))
      ((null window-system)
       (load "term/keyswap")))
;;;
;;; for Mew
;;; 
(autoload 'mew "mew" nil t)
(autoload 'mew-send "mew" nil t)

;;; ファイル読み込み時のモード設定
(setq auto-mode-alist
      (append '(
                ("\\.perl$\\|\\.p[hlm]$\\|/perl/" . perl-mode)
                ("\\.txt$" . text-mode)
                ("\\.message$" . text-mode)
                ) auto-mode-alist))
