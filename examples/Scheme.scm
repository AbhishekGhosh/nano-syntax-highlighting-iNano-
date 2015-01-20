;; A simple counter
(let loop ((n 1))
    (if (<= n 10)
        (begin
        (display n)(newline)
        (loop (+ n 1)))))

;; Tabulation of squares from 0 to 9
(let loop ((i 0))
    (if (not (= i 10))
        (begin
            (display i)(display " squared = ")(display (* i i))(newline)
            (loop (+ i 1)))))
