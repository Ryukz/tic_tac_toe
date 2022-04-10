// ignore_for_file: unused_local_variable, avoid_print, prefer_is_empty, curly_braces_in_flow_control_structures

class GameLogic {
  static String currentValue = "X";
  late String buttonColor = "blue";
  late bool buttonStatus = true;
  late String buttonValue = "", buttonNumber, buttonPressedBy;

  GameLogic(
      {required this.buttonColor,
      required this.buttonStatus,
      required this.buttonValue,
      required this.buttonNumber,
      required this.buttonPressedBy});
}

List<GameLogic> boardData = [
  GameLogic(
      buttonColor: "blue",
      buttonStatus: true,
      buttonValue: "",
      buttonNumber: "1",
      buttonPressedBy: ""),
  GameLogic(
      buttonColor: "blue",
      buttonStatus: true,
      buttonValue: "",
      buttonNumber: "2",
      buttonPressedBy: ""),
  GameLogic(
      buttonColor: "blue",
      buttonStatus: true,
      buttonValue: "",
      buttonNumber: "3",
      buttonPressedBy: ""),
  GameLogic(
      buttonColor: "blue",
      buttonStatus: true,
      buttonValue: "",
      buttonNumber: "4",
      buttonPressedBy: ""),
  GameLogic(
      buttonColor: "blue",
      buttonStatus: true,
      buttonValue: "",
      buttonNumber: "5",
      buttonPressedBy: ""),
  GameLogic(
      buttonColor: "blue",
      buttonStatus: true,
      buttonValue: "",
      buttonNumber: "6",
      buttonPressedBy: ""),
  GameLogic(
      buttonColor: "blue",
      buttonStatus: true,
      buttonValue: "",
      buttonNumber: "7",
      buttonPressedBy: ""),
  GameLogic(
      buttonColor: "blue",
      buttonStatus: true,
      buttonValue: "",
      buttonNumber: "8",
      buttonPressedBy: ""),
  GameLogic(
      buttonColor: "blue",
      buttonStatus: true,
      buttonValue: "",
      buttonNumber: "9",
      buttonPressedBy: ""),
];

bool winDecider(bool buttonXPressed) {
  var winDeciderNumbers = [
    "1",
    "2",
    "3",
    "4",
    "5",
    "6",
    "7",
    "8",
    "9",
    "1",
    "4",
    "7",
    "2",
    "5",
    "8",
    "3",
    "6",
    "9",
    "1",
    "5",
    "9",
    "3",
    "5",
    "7"
  ];
  bool condition1 = false, condition2 = false, condition3 = false;
  if (buttonXPressed) {
    print("Button X is Pressed! Checking Winning for X....");
    List<String> buttonNoPressedByX = [];
    for (int i = 0; i < boardData.length; i++) {
      if (boardData[i].buttonPressedBy == "X") {
        buttonNoPressedByX.add(boardData[i].buttonNumber);
      }
    }

    if (buttonNoPressedByX.length >= 3) {
      for (int j = 0; j < winDeciderNumbers.length; j = j + 3) {
        if (!(condition1 && condition2 && condition3)) {
          condition1 = buttonNoPressedByX.contains(winDeciderNumbers[j]);
          condition2 = buttonNoPressedByX.contains(winDeciderNumbers[j + 1]);
          condition3 = buttonNoPressedByX.contains(winDeciderNumbers[j + 2]);
        }
      }

      if (condition1 && condition2 && condition3) return true;
    }
  } else {
    print("Button 0 is Pressed! Checking Winning for 0....");
    List<String> buttonNoPressedBy0 = [];
    for (int i = 0; i < boardData.length; i++) {
      if (boardData[i].buttonPressedBy == "0") {
        buttonNoPressedBy0.add(boardData[i].buttonNumber);
      }
    }

    if (buttonNoPressedBy0.length >= 3) {
      for (int j = 0; j < winDeciderNumbers.length; j = j + 3) {
        if (!(condition1 && condition2 && condition3)) {
          condition1 = buttonNoPressedBy0.contains(winDeciderNumbers[j]);
          condition2 = buttonNoPressedBy0.contains(winDeciderNumbers[j + 1]);
          condition3 = buttonNoPressedBy0.contains(winDeciderNumbers[j + 2]);
        }
      }

      if (condition1 && condition2 && condition3) return true;
    }
  }
  return false;
}
