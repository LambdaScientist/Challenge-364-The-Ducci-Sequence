(def test1 [1 5 7 9 9])
(def test2 [1 2 1 2 1 0])
(def test3 [10 12 41 62 31 50])
(def test4 [10 12 41 62 31])

(defn get-next-ducci
  "Return the next ducci sequence"
  [s]
  (map #(abs (- %1 %2)) s (drop 1 (conj s (first s)))))

(defn ducci-seq
  "Return converged ducci seq"
  [s]
  (let [s-next (into [] (get-next-ducci s))]
    (if (not= s s-next)
      (apply conj [s-next] (ducci-seq s-next))
      [])))
