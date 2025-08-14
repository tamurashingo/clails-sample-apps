; -*- mode: lisp -*-
(in-package #:cl-user)
(defpackage #:todoapp-rest/config/environment
  (:use #:cl)
  (:import-from #:clails/environment
                #:*project-environment*
                #:*routing-tables*))

(in-package #:todoapp-rest/config/environment)

;; project name
(setf clails/environment:*project-name* "todoapp-rest")

;; project environment
(setf clails/environment:*project-environment* :develop)

(setf *routing-tables*
  '((:path "/"
     :controller "todoapp-rest/controllers/application-controller:<application-controller>")))

;; 20250812083630 : add todo controller
(push '(:path "/api/todo"
        :controller "todoapp-rest/controllers/todo-controller:<todo-rest-controller>")
      clails/environment:*routing-tables*)

(push '(:path "/api/todo/:id"
        :controller "todoapp-rest/controllers/todo-controller:<todo-rest-update-controller>")
      clails/environment:*routing-tables*)

