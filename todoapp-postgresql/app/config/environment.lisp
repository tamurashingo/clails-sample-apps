; -*- mode: lisp -*-
(in-package #:cl-user)
(defpackage #:todoapp-postgresql/config/environment
  (:use #:cl)
  (:import-from #:clails/environment
                #:*project-environment*
                #:*routing-tables*))

(in-package #:todoapp-postgresql/config/environment)

;; project name
(setf clails/environment:*project-name* "todoapp-postgresql")

;; project environment
(setf clails/environment:*project-environment* :develop)

(setf *routing-tables*
  '((:path "/"
     :controller "todoapp-postgresql/controllers/application-controller:<application-controller>")))

;; 20250812083630 : add todo controller
(push '(:path "/todo"
        :controller "todoapp-postgresql/controllers/todo-controller:<todo-controller>")
      clails/environment:*routing-tables*)

(push '(:path "/todo/:id"
        :controller "todoapp-postgresql/controllers/todo-controller:<todo-update-controller>")
      clails/environment:*routing-tables*)

