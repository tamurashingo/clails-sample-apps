; -*- mode: lisp -*-
(in-package #:cl-user)
(defpackage #:todoapp-sqlite3/db
  (:use #:cl)
  (:import-from #:clails/model/migration
                #:defmigration
                #:create-table
                #:add-column
                #:add-index
                #:drop-table
                #:drop-table
                #:drop-column
                #:drop-index))
(in-package #:todoapp-sqlite3/db)

