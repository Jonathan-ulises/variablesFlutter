import 'dart:math';

import 'package:flutter/material.dart';

class ContenedoresWidget extends StatefulWidget {
  @override
  _ContenedoresWidgetState createState() => _ContenedoresWidgetState();
}

class _ContenedoresWidgetState extends State<ContenedoresWidget> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  void _regresar() {
    Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {
    print("Alto:" + MediaQuery.of(context).size.height.toString());
    print("Ancho:" + MediaQuery.of(context).size.width.toString());

    MediaQueryData media = MediaQuery.of(context);
    print(media.orientation.toString());

    return Scaffold(
      appBar: AppBar(
        title: Text('Contenedores'),
      ),
      body: Center(
        child: Column(children: [
          Row(
            children: [
              const Text('Texto 1'),
              const Text('Texto 2'),
              Container(
                  child: const Text('Texto 3'),
                  width: 150,
                  alignment: Alignment.center)
            ],
          ),
          Column(
            children: [
              const Text('Texto 1'),
              const Text('Texto 2'),
              Container(
                  child: const Text('Texto3'),
                  width: 150,
                  alignment: Alignment.center)
            ],
          ),
          Row(
            children: [
              Expanded(
                flex: 2,
                child: Container(color: Colors.amber, height: 100),
              ),
              Container(
                color: Colors.lime,
                width: 100,
                height: 100,
              ),
              Expanded(
                child: Container(color: Colors.red, height: 100),
              )
            ],
          ),
          Container(
              child: const Text(
                'Izquierda',
                style: TextStyle(color: Colors.white),
              ),
              alignment: Alignment.topLeft,
              color: Colors.black,
              height: 50),
          Container(
              child: const Text('Derecha'),
              alignment: Alignment.bottomRight,
              color: Colors.yellow,
              height: 50),
          Container(
              child: const Text('Centro'),
              alignment: Alignment.center,
              color: Colors.red,
              height: 50),
          Expanded(
            child: GridView.count(
              crossAxisCount: 3,
              children: [
                const Text("X",
                    style: TextStyle(color: Colors.blueAccent, fontSize: 80)),
                const Text("O"),
                const Text("X"),
                const Text("O"),
                const Text("X"),
                const Text("O"),
                ElevatedButton(
                  onPressed: () => {},
                  child: const Text("Boton con estilo"),
                  style: ElevatedButton.styleFrom(
                      fixedSize: Size(100, 50),
                      primary: HexColor("b74093"),
                      onPrimary: Colors.white),
                ),
                ElevatedButton.icon(
                    onPressed: () => {},
                    icon: Icon(Icons.account_balance, color: Colors.white),
                    label: Text('Boton Icon'))
              ],
            ),
          ),
          Expanded(
            child: Container(
              height: 100,
              width: 300,
              child: GridView.count(
                crossAxisCount: 5,
                children: List.generate(100, (index) {
                  return Center(child: Text('Item ${index + 1}'));
                }),
              ),
            ),
          )
        ]),
      ),
    );
  }
}

class HexColor extends Color {
  static int _getColorFromHex(String hexColor) {
    hexColor = hexColor.toUpperCase().replaceAll('#', '');
    if (hexColor.length == 6) {
      hexColor = "FF" + hexColor;
    }

    return int.parse(hexColor, radix: 16);
  }

  HexColor(final String hexColor) : super(_getColorFromHex(hexColor));
}
