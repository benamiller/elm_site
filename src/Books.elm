module Books exposing (view)

import Html exposing (Html, div, h1, h2, p, text)
import Html.Attributes exposing (class)


type alias Book =
    { title : String
    , author : String
    , review : String
    , published : String
    , read : String
    }


view : Html msg
view =
    div [ class "books-container" ]
        [ h1 [] [ text "Books" ]
        , div [] (List.map bookReview books)
        ]


bookReview : Book -> Html msg
bookReview book =
    div [ class "book" ]
        [ h2 [] [ text book.title ]
        , p [] [ text ("by " ++ book.author) ]
        , p [] [ text book.review ]
        ]


books : List Book
books =
    [ { title = "Title 1"
      , author = "Author 1"
      , review = "Review 1"
      , published = "2014"
      , read = "2025"
      }
    , { title = "Title 2"
      , author = "Author 2"
      , review = "Review 2"
      , published = "2017"
      , read = "2024"
      }
    ]
