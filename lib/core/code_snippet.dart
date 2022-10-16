import 'dart:math';

void main() {
  List numbersList = [1, 2, 3, 4, 5, 6, 7];
  List<int> differenceList = [];
  int whiteFlag = 8;
  int redFlag1 = 2;
  int redFlag2 = 5;

  bool checkForIdenticalNumber() {
    if (numbersList.contains(whiteFlag)) {
      print("The flag $whiteFlag is identical to the compareFlag");
      return true;
    }
    return false;
  }

  void checkDifference(int number) {
    if (number > whiteFlag) {
      int difference = number - whiteFlag;
      differenceList.add(difference);
    } else {
      int difference = whiteFlag - number;
      differenceList.add(difference);
    }
  }

  void findNearestNumber() {
    numbersList.forEach((number) => checkDifference(number));
  }

  void checkForSolution() {
    int index = differenceList.indexWhere((e) => e == differenceList.reduce(min));
    print("The closest flag is: ${numbersList[index]}");
  }

  bool isIdentical = checkForIdenticalNumber();
  if (!isIdentical) {
    findNearestNumber();
    checkForSolution();
  }
}
