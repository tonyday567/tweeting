---
pagetitle: tweeting
---

[tweeting](https://github.com/tonyday567/tweeting) example
===

[ghc options](https://downloads.haskell.org/~ghc/latest/docs/html/users_guide/flags.html#flag-reference)
---

> {-# OPTIONS_GHC -Wall #-}

[pragmas](https://downloads.haskell.org/~ghc/latest/docs/html/users_guide/lang.html)
---

> {-# LANGUAGE NoImplicitPrelude #-}
> {-# LANGUAGE OverloadedStrings #-}
> {-# LANGUAGE DataKinds #-}
> {-# LANGUAGE DeriveGeneric #-}
> {-# LANGUAGE ScopedTypeVariables #-}
> {-# LANGUAGE TypeOperators #-}
> {-# LANGUAGE FlexibleInstances #-}

[libraries](https://www.stackage.org/)
---

- [protolude](https://www.stackage.org/package/protolude)
- [readme-lhs](https://www.hackage.org/package/readme-lhs)

> import Protolude
> import Readme.Lhs
> import Web.Tweet
> import Prelude (String)
> import Web.Tweet.Utils.API
> import Web.Tweet.Utils
> import qualified Data.ByteString.Lazy.Char8 as BSL
> import Text.Megaparsec.Error
> import Control.Composition
> 
> favoriteTweetListRaw' :: String -> Int -> FilePath -> IO BSL.ByteString
> favoriteTweetListRaw' sn count = getRequest ("https://api.twitter.com/1.1/favorites/list.json?screen_name=" ++ sn ++ c)
>   where c = "&count=" ++ show count
>
> getFavorites' :: String -> Int -> FilePath -> IO (Either (ParseErrorBundle String Void) Timeline)
> getFavorites' = fmap (getTweets . BSL.toStrict) .** favoriteTweetListRaw'
>
>

code
---

- [hoogle](https://www.stackage.org/package/hoogle)

> main :: IO ()
> main = do
>   let n = 10
>   let answer = product [1..n::Integer]
>   void $ runOutput ("app/example.lhs", LHS) ("readme.md", GitHubMarkdown) $ do
>     output "example" (Native [plain $ show answer])

10! is equal to:

```{.output .example}

```

tests
---

- [doctest](https://www.stackage.org/package/doctest)

> -- | doctests
> -- >>> let n = 10
> -- >>> product [1..n]
> -- 3628800
