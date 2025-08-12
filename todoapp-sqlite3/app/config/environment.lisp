; -*- mode: lisp -*-
(in-package #:cl-user)
(defpackage #:todoapp-sqlite3/config/environment
  (:use #:cl)
  (:import-from #:clails/environment
                #:*project-environment*
                #:*routing-tables*))

(in-package #:todoapp-sqlite3/config/environment)

;; project name
(setf clails/environment:*project-name* "todoapp-sqlite3")

;; project environment
(setf clails/environment:*project-environment* :develop)

(setf *routing-tables*
  '((:path "/"
     :controller "todoapp-sqlite3/controllers/application-controller:<application-controller>")))

;; 20250812083630 : add todo controller
(push '(:path "/todo"
        :controller "todoapp-sqlite3/controllers/todo-controller:<todo-controller>")
      clails/environment:*routing-tables*)

(push '(:path "/todo/:id"
        :controller "todoapp-sqlite3/controllers/todo-controller:<todo-update-controller>")
      clails/environment:*routing-tables*)
