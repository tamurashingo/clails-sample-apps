; -*- mode: lisp -*-
(in-package #:cl-user)
(defpackage #:todoapp-rest/config/database
  (:use #:cl)
  (:import-from #:clails/environment
                #:*project-dir*
                #:*project-environment*)
  (:import-from #:clails/util
                #:env-or-default
                #:env)
  (:import-from #:clails/model/impl/sqlite3)
  (:export #:initialize-database-config))
(in-package #:todoapp-rest/config/database)

(defun initialize-database-config ()
  (setf clails/environment:*database-config*
        `(:database :sqlite3
          :develop (:database-name ,(env-or-default "CLAILS_DB_NAME" (format nil "~A/tmp/todoapp-rest-develop.sqlite3" *project-dir*)))
          :test (:database-name ,(env-or-default "CLAILS_DB_NAME" (format nil "~A/tmp/todoapp-rest-test.sqlite3" *project-dir*)))
          :production (:database-name ,(env "CLAILS_DB_NAME")))))

(setf clails/environment:*database-type*
      (make-instance 'clails/environment::<database-type-sqlite3>))
