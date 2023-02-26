scr <- data.frame(
  win <- 0,
  draw <- 0,
  lose <- 0
)

cat('::::::Welcome to Pao-Ying-Chub Game:::::::\n')
print("Please enter you name...")
username <- readLines("stdin", n = 1)
cat(paste("\nHi!", username))

commands <- (
'\nPlease enter one of the following actions:
1 = Rock
2 = Paper
3 = Scissors
0 = Exit
'
)

while (TRUE) {
  bot = sample(c('1', '2', '3'), 1)

  cat(commands)
  inp <- toupper(readLines("stdin", n=1))

  if (!(inp %in% c('1', '2', '3', '0'))) {
    cat('Invalid command!\n')
  } else if (inp == '0') {
    break
  } else if (bot == inp) {
    print('Draw game!')
    scr$draw = scr$draw + 1
  } else if (
      (inp == '1' & bot == '3')
    | (inp == '3' & bot == '2')
    | (inp == '2' & bot == '1')
  ) {
    print('You Win!')
    scr$win = scr$win + 1
  } else {
    print('You Lose!')
    scr$lose = scr$lose + 1
  }
}

cat('::::::::: Game Result :::::::::\n')
cat(sprintf('Win:  %d\n', scr$win))
cat(sprintf('Draw: %d\n', scr$draw))
cat(sprintf('Lose: %d\n', scr$lose))

cat('\nThank you for playing!')
cat(paste("\nGood bye,", username))
cat('\nSee you again!')
