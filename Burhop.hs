import Prelude
import Text.PrettyPrint 

nextDucci :: Num a => [a] -> [a]
nextDucci ls@(x:xs) = zipWith (\a b -> abs $ a - b) ls (xs ++ [x])
   
getDucciSequence :: (Num a, Eq a) => [a] -> [[a]]
getDucciSequence = addWhileUnseen' []
    where  
    addWhileUnseen' seen [] = []
    addWhileUnseen' seen i = if (elem i seen) || (sum i == 0) then seen else addWhileUnseen' (seen ++ [i]) (nextDucci i)

testInput = 
    [ [0, 653, 1854, 4063]
    , [1, 5, 7, 9, 9]
    , [1, 2, 1, 2, 1, 0]
    , [10, 12, 41, 62, 31, 50]
    , [10, 12, 41, 62, 31]
    ]

prepareList :: Show a => [a] -> [Doc]
prepareList l = (text . show <$> l) 
             ++ [(text . show $ 1 + length l) <+> text "steps"]

main :: IO ()
main = putStrLn.render.vcat.punctuate (text "\n") $ (vcat.prepareList) 
   <$> (getDucciSequence <$> testInput)
