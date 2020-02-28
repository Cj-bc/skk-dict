;;; zipcode-test.el --- �X�֔ԍ������e�X�g -*- mode: emacs-lisp; coding: japanese-shift-jis-2004; -*-

;;; Commentary:

;;; Code:

(require 'ert)

;; ken_all.csv
;;   26102,"602  ","6020033","�����","���ļ�зޮ��","���޶�����","���s�{",
;;   "���s�s�㋞��","���o�쒬�i�G�ےʍ��o����A�G�ےʍ��o�쉺��A���o��ʉG�ې�",0,0,0,0,0,0

;; ZIPCODE-MK
;;   mkdic-process-kyoto()

;; SKK-JISYO.zipcode
;; 6020033 /���s�{���s�s�㋞��G�ےʍ��o���鍡�o�쒬
;;         /���s�{���s�s�㋞��G�ےʍ��o�쉺�鍡�o�쒬
;;         /���s�{���s�s�㋞�捡�o��ʉG�ې������o�쒬
;;         /���s�{���s�s�㋞�捡�o��ʎ����������o�쒬/

(ert-deftest jisyo-zipcode/test1 ()
  (should
   (string-equal "���s�{���s�s�㋞��G�ےʍ��o���鍡�o�쒬/���s�{���s�s�㋞��G�ےʍ��o�쉺�鍡�o�쒬/���s�{���s�s�㋞�捡�o��ʉG�ې������o�쒬/���s�{���s�s�㋞�捡�o��ʎ����������o�쒬/"
                 (with-temp-buffer
                   (let ((large-file-warning-threshold 20000000)
	                 (coding-system-for-read 'euc-jp))
                     (insert-file-contents (expand-file-name "SKK-JISYO.zipcode" "./"))
                     (goto-char (point-min))
                     (search-forward "6020033 /")
                     (buffer-substring (point)
                                       (progn (end-of-line) (point))))))))

;; ���ɑ����Ȃł���K�R���͂Ȃ��B�ړ]���Ȃ��ł��낤���Ə��Ƃ��đI��ł݂������B
(ert-deftest jisyo-office-zipcode/test1 ()
  (should
   (string-equal "������ @ �����s���c������ւQ���ڂP�|�Q/"
                 (with-temp-buffer
                   (let ((large-file-warning-threshold 20000000)
	                 (coding-system-for-read 'euc-jp))
                     (insert-file-contents (expand-file-name "SKK-JISYO.office.zipcode" "./"))
                     (goto-char (point-min))
                     (search-forward "1008926 /")
                     (buffer-substring (point)
                                       (progn (end-of-line) (point))))))))

;;; zipcode-test.el ends here
