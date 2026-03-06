# LedgerLite

LedgerLite is a small Haskell CLI project that models simple financial transactions and computes account balances that prevents negative balances. Built to explore Haskell.

## Features
- Represent deposits and withdrawals with algebraic data types
- Compute account balance with pure functions
- Print a simple transaction ledger in the terminal
- Use `Transaction` data type for deposits and withdrawals
- **Prevent negative balances** with `Maybe` for error handling
- Calculate balance with pure functions

## Key Concept

### Safe Withdrawals
```haskell
applyTransaction balance (Withdraw x)
  | x <= balance = Just (balance - x)  -- Success
  | otherwise = Nothing  -- Not enough money
```

That's it! `Maybe` lets us say "success" or "failure".

## Run
```bash
runghc Main.hs
```