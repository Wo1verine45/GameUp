import 'package:app/utils/hang.dart';
import 'package:app/widget/figure_image.dart';
import 'package:app/widget/letter.dart';
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
      //TODO: o título ficou muito grudado em cima
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
                        onPressed: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => const JogoDaForca(
                                        title: 'GameUp',
                                      )));
                        },
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
                        onPressed: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => const NextPage2()));
                        },
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
                        onPressed: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => const NextPage3()));
                        },
                        child: const Text(
                          'Jogo da Memória',
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 27,
                              fontFamily: 'Inter'),
                        )),
                  ),
                  //TODO: colocar na parte de baixo da tela
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

class JogoDaForca extends StatefulWidget {
  const JogoDaForca({super.key, required this.title});

  final String title;

  @override
  State<JogoDaForca> createState() => _JogoDaForca();
}

class _JogoDaForca extends State<JogoDaForca> {
  //TODO: colocar todas as palavras, talvez seja muito difícil
  String word = "Flutter".toUpperCase();
  List<String> alphabets = [
    "A",
    "B",
    "C",
    "D",
    "E",
    "F",
    "G",
    "H",
    "I",
    "J",
    "K",
    "L",
    "M",
    "N",
    "O",
    "P",
    "Q",
    "R",
    "S",
    "T",
    "U",
    "V",
    "W",
    "X",
    "Y",
    "Z"
  ];

  final _textController = TextEditingController();
  String userPost = '';

  final Shader _linearGradient = const LinearGradient(
    colors: [Color.fromRGBO(255, 0, 199, 1.0), Colors.white],
    begin: Alignment.topCenter,
    end: Alignment.bottomCenter,
  ).createShader(const Rect.fromLTWH(0.0, 0.0, 300.0, 60.0));

  //TODO: mudar o design para o do figma
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
      body: Container(
          decoration: const BoxDecoration(
              gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [
                Color.fromRGBO(58, 34, 204, 1.0),
                Color.fromRGBO(250, 1, 140, 1.0),
              ])),
          child: Padding(
            padding: const EdgeInsets.fromLTRB(20, 20, 20, 0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const Text(
                  'Jogo da Forca',
                  style: TextStyle(
                      color: Colors.white, fontSize: 20, fontFamily: 'Inter'),
                ),
                const Text(
                  'Letras Usadas:',
                  style: TextStyle(
                      color: Colors.white, fontSize: 16, fontFamily: 'Inter'),
                ),
                SizedBox(
                  width: double.infinity,
                  height: 50,
                  child: GridView.count(
                    crossAxisCount: 26,
                    padding: const EdgeInsets.all(8),
                    children: alphabets.map((e) {
                      return Text(
                        Hang.selectedChar.contains(e) ? e : '',
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 16,
                          fontFamily: 'Inter',
                        ),
                      );
                    }).toList(),
                  ),
                ),
                Center(
                  child: Stack(
                    children: [
                      figureImage(Hang.tries >= 0, "images/hang.png"),
                      figureImage(Hang.tries >= 1, "images/head.png"),
                      figureImage(Hang.tries >= 2, "images/body.png"),
                      figureImage(Hang.tries >= 3, "images/ra.png"),
                      figureImage(Hang.tries >= 4, "images/la.png"),
                      figureImage(Hang.tries >= 5, "images/rl.png"),
                      figureImage(Hang.tries >= 6, "images/ll.png"),
                    ],
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: word
                      .split('')
                      .map((e) => letter(e.toUpperCase(),
                          !Hang.selectedChar.contains(e.toUpperCase())))
                      .toList(),
                ),
                const Text(
                  'Digite uma letra:',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 12,
                    fontFamily: 'Inter',
                  ),
                ),
                //TODO: fazer com que o usuário só possa escrever uma letra
                TextField(
                  controller: _textController,
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(15))),
                    filled: true,
                    fillColor: Colors.white,
                  ),
                ),
                MaterialButton(
                  onPressed: () {
                    setState(() {
                      userPost = _textController.text.toUpperCase();
                      Hang.selectedChar.contains(userPost)
                          ? null
                          : Hang.selectedChar.add(userPost);
                      print(Hang.selectedChar);
                      if (!word.split('').contains(userPost.toUpperCase())) {
                        Hang.tries++;
                      }
                    });
                  },
                  color: const Color.fromRGBO(58, 34, 204, 1.0),
                  child: const Text(
                    'Post',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 12,
                      fontFamily: 'Inter',
                    ),
                  ),
                ),
                const Text(
                  'V.0.0.1',
                  style: TextStyle(
                      color: Colors.white, fontSize: 12, fontFamily: 'Inter'),
                ),
              ],
            ),
          )),
    );
  }
}
//TODO: adicionar um fim pra forca

class NextPage2 extends StatelessWidget {
  const NextPage2({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Next Page'),
      ),
      body: const Center(
        child: Text('GeeksForGeeks'),
      ),
    );
  }
}

class NextPage3 extends StatelessWidget {
  const NextPage3({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Next Page'),
      ),
      body: const Center(
        child: Text('GeeksForGeeks'),
      ),
    );
  }
}
