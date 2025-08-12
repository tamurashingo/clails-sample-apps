; -*- mode: lisp -*-
(in-package #:cl-user)
(defpackage #:todoapp-mysql/config/environment
  (:use #:cl)
  (:import-from #:clails/environment
                #:*project-environment*
                #:*routing-tables*))

(in-package #:todoapp-mysql/config/environment)

;; project name
(setf clails/environment:*project-name* "todoapp-mysql")

;; project environment
(setf clails/environment:*project-environment* :develop)

(setf *routing-tables*
  '((:path "/"
     :controller "todoapp-mysql/controllers/application-controller:<application-controller>")))

;; 20250812083630 : add todo controller
(push '(:path "/todo"
        :controller "todoapp-mysql/controllers/todo-controller:<todo-controller>")
      clails/environment:*routing-tables*)

(push '(:path "/todo/:id"
        :controller "todoapp-mysql/controllers/todo-controller:<todo-update-controller>")
      clails/environment:*routing-tables*)
