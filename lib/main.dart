import 'dart:math';

import 'package:flutter/material.dart';

import 'package:jusp_1_2_variables/widgets/w01VarieblesWidget.dart';
import 'package:jusp_1_2_variables/widgets/w02ContenedoresWidget.dart';
import 'package:jusp_1_2_variables/widgets/w03TicTacToeWidget.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Variables',
      theme: ThemeData(
        primarySwatch: Colors.deepOrange,
      ),
      home: const MyHomePage(title: 'Ciclo de vida'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  void _iniciarWidget(int pagina) {
    switch (pagina) {
      case 1:
        Navigator.push(context,
            MaterialPageRoute(builder: (BuildContext context) {
          return VariablesWidget();
        }));
        break;
      case 2:
        Navigator.push(context,
            MaterialPageRoute(builder: (BuildContext context) {
          return ContenedoresWidget();
        }));
        break;
      case 3:
        Navigator.push(context,
            MaterialPageRoute(builder: (BuildContext context) {
          return TicTacToeWidget();
        }));
        break;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(widget.title),
        ),
        body: Center(
          child: Column(
            children: [
              Text('Verificacion del ciclo de vida'),
              ElevatedButton(
                  onPressed: () => _iniciarWidget(1), child: Text('Variables')),
              ElevatedButton(
                  onPressed: () => _iniciarWidget(2),
                  child: Text('Contenedores')),
              ElevatedButton(
                  onPressed: () => _iniciarWidget(3), child: Text("TicTacToe"))
            ],
          ),
        ));
  }
}
