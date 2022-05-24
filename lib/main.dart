import 'dart:math';

import 'package:flutter/material.dart';

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
        primarySwatch: Colors.teal,
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
  void _iniciarWidget() {
    Navigator.push(context, MaterialPageRoute(builder: (BuildContext context){
      return new VariablesWidget();
    }));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: const Center(
        child: Text('Verificacion del ciclo de vida')
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _iniciarWidget,
        tooltip: 'Iniciar widget',
        child: const Icon(Icons.open_in_new),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}

class VariablesWidget extends StatefulWidget {
  @override
  _VariablesWidgetState createState() => _VariablesWidgetState();
}

class _VariablesWidgetState extends State<VariablesWidget> {
  // Funciones del ciclo de vida
  int _contador = 0;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    print("Se ha iniciado el widget");
  }

  @override
  void dispose() {
    // TODO: implement dispose
    print("Se ha eliminado el widget");
    super.dispose();
  }

  void _sumar() {
    _contador++;
    print(_contador);
  }

  void _sumarState() {
    setState(() {
      _contador = _contador + 2;
      print(_contador);
    });
    print(_contador);
  }

  // Decralarion de variables

  void _imprimirMensajes() {
    String nombre = "Jonathan Ulises";
    int edad = 0;
    bool trabajo = true;
    double estatura = 1.87;
    DateTime hoy = DateTime.now();
    int? edadNull = null; //permite null
    bool? trabajoNull = null; // permite null
    double? estaturaNull = null; //permite null

    double num1 = 20;
    double num2 = 5;
    double resultado = num1 + num2;
    print("$num1+$num2=$resultado");
    resultado = num1 - num2;
    print("$num1-$num2=$resultado");
    resultado = num1 * num2;
    print("$num1*$num2=$resultado");
    resultado = num1 / num2;
    print("$num1/$num2=$resultado");
    resultado = num1 % num2;
    print("El residuo de $num1/$num2 es $resultado");
    Random _random = new Random();
    int min = 5;
    int max = 10;
    for (var i = 0; i < 10; i++) {
      int numAleatorio = min + _random.nextInt(max - min);
      print("Número aleatorio $numAleatorio entre $min y $max");
    }

    String texto = " hola, buenos días ";
    texto = texto.trim();
    texto = texto.toUpperCase();
    texto = texto.toLowerCase();
    texto = texto.substring(0,13);
    texto = texto.replaceAll("buenos", "buenas");
    texto = texto + "noches";
    List<String> palabras = texto.split(" ");
    String oracion = palabras.join(",");

    List<int> numeros = [1,2,3,6,9];
    numeros.removeAt(4); // <- Quitar un elemento
    numeros[3] = 4; // Actualizar un elemento
    numeros.add(5); // Agregar un elemento
    int primero = numeros.first; // Recuperar el primer elemento
    int ultimo = numeros.last; // Recuperar el último elemento
    List<int> seleccionados = numeros.where((element) => element > 3 ).toList(); // Filtrar elementos
    int siguiente = numeros.firstWhere((element) => element > 3 ); // Filtrar un elemento

    int numAleatorio = 1 + _random.nextInt(3 - 1);
    if(numAleatorio == 1){
      print('Primero');
    } else if (numAleatorio == 2) {
      print('Segundo');
    } else {
      print('Tercero');
    }

    switch(numAleatorio){
      case 1:
        print('Primero');
        break;
      case 2:
        print('Segundo');
        break;
      default:
        print('Tercero');
    }

    for(int i = 0; i < numeros.length; i++){
      print('Ciclo for: $i° = $numeros[$i]');
    }

    int i = 0;
    while(i < numeros.length){
      print('Ciclo while: $i° = $numeros[$i]');
      i++;
    }

    i = 0;
    do{
      print('Ciclo do-while: $i° = $numeros[$i]');
      i++;
    } while(i < numeros.length);

    imprimirMensaje("Función void");
    var aleatorio = numRandom();
    print("Num. Aleatorio: $aleatorio");
    aleatorio = numRandom(10,15);
    print("Num. Aleatorio: $aleatorio");
  }

  void imprimirMensaje(String mensaje) {
    print("Mensaje informativo: $mensaje");
  }

  int numRandom([int? min, int? max]){
    Random _random = new Random();
    int minInt = (min == null ? 0 : int.parse(min.toString()));
    int maxInt = (max == null ? 100 : int.parse(max.toString()));
    int numAleatorio = minInt + _random.nextInt(maxInt - minInt);
    return numAleatorio;
  }

  void _regresar(){
    Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Variables'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text("Valor del contador = $_contador"),
            ElevatedButton(onPressed: _sumar,child: Text("Sumar")),
            ElevatedButton(onPressed: _sumarState, child: Text("Sumar (SET STATE)")),
            ElevatedButton(onPressed: _regresar, child: Text("Regresar"))
          ],
        ),
      ),
    );
  }
}
