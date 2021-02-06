import           Test.Tasty.HUnit      (Assertion, testCase, (@?=))
import           Test.Tasty.QuickCheck (Property, testProperty, (===))
import           Test.Tasty.TH         (defaultMainGenerator)

case_example :: Assertion
case_example = 2 + 2 @?= (4 :: Integer)

prop_example :: Integer -> Integer -> Property
prop_example a b = a + b === b + a

main :: IO ()
main = $defaultMainGenerator
