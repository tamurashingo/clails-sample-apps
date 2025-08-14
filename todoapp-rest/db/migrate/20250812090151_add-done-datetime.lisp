; -*- mode: lisp -*-
(in-package #:todoapp-rest/db)

(defmigration "20250812090151_add-done-datetime"
  (:up #'(lambda (connection)
           (add-column connection :table "todo"
                                  :columns '(("done-at" :type :datetime
                                                        :not-null nil))))
   :down #'(lambda (connection)
             (drop-column connection :table "todo"
                                     :column "done-at"))))
