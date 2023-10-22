import 'package:game/game.dart' as game;
import 'dart:io';
import 'dart:math';

void main(List<String> arguments) {
  intGame();
}
void intGame() {
  print('Кто загадывает?  \nПользователь - 1\nКомпьютер - 2 ');
  int gamer = int.parse(stdin.readLineSync()?? '');

  if (gamer == 1) {
    playGame();
  } else if (gamer == 2) {
    gameForComputer();
  } else {
    print('Ошибка. Неизвестный игрок');
  }
  }
int chooseRounds() {
  print('Сколько раундов игры (1-10)?');
  String input = stdin.readLineSync() ?? '3';
  return int.parse(input);
}
void playGame() {
  int rounds = chooseRounds();
  int userWins = 0;
  int computerWins = 0;

  for (int i = 0; i < rounds; i++) {
    print('====================');
    print('Раунд ${i + 1}:');

    print('Пользователь загадывает:');
    int userShots = gameForUser();
    print('Угадал с $userShots попыток!');
    userWins += userShots;

    print('====================');

    print('Компьютер загадывает:');
    int computerShots = gameForComputer();
    print('Пользователь угадал с $computerShots попыток!');
    computerWins += computerShots;
  }

  print('====================');
  print('Игра окончена!');

  if (userWins > computerWins) {
    print('Пользователь победил!');
  } else if (userWins < computerWins) {
    print('Компьютер победил!');
  } else {
    print('Ничья!');
  }
}


int gameForUser() {
  int min = 1;
  int max = 100;
  int shag = 0;

  while (true) {
    int chislo = Random().nextInt(max - min + 1) + min;
    shag++;

    print('Это $chislo?');

    String answer = stdin.readLineSync()!.toLowerCase();

    if (answer == 'да') {
      break;
    } else if (answer == 'меньше') {
      max = chislo - 1;
    } else if (answer == 'больше') {
      min = chislo + 1;
    } else {
      print('Ошибка. Введите "да", "меньше" или "больше".');
    }
  }
  return shag;
}

int gameForComputer() {
  int number = Random().nextInt(100) + 1;
  int chislo;
  int attempt = 0;

  print('Я загадал число от 1 до 100. Попробуй угадать!');

  do {
    chislo = int.parse(stdin.readLineSync()?? '');
    attempt++;

    if (chislo < number) {
      print('больше');
    } else if (chislo > number) {
      print('меньше');
    }
  } while (chislo != number);

  print('Поздравляю! У тебя получилось за $attempt попыток.');
  return attempt;
}