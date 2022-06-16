import 'dart:math';

import 'package:flutter/material.dart';

class TicTacToeWidget extends StatefulWidget {
  @override
  _TicTacToeWidgetState createState() => _TicTacToeWidgetState();
}

class _TicTacToeWidgetState extends State<TicTacToeWidget> {
  final Random _random = new Random();

  int numR = _TicTacToeWidgetState.numRandom(0, 2);

  String jugadorTurno = "X";
  String ganador = "";
  bool partidaTerminada = false;

  List<String> row0 = ["", "", ""];
  List<String> row1 = ["", "", ""];
  List<String> row2 = ["", "", ""];

  bool comprobarResultado(String actual) {
    bool ganador = false;
    if (row0[0] == actual && row0[1] == actual && row0[2] == actual) {
      ganador = true;
    } else if (row1[0] == actual && row1[1] == actual && row1[2] == actual) {
      ganador = true;
    } else if (row2[0] == actual && row2[1] == actual && row2[2] == actual) {
      ganador = true;
    } else if (row0[0] == actual && row1[1] == actual && row2[2] == actual) {
      ganador = true;
    } else if (row2[0] == actual && row1[1] == actual && row0[2] == actual) {
      ganador = true;
    } else if (row0[0] == actual && row1[0] == actual && row2[0] == actual) {
      ganador = true;
    } else if (row0[1] == actual && row1[1] == actual && row2[1] == actual) {
      ganador = true;
    } else if (row0[2] == actual && row1[2] == actual && row2[2] == actual) {
      ganador = true;
    }

    if (ganador) {
      partidaTerminada = true;
    }

    return ganador;
  }

  void cambioTurno(String turnoActual) {
    print("numeroPrint $numR");
    jugadorTurno = turnoActual == "X" ? "O" : "X";
  }

  static int numRandom([int? min, int? max]) {
    Random _random = new Random();
    int minInt = (min == null ? 0 : int.parse(min.toString()));
    int maxInt = (max == null ? 100 : int.parse(max.toString()));
    int numAleatorio = minInt + _random.nextInt(maxInt - minInt);
    return numAleatorio;
  }

  void _fillBox(String turnoActual, int row, int col) {
    setState(() {
      if (!partidaTerminada) {
        switch (row) {
          case 0:
            if (row0[col] == "") {
              row0[col] = turnoActual;
              cambioTurno(turnoActual);
            }
            break;
          case 1:
            if (row1[col] == "") {
              row1[col] = turnoActual;
              cambioTurno(turnoActual);
            }
            break;
          case 2:
            if (row2[col] == "") {
              row2[col] = turnoActual;
              cambioTurno(turnoActual);
            }
            break;
        }

        if (comprobarResultado(turnoActual)) {
          ganador = "El ganador es $turnoActual";
        }
      }
    });
  }

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('TicTacToe'),
        ),
        body: Center(
          child: Column(
            children: [
              const Text(
                "Jugador en Turno",
                style: TextStyle(fontSize: 24),
              ),
              Expanded(
                  child: GridView.count(
                crossAxisCount: 3,
                children: [
                  ElevatedButton(
                      onPressed: () => _fillBox(jugadorTurno, 0, 0),
                      child: Text(
                        row0[0],
                        style: TextStyle(fontSize: 80),
                      )),
                  ElevatedButton(
                      onPressed: () => _fillBox(jugadorTurno, 0, 1),
                      child: Text(
                        row0[1],
                        style: TextStyle(fontSize: 80),
                      )),
                  ElevatedButton(
                      onPressed: () => _fillBox(jugadorTurno, 0, 2),
                      child: Text(
                        row0[2],
                        style: TextStyle(fontSize: 80),
                      )),
                  ElevatedButton(
                      onPressed: () => _fillBox(jugadorTurno, 1, 0),
                      child: Text(
                        row1[0],
                        style: TextStyle(fontSize: 80),
                      )),
                  ElevatedButton(
                      onPressed: () => _fillBox(jugadorTurno, 1, 1),
                      child: Text(
                        row1[1],
                        style: TextStyle(fontSize: 80),
                      )),
                  ElevatedButton(
                      onPressed: () => _fillBox(jugadorTurno, 1, 2),
                      child: Text(
                        row1[2],
                        style: TextStyle(fontSize: 80),
                      )),
                  ElevatedButton(
                      onPressed: () => _fillBox(jugadorTurno, 2, 0),
                      child: Text(
                        row2[0],
                        style: TextStyle(fontSize: 80),
                      )),
                  ElevatedButton(
                      onPressed: () => _fillBox(jugadorTurno, 2, 1),
                      child: Text(
                        row2[1],
                        style: TextStyle(fontSize: 80),
                      )),
                  ElevatedButton(
                      onPressed: () => _fillBox(jugadorTurno, 2, 2),
                      child: Text(
                        row2[2],
                        style: TextStyle(fontSize: 80),
                      ))
                ],
              )),
              Text(
                ganador,
                style: const TextStyle(fontSize: 32),
              )
            ],
          ),
        ));
  }
}
