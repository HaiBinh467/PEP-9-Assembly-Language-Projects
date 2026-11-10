; CSC 231 - Homework #10 - Assembly Programming, part IV
; Number Guessing Game (Pep/9)
;
; The user thinks of a number between 1 and 100. The computer guesses
; it using binary search: each guess is the midpoint of the range of
; numbers that are still possible.
;
; After each guess the user enters:
;   -1  if their number is LOWER  than the guess (guess too high)
;    1  if their number is HIGHER than the guess (guess too low)
;    0  if the guess is correct
;
; Since the range is halved every turn, the computer never needs
; more than 7 guesses for numbers 1..100.  
BR      main

low:     .WORD   1           ; smallest number still possible
high:    .WORD   100         ; largest number still possible
guess:   .BLOCK  2           ; current guess
count:   .WORD   0           ; number of guesses made
resp:    .BLOCK  2           ; user's response (-1, 0, or 1)

;---------------------------- main program ----------------------------
main:    STRO    welcome,d   ; print welcome message
         STRO    pick,d      ; ask user to think of a number

loop:    LDWA    low,d       ; guess = (low + high) / 2
         ADDA    high,d
         ASRA
         STWA    guess,d

         LDWA    count,d     ; count = count + 1
         ADDA    1,i
         STWA    count,d

         STRO    myguess,d   ; "My guess is: <guess>"
         DECO    guess,d

         STRO    prompt,d    ; ask for -1 / 0 / 1
         DECI    resp,d

         LDWA    resp,d      ; examine response (sets N and Z flags)
         BREQ    correct     ; 0  -> guessed it
         BRLT    toohigh     ; -1 -> guess was too high

                             ; 1  -> guess was too low
         LDWA    guess,d     ; low = guess + 1
         ADDA    1,i
         STWA    low,d
         BR      loop

toohigh: LDWA    guess,d     ; high = guess - 1
         SUBA    1,i
         STWA    high,d
         BR      loop

correct: STRO    gotit,d     ; report number of guesses
         DECO    count,d
         STRO    guesses,d
         STOP

;------------------------------ strings -------------------------------
welcome: .ASCII  "Welcome to the Guessing Game!\n\x00"
pick:    .ASCII  "Think of a number between 1 and 100 (do not type it).\n"
         .ASCII  "I will try to guess it.\n\n\x00"
myguess: .ASCII  "\nMy guess is: \x00"
prompt:  .ASCII  "\nEnter -1 if your number is lower, "
         .ASCII  "1 if it is higher, or 0 if I am correct: \x00"
gotit:   .ASCII  "\nI got it! It took me \x00"
guesses: .ASCII  " guesses.\n\x00"
         .END