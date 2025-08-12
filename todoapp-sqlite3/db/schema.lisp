; -*- mode: lisp -*-
(in-package #:todoapp/db)

(lambda (connection)
  (create-table connection :table "todo"
                           :columns '(
                                      ("title" :TYPE :STRING :NOT-NULL T)
                                      ("done" :TYPE :BOOLEAN :DEFAULT-VALUE 0)
                                      ("done-at" :TYPE :DATETIME :NOT-NULL NIL)
                                     )
  )
; ok
