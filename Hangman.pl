#!/usr/local/bin/perl
use strict;
print "Welcome to Hangman! \n";
print "While guessing enter leters in lower case. \n";

my @listOfWords = ("computer","radio","calculator","teacher","bureau","police","geometry","president","subject","country","environment","classroom","animals","province","month","politics","puzzle","instrument","kitchen","language","vampire","ghost","solution","service","software","virus","security","phonenumber","expert","website","agreement","support","compatibility","advanced","search","triathlon","immediately","encyclopedia","endurance","distance","nature","history","organization","international","championship","government","popularity","thousand","feature","wetsuit","fitness","legendary","variation","equal","approximately","segment","priority","physics","branch","science","mathematics","lightning","dispersion","accelerator","detector","terminology","design","operation","foundation","application","prediction","reference","measurement","concept","perspective","overview","position","airplane","symmetry","dimension","toxic","algebra","illustration","classic","verification","citation","unusual","resource","analysis","license","comedy","screenplay","production","release","emphasis","director","trademark","vehicle","aircraft","experiment");
my $listSize = @listOfWords;
my $validInputs = "abcdefghijklmnopqrstuvwxyz"; #valid inputs
my @guessList = (); # has letters which are already guessed
my $turns = 6;
my $solved = 0; # 0 if not solved, 1 if solved
my @word = ();
my $gameWord = $listOfWords[rand($listSize)]; # random word from list of words

&main();
sub main {

    my $wordSize = length($gameWord);
    for ( my $i=0; $i < $wordSize; $i++) {
                $word[$i] = '_';
        }


    while((!$solved)&&($turns)) {
        displayHangman();
        print "Here is your word : @word  \n";
        print "Guesses so far: @guessList \n";
        print "Make a guess: ";
        my $guess = <>;
        chomp($guess);
        if ( grep $_ eq $guess, @guessList ) { # if guessed letter is already guessed before
            print "Sorry, you already guessed $guess. Guess again. \n";
        }
        elsif((index($validInputs, $guess) == -1)||(length($guess)!=1)) { # if input is invalid
            print "Invalid Input. Enter a letter in lower case. \n";
        }
        else {
            push @guessList,$guess;
            findGuessedLetter($guess);
            checkWin();   
        }

    }
}

sub findGuessedLetter { # to check if the guess is good or bad
    my ($guess)=@_;

    my $offset = 0;
    my $position = index($gameWord, $guess, $offset);
    if($position == -1) {
        $turns--;
        print "Bad guess - you have $turns body parts left. \n";
        return ;
    }

    while ($position != -1) {
        $word[$position] = $guess;
        $offset = $position + 1;
        $position = index($gameWord, $guess, $offset);
    }
    print "Good guess - you have $turns body parts left. \n";
    return ;
}

sub checkWin { # to check if the word is completed
    if($turns == 0) { # turns over. game lost
        displayHangman();
        print "You didn't guess correctly. The word was $gameWord. \n";
        print "You Lost! \n";
        return ;
    }
    if ( grep $_ eq '_', @word ) { # game is still going on
            return ;
    }

    $solved = 1;
    displayHangman();
    print "You guessed correctly. The word is $gameWord. \n";
    print "you won!! ^_^ \n";
    return ;

}

sub displayHangman { # To display hangman

    if($turns == 0) {display0();}
    elsif($turns == 1) {display1();}
    elsif($turns == 2) {display2();}
    elsif($turns == 3) {display3();}
    elsif($turns == 4) {display4();}
    elsif($turns == 5) {display5();}
    else {display6();}
}

sub display0 { # display when 0 turns left
    print "    _______\n";
    print "   |       |\n";
    print "   |      \\O/  \n";
    print "   |       |    \n";
    print "   |      / \\  \n";
    print "___|___ \n \n";
}

sub display1 { # display when 1 turn left
    print "    _______\n";
    print "   |       |\n";
    print "   |      \\O/  \n";
    print "   |       |    \n";
    print "   |      /     \n";
    print "___|___ \n \n";
}

sub display2 { # display when 2 turns left
    print "    _______\n";
    print "   |       |\n";
    print "   |      \\O/  \n";
    print "   |       |    \n";
    print "   |            \n";
    print "___|___ \n \n";
}

sub display3 { # display when 3 turns left
    print "    _______\n";
    print "   |       |\n";
    print "   |      \\O   \n";
    print "   |       |    \n";
    print "   |            \n";
    print "___|___ \n \n";
}

sub display4 { # display when 4 turns left
    print "    _______\n";
    print "   |       |\n";
    print "   |       O    \n";
    print "   |       |    \n";
    print "   |            \n";
    print "___|___ \n \n";
}

sub display5 { # display when 5 turns left
    print "    _______\n";
    print "   |       |\n";
    print "   |       O    \n";
    print "   |            \n";
    print "   |            \n";
    print "___|___ \n \n";

}

sub display6 { # display when 6 turns left
    print "    _______\n";
    print "   |       |\n";
    print "   |            \n";
    print "   |            \n";
    print "   |            \n";
    print "___|___ \n \n";
}