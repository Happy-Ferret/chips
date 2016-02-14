import qualified Data.Text as T

import Test.Hspec

import Git

main :: IO ()
main = hspec $ do
    describe "Git.gitDir" $ do
        testGitDir "/foo/bar:2222.git" "2222"
        testGitDir "git@github.com:kinoru/fplug.git" "fplug"
        testGitDir "https://github.com/kinoru/fplug.git" "fplug"
        testGitDir "git://multiple@auth@kinoru/fplug.git/ " "fplug"
  where
    testGitDir repo dir = it
        (T.unpack $ mconcat ["returns ", dir, " from ", repo]) $
        gitDir repo `shouldBe` Just dir
