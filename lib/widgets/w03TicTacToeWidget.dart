import 'package:flutter/material.dart';

class TicTacToeWidget extends StatefulWidget {
  @override
  _TicTacToeWidgetState createState() => _TicTacToeWidgetState();
}

class _TicTacToeWidgetState extends State<TicTacToeWidget> {
  String jugadorTurno = "X";

  List<String> row1 = ["", "", ""];
  List<String> row2 = ["", "", ""];
  List<String> row3 = ["", "", ""];

  //Lista de text de botones
  String pos0_0 = "";
  String pos0_1 = "";
  String pos0_2 = "";
  String pos1_0 = "";
  String pos1_1 = "";
  String pos1_2 = "";
  String pos2_0 = "";
  String pos2_1 = "";
  String pos2_2 = "";

  // Creating two dimensional list

  void cambioTurno(String turnoActual) {
    jugadorTurno = turnoActual == "X" ? "O" : "X";
  }

  void _fillBoton(String turnoActual, String posicion) {
    setState(() {
      pos0_0 = turnoActual;

      switch (posicion) {
        case 'pos0_0':
          pos0_0 = turnoActual;
          break;
      }
      cambioTurno(turnoActual);
    });

    print(pos0_0);
  }

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('TicTacToe'),
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
                      onPressed: () => _fillBoton(jugadorTurno, pos0_0),
                      child: Text(
                        pos0_0,
                        style: TextStyle(fontSize: 80),
                      )),
                  ElevatedButton(
                      onPressed: () => {pos0_1},
                      child: Text(
                        pos0_1,
                        style: TextStyle(fontSize: 80),
                      )),
                  ElevatedButton(
                      onPressed: () => {},
                      child: Text(
                        pos0_2,
                        style: TextStyle(fontSize: 80),
                      )),
                  ElevatedButton(
                      onPressed: () => {},
                      child: Text(
                        pos1_0,
                        style: TextStyle(fontSize: 80),
                      )),
                  ElevatedButton(
                      onPressed: () => {},
                      child: Text(
                        pos1_1,
                        style: TextStyle(fontSize: 80),
                      )),
                  ElevatedButton(
                      onPressed: () => {},
                      child: Text(
                        pos1_2,
                        style: TextStyle(fontSize: 80),
                      )),
                  ElevatedButton(
                      onPressed: () => {},
                      child: Text(
                        pos2_0,
                        style: TextStyle(fontSize: 80),
                      )),
                  ElevatedButton(
                      onPressed: () => {},
                      child: Text(
                        pos2_1,
                        style: TextStyle(fontSize: 80),
                      )),
                  ElevatedButton(
                      onPressed: () => {},
                      child: Text(
                        pos2_2,
                        style: TextStyle(fontSize: 80),
                      ))
                ],
              ))
            ],
          ),
        ));
  }
}
