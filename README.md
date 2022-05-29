# Hangman
This project is the implementation of Hangman game in perl including the hangman figure display.

How to run the programm:
1. On the command line,run the program by entering the command: perl Hangman.pl



The game asks the player to guess a word by showing it as row of dashes, giving the number of letters in the word.
The programm asks the player to guess a letter. Entering a single letter in lower case (a-z) is considered as a valid input.
If the guessed letter occures in the word then it is written in all its correct positions, and another letter is asked to enter until the word is completed.
If the guessed letter is not present in the word then one element of the hanged man stick figure is drawn as a tally mark. If the hangman figure is completed then the player has lost the game.
The total number of tries is therefore 6 (head, body, 2 hands, 2 legs).



The complete hangman figure is as shown below:  
    _______
   |       |
   |      \O/
   |       |
   |      / \
___|___