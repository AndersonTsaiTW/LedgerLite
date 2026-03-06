data Transaction
  = Deposit Int
  | Withdraw Int
  deriving (Show)

showTransaction :: Transaction -> String
showTransaction (Deposit x) = "Deposit " ++ show x
showTransaction (Withdraw x) = "Withdraw " ++ show x

-- Safe withdrawal: returns Nothing if insufficient funds
applyTransaction :: Int -> Transaction -> Maybe Int
applyTransaction balance (Deposit x) = Just (balance + x)
applyTransaction balance (Withdraw x)
  | x <= balance = Just (balance - x)
  | otherwise = Nothing  -- Not enough money!

calculateBalance :: [Transaction] -> Maybe Int
calculateBalance = go 0
  where
    go balance [] = Just balance
    go balance (t:ts) = 
      case applyTransaction balance t of
        Nothing -> Nothing
        Just newBalance -> go newBalance ts

transactions :: [Transaction]
transactions =
  [ Deposit 100
  , Withdraw 30
  , Withdraw 80
  , Deposit 50
  , Withdraw 10
  ]

main :: IO ()
main = do
  putStrLn "LedgerLite"
  putStrLn "=========="
  mapM_ (putStrLn . showTransaction) transactions
  putStrLn "----------"
  case calculateBalance transactions of
    Just balance -> putStrLn ("Balance: " ++ show balance)
    Nothing -> putStrLn "Error: Not enough money!"