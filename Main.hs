data Transaction
  = Deposit Int
  | Withdraw Int
  deriving (Show)

showTransaction :: Transaction -> String
showTransaction (Deposit x) = "Deposit " ++ show x
showTransaction (Withdraw x) = "Withdraw " ++ show x

applyTransaction :: Int -> Transaction -> Int
applyTransaction balance (Deposit x) = balance + x
applyTransaction balance (Withdraw x) = balance - x

calculateBalance :: [Transaction] -> Int
calculateBalance = foldl applyTransaction 0

transactions :: [Transaction]
transactions =
  [ Deposit 100
  , Withdraw 30
  , Deposit 50
  , Withdraw 10
  ]

main :: IO ()
main = do
  putStrLn "LedgerLite"
  putStrLn "=========="
  putStrLn "Transactions:"
  mapM_ (putStrLn . showTransaction) transactions
  putStrLn "----------"
  putStrLn ("Current balance: " ++ show (calculateBalance transactions))