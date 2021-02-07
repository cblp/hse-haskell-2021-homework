module Task2_WeekDays where

-- import           Test.Tasty.HUnit
import           Test.QuickCheck

data WeekDay
  deriving Show

instance Arbitrary WeekDay where
  arbitrary = elements []

instance Eq WeekDay where
  (==) = undefined

nextDay :: WeekDay -> WeekDay
nextDay = undefined

-- unit_nextDay_Mon :: Assertion
-- unit_nextDay_Mon = nextDay Mon @?= Tue

afterDays :: Integer -> WeekDay -> WeekDay
afterDays = undefined

-- prop_afterDays_7 :: Integer -> WeekDay -> Property
-- prop_afterDays_7 i d = afterDays (i * 7) d === d

isWeekend :: WeekDay -> Bool
isWeekend = undefined

daysToParty :: WeekDay -> Integer
daysToParty = undefined
