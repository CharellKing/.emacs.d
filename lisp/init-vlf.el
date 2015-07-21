;;; init-vlf.el ---

;; Copyright 2015 ck
;;
;; Author: ck@CharellkingQu.local
;; Version: $Id: init-vlf.el,v 0.0 2015/07/21 20:29:48 ck Exp $
;; Keywords:
;; X-URL: not distributed yet

;; This program is free software; you can redistribute it and/or modify
;; it under the terms of the GNU General Public License as published by
;; the Free Software Foundation; either version 2, or (at your option)
;; any later version.
;;
;; This program is distributed in the hope that it will be useful,
;; but WITHOUT ANY WARRANTY; without even the implied warranty of
;; MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
;; GNU General Public License for more details.
;;
;; You should have received a copy of the GNU General Public License
;; along with this program; if not, write to the Free Software
;; Foundation, Inc., 675 Mass Ave, Cambridge, MA 02139, USA.

;;; Commentary:

;;

;; Put this file into your load-path and the following into your ~/.emacs:
;;   (require 'init-vlf)

;;; Code:

(require 'vlf-setup)
(custom-set-variables
 '(vlf-application 'dont-ask))

(eval-after-load "vlf"
  '(define-key vlf-prefix-map "\C-xv" vlf-mode-map))


(provide 'init-vlf)
(eval-when-compile
  (require 'cl))



;;;;##########################################################################
;;;;  User Options, Variables
;;;;##########################################################################





;;; init-vlf.el ends here
