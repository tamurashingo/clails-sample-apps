; -*- mode: lisp -*-
(in-package #:todoapp-postgresql/db)

(defmigration "20250812083630_todo"
  (:up #'(lambda (connection)
           (create-table connection :table "todo"
                                    :columns '(("title" :type :string
                                                        :not-null t)
                                               ("done" :type :boolean
                                                       :default-value false)))
           (add-index connection :table "todo"
                                 :index "idx-title"
                                 :columns '("title")))
   :down #'(lambda (connection)
             (drop-table connection :table "todo"))))

