import 'dart:math';

import 'package:flutter/material.dart';


void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
        scaffoldBackgroundColor: Colors.orange,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: MyHomePage(title: 'Joga Dados'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  var _frase = "QUAL O NÚMERO QUE DEU?";

  var _imagens = [
    'imagens/dice1.png',
    'imagens/dice2.png',
    'imagens/dice3.png',
    'imagens/dice4.png',
    'imagens/dice5.png',
    'imagens/dice6.png',
  ];

  var _dado1 = 'imagens/dice1.png';
  var _dado2 = 'imagens/dice6.png';

  void _gerarNumero() {
    var numeroSorteado1 = Random().nextInt(5);
    var numeroSorteado2 = Random().nextInt(5);
    setState(() {
      _frase = 'O NÚMERO É ' + (numeroSorteado1 + numeroSorteado2).toString();
      _dado1 = _imagens[numeroSorteado1 - 1];
      _dado2 = _imagens[numeroSorteado2 - 1];
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Joga Dados"),
        backgroundColor: Colors.black,
      ),
      body: Center(
        child: Column(

          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.center,

          children: <Widget>[
            Row(
              children: [
                Image.asset(_dado1, width: MediaQuery.of(context).size.width/3),
                Image.asset(_dado2, width: MediaQuery.of(context).size.width/3),
              ], mainAxisAlignment: MainAxisAlignment.spaceEvenly,

            ),

            Text(
              _frase,
              style: TextStyle(
                fontSize: 25,
                fontStyle: FontStyle.italic,

              ),
            ),
            RaisedButton(onPressed: _gerarNumero,
              color: Colors.blue,
              child: Text(
                "PRESSIONE",
                style: TextStyle(
                  fontSize: 25
                ),
              ),
            )
          ],
        ),
      ),

    );
  }
}
