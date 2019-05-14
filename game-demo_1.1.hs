{--
This is the basic interface of the game:
need to add more options about the different rooms
need to add more options inside the function description
--}
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
    "n  s  e  w         -- to go in that direction.\n" ++
    "take               -- to pick up the named object.\n" ++
    "drop               -- to put down the named object.\n" ++
    "kill               -- to attack an enemy.\n" ++
    "run                -- to run away from an enemy.\n" ++
    "i                  -- to see your inventory (what you are holding).\n" ++
    "quit               -- to end the game and quit."


match :: String -> String -> String --
match xs ys = description xs ys --


description :: String->String -> String
description _ "w room1" =
    "You are in room1.  To the north is the dark mouth\n" ++
    "of room2; to the south is a small room5.  Your\n" ++
    "task, should you decide to accept it, is to\n" ++
    "recover the infamous Kohinoor diamond. Beware of the\n" ++
    "artefacts and enemies along the way. Good Luck!\n" ++
    "Life remaining 100%"
description _ "w room2" = "Congratulations!!  You have recovered the Kohinoor and won the game. Life remaining 90%"
description _ "s room1" =
    "Player 1 in the mouth of a dark room2.\n" ++
    "This room is empty.\n" ++
    "Life remaining 90%"
description _ "s room4"= "Player 1 inside room4. You see a pure iron dagger, pick it if you will. Life remaining 80%"
description _ "take"= "You have picked the dagger"
description _ "drop"= "You have dropped the dagger"
description _ "n room1"= "Player 1 inside room1. A demon approaches you trying to steal the dagger, kill or run? Life remaining 70%"
description _ "kill"= "A dagger jab straight to the demon's heart sees him killed, well done"
description _ "run"= "Demon sees you run away. You are now at the doorstep of Room2 in the North Kingdom"
description _ "i"= "You have a pure iron dagger in your inventory thus far"
description _ "n room2"= "Player 1 inside room2. Congratulations you have found the hidden chest of artefacts, that has the Kohinoor and you win the game. Life remaining 60%"
description _ "n room3 room2"= "Player 1, you have found this short-cut and proceed straight to the Kohinoor. Life remaining 60%"
description _ "e room3"= "Player 1 has fallen into the trap of the one eyed monster and is held captive. Life Remaining 10%"
description _ _ = "you can't see anything."

play :: String -> IO ()
play direction =
   do guess <- getLine
      if guess == "quit" then
         putStrLn "You won/game over!"
      else
         do putStrLn (match direction guess)
            play direction