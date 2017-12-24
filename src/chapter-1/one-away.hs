oneAway :: String -> String -> Bool
oneAway a b = a `elem` candidates
  where candidates = deletes ++ transposes ++ replaces ++ inserts
        strlen = 1 + length b
        splits = zipWith splitAt [0..strlen] (replicate strlen b)
        deletes = [x ++ tail y | (x, y) <- splits, not (null y)]
        transposes = [x ++ head t : head y : tail t | (x, y) <- splits, length y > 1, let t = tail y]
        replaces = [x ++ c : tail y | (x, y) <- splits, c <- ['a'..'z'], not (null y)]
        inserts = [x ++ c : y | (x, y) <- splits, c <- ['a'..'z']]
