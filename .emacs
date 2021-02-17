;;;
;;; ���ܸ�ɽ���Τ���
;;;
(set-language-environment "Japanese")
(setq kanji-display-code 3)
(setq kanji-input-code 3)
(setq kanji-process-code 3)
(setenv "LC_TIME" "C")
;;;

(line-number-mode t)            ; ����������֤ιԿ���ɽ������
(setq next-line-add-newlines nil) ; �ǽ��ԤǤ�C-n�ϲ��Ԥ��ʤ�
(setq enable-double-n-syntax t) ; nn�ǡ֤�פ����ϤǤ��� 


;;; BS ��DEL �θ� (Help��ư��DEL��)
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

;;; �ե������ɤ߹��߻��Υ⡼������
(setq auto-mode-alist
      (append '(
                ("\\.perl$\\|\\.p[hlm]$\\|/perl/" . perl-mode)
                ("\\.txt$" . text-mode)
                ("\\.message$" . text-mode)
                ) auto-mode-alist))
