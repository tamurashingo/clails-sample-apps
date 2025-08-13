; -*- mode: lisp -*-
(in-package #:cl-user)
(defpackage #:todoapp-postgresql/config/database
  (:use #:cl)
  (:import-from #:clails/environment
                #:*project-environment*)
  (:import-from #:clails/util
                #:env-or-default
                #:env)
  (:import-from #:clails/model/impl/postgresql)
  (:export #:initialize-database-config))
(in-package #:todoapp-postgresql/config/database)

(defun initialize-database-config ()
  (setf clails/environment:*database-config*
        `(:database :mysql
          :develop (:database-name ,(env-or-default "CLAILS_DB_NAME" "todoapp_postgresql_develop")
                    :host ,(env-or-default "CLAILS_DB_HOST" "postgresql-dev")
                    :port ,(env-or-default "CLAILS_DB_PORT" "5432")
                    :username ,(env-or-default "CLAILS_DB_USERNAME" "clails")
                    :password ,(env-or-default "CLAILS_DB_PASSWORD" "password"))
          :test (:database-name ,(env-or-default "CLAILS_DB_NAME" "todoapp_postgresql_test")
                 :host ,(env-or-default "CLAILS_DB_HOST" "postgresql-dev")
                 :port ,(env-or-default "CLAILS_DB_PORT" "5432")
                 :user ,(env-or-default "CLAILS_DB_USERNAME" "clails")
                 :password ,(env-or-default "CLAILS_DB_PASSWORD" "password"))
          :production (:database-name ,(env "CLAILS_DB_NAME")
                       :host ,(env "CLAILS_DB_HOST")
                       :port ,(env "CLAILS_DB_PORT")
                       :username ,(env "CLAILS_DB_USERNAME")
                       :password ,(env "CLAILS_DB_PASSWORD")))))

(setf clails/environment:*database-type*
      (make-instance 'clails/environment::<database-type-postgresql>))
