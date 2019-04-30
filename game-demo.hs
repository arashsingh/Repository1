import System.IO

game :: IO (String)
game = do
    putStrLn "\nWelcome to the text adventure game!\n"
    putStrLn instructions
    play "start game" 
    return "Goodbye!"
    
instructions =
    "Enter commands using e room1 or n room 2.\n" ++
    "Available commands are:\n" ++
    "game               -- to start the game.\n" ++
    "n  s  e  w  u  d   -- to go in that direction.\n" ++
    "take object        -- to pick up the named object.\n" ++
    "drop object        -- to put down the named object.\n" ++
    "kill               -- to attack an enemy.\n" ++
    "look               -- to look around you again.\n" ++
    "i                  -- to see your inventory (what you are holding).\n" ++
    "quit               -- to end the game and quit."


match :: String -> String -> String
match xs ys = description xs ys

--need to add more options of the rooms, for example
-- description "s" "room4"= "you are inside room4"
description :: String->String -> String
description _ "w room1" =
    "You are in a room1.  To the north is the dark mouth\n" ++
    "of a room2; to the south is a small room5.  Your\n" ++
    "assignment, should you decide to accept it, is to\n" ++
    "recover the famed Bar-Abzad ruby and return it to\n" ++
    "this room3."
description _ "w room2" = "Congratulations!!  You have recovered the ruby and won the game."
description _ "s room1" =
    "You are in the mouth of a dank room2.  The exit is to\n" ++
    "the south; there is a large, dark, round passage to\n" ++
    "the east."
description _ "s room4"= "you are inside room4"
description _ "n room1"= "you are inside room1. Look for all the artefacts, you could also check other rooms."
description _ " n room2"= "you are inside room2. Congratulations you have found the hidden chest of artefacts and won the game."
description _ "n room3 room2"= "you have found this short-cut and proceed straight to the prize."
description _ "e room3"= "you have found this short-cut and proceed straight to the prize room3."
description _ _ = "you can't see anything."

play :: String -> IO ()
play direction =
   do guess <- getLine
      if guess == "quit" then
         putStrLn "You won/game over!"
      else
         do putStrLn (match direction guess)
            play direction