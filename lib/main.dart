// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, avoid_unnecessary_containers, curly_braces_in_flow_control_structures, body_might_complete_normally_nullable, avoid_print, prefer_const_constructors_in_immutables, unnecessary_string_interpolations

import 'package:flutter/material.dart';
import 'package:tic_tac_toe/ui/Colors.dart';
import 'package:tic_tac_toe/utils/game_logic.dart';

late String lastValue = "x", whoWins = "", finalMessage = "";
bool showWinStatus = false, displayMoveStatus = true;
int buttonCount = 0;
void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
          backgroundColor: MainColor.primaryColor,
          body: Column(
            children: [
              SizedBox(
                height: 60.0,
              ),
              displayMoveStatus
                  ? Text(
                      "It's $lastValue turn".toUpperCase(),
                      style: TextStyle(color: Colors.white, fontSize: 40),
                    )
                  : Text(
                      "Game Over".toUpperCase(),
                      style: TextStyle(color: Colors.white, fontSize: 40),
                    ),
              SizedBox(
                height: 400,
                child: GridView.builder(
                  padding: EdgeInsets.symmetric(vertical: 30, horizontal: 16),
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 3,
                      crossAxisSpacing: 12,
                      mainAxisSpacing: 12),
                  itemCount: boardData.length,
                  itemBuilder: (BuildContext con, index) {
                    return ElevatedButton(
                      style: ButtonStyle(
                        backgroundColor: MaterialStateProperty.resolveWith(
                          (states) {
                            if (states.contains(MaterialState.disabled)) {
                              if (boardData[index]
                                  .buttonColor
                                  .toString()
                                  .contains("red"))
                                return Colors.redAccent;
                              else {
                                if (showWinStatus &&
                                    boardData[index].buttonStatus)
                                  return Colors.blueGrey;
                                else
                                  return Colors.green;
                              }
                            }
                          },
                        ),
                      ),
                      onPressed: boardData[index].buttonStatus &&
                              (!showWinStatus)
                          ? (() {
                              setState(() {
                                buttonCount++;
                                boardData[index].buttonStatus = false;
                                GameLogic.currentValue.contains("X")
                                    ? {
                                        boardData[index].buttonValue = "X",
                                        GameLogic.currentValue = "0",
                                        lastValue = "0",
                                        boardData[index].buttonColor = "red",
                                        boardData[index].buttonPressedBy = "X",
                                        winDecider(true)
                                            ? {
                                                print("X Wins!"),
                                                whoWins = "X",
                                                showWinStatus = true,
                                                displayMoveStatus = false
                                              }
                                            : {
                                                if (buttonCount == 9)
                                                  {
                                                    finalMessage =
                                                        "No One Wins!",
                                                    displayMoveStatus = false
                                                  }
                                              }
                                      }
                                    : {
                                        boardData[index].buttonValue = "0",
                                        GameLogic.currentValue = "X",
                                        lastValue = "X",
                                        boardData[index].buttonColor = "green",
                                        boardData[index].buttonPressedBy = "0",
                                        winDecider(false)
                                            ? {
                                                print("0 Wins!"),
                                                whoWins = "0",
                                                showWinStatus = true,
                                                displayMoveStatus = false
                                              }
                                            : {
                                                if (buttonCount == 9)
                                                  {
                                                    finalMessage =
                                                        "No One Wins!",
                                                    displayMoveStatus = false
                                                  }
                                              }
                                      };
                              });
                            })
                          : null,
                      child: Container(
                        child: Text(
                          boardData[index].buttonValue,
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 30,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    );
                  },
                ),
              ),
              SizedBox(
                height: 40,
              ),
              ElevatedButton.icon(
                  style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.resolveWith(
                          (states) => MainColor.secondaryColor)),
                  onPressed: () {
                    setState(() {
                      restartAction();
                    });
                  },
                  icon: Icon(Icons.restart_alt_outlined),
                  label: Text(
                    "RESTART",
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
                  )),
              showWinStatus
                  ? Container(
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            "$whoWins Wins",
                            style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                                fontSize: 50,
                                height: 2),
                          )
                        ],
                      ),
                    )
                  : Container(
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            "$finalMessage",
                            style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                                fontSize: 50,
                                height: 2),
                          )
                        ],
                      ),
                    ),
            ],
          )),
    );
  }
}

restartAction() {
  for (int i = 0; i < boardData.length; i++) {
    boardData[i].buttonStatus = true;
    boardData[i].buttonValue = "";
    boardData[i].buttonColor = "blue";
    boardData[i].buttonPressedBy = "";
    GameLogic.currentValue = "X";
    lastValue = "x";
  }
  showWinStatus = false;
  displayMoveStatus = true;
  finalMessage = "";
  whoWins = "";
  buttonCount = 0;
}
