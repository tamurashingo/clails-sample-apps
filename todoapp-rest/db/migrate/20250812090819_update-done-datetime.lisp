; -*- mode: lisp -*-
(in-package #:todoapp-rest/db)

(defmigration "20250812090819_update-done-datetime"
  (:up #'(lambda (connection)
           (let ((records (clails/model/query:select 'todoapp-rest/models/todo:<todo> :where '(and (= done 1)
                                                                                                   (null done-at))
                                                                                      :connection connection)))
             (loop for r in records
                   do (let ((updated-at (clails/model/base-model:ref r :updated-at)))
                        (format t "before r:~A~%" r)
                        (setf (clails/model/base-model:ref r :done-at) updated-at)
                        (format t "after  r:~A~%" r)
                        (clails/model/query:save r :connection connection)))))
   :down #'(lambda (connection)
             ;;
             nil)))
