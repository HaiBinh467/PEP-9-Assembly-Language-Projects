# Pep/9 Assembly Language

Assembly programs written for CSC 231 – Computer Systems, using the Pep/9 simulator.

## Programs

### HW10 – Number Guessing Game (hw10-guessing-game/guessing_game.pep)

The user thinks of a number between 1 and 100, and the computer guesses it using binary search. After each guess, the user enters:

- `-1` if their number is lower than the guess
- `1` if their number is higher than the guess
- `0` if the guess is correct

The computer then prints how many guesses it took (never more than 7).

**Running it:** open the file in Pep/9, assemble it, and run it. Use the
**Terminal I/O** tab to play interactively, or enter all answers ahead of time
in **Batch I/O** (for example, for the number 30: `-1 1 -1 -1 1 1 0`).
