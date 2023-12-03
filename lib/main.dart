import 'package:flutter/material.dart';
import 'package:app/sizes_helpers.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'GameUp',
      home: MyHomePage(title: 'GameUp'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final Shader _linearGradient = const LinearGradient(
    colors: [Color.fromRGBO(255, 0, 199, 1.0), Colors.white],
    begin: Alignment.topCenter,
    end: Alignment.bottomCenter,
  ).createShader(const Rect.fromLTWH(0.0, 0.0, 300.0, 60.0));

  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      _counter++;
      print(_counter);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          widget.title,
          style: TextStyle(
            fontFamily: 'LuckiestGuy',
            fontSize: 50,
            foreground: Paint()..shader = _linearGradient,
          ),
        ),
        backgroundColor: const Color.fromRGBO(58, 34, 204, 1.0),
      ),
      body: Center(
        child: Container(
            decoration: const BoxDecoration(
                gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: [
                  Color.fromRGBO(58, 34, 204, 1.0),
                  Color.fromRGBO(250, 1, 140, 1.0),
                ])),
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Container(
                    width: displayWidth(context),
                    decoration: const BoxDecoration(
                        border: Border(
                      top: BorderSide(width: 2.0, color: Colors.white),
                    )),
                    child: TextButton(
                        style: TextButton.styleFrom(
                          padding: const EdgeInsets.fromLTRB(0, 50, 0, 50),
                        ),
                        onPressed: _incrementCounter,
                        child: const Text(
                          'Jogo da Forca',
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 27,
                              fontFamily: 'Inter'),
                        )),
                  ),
                  Container(
                    width: displayWidth(context),
                    decoration: const BoxDecoration(
                        border: Border(
                            top: BorderSide(width: 2.0, color: Colors.white),
                            bottom:
                                BorderSide(width: 2.0, color: Colors.white))),
                    child: TextButton(
                        style: TextButton.styleFrom(
                          padding: const EdgeInsets.fromLTRB(0, 50, 0, 50),
                        ),
                        onPressed: _incrementCounter,
                        child: const Text(
                          'Jogo da Velha',
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 27,
                              fontFamily: 'Inter'),
                        )),
                  ),
                  Container(
                    width: displayWidth(context),
                    decoration: const BoxDecoration(
                        border: Border(
                            bottom:
                                BorderSide(width: 2.0, color: Colors.white))),
                    child: TextButton(
                        style: TextButton.styleFrom(
                          padding: const EdgeInsets.fromLTRB(0, 50, 0, 50),
                        ),
                        onPressed: _incrementCounter,
                        child: const Text(
                          'Jogo da Memória',
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 27,
                              fontFamily: 'Inter'),
                        )),
                  ),
                  const Text(
                    'V.0.0.1',
                    style: TextStyle(
                        color: Colors.white, fontSize: 12, fontFamily: 'Inter'),
                  ),
                ],
              ),
            )),
      ),
    );
  }
}
