import 'package:app/utils/hang.dart';
import 'package:app/utils/memory.dart';
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
                                  builder: (context) => const JogoDaVelha(
                                        title: 'GameUp',
                                      )));
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
                                  builder: (context) => const JogoDaMemoria(
                                        title: 'GameUp',
                                      )));
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
  //TODO: se clicar no título tbm volta pro menu
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
                    'Enviar',
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

class JogoDaVelha extends StatefulWidget {
  const JogoDaVelha({super.key, required this.title});

  final String title;

  @override
  State<JogoDaVelha> createState() => _JogoDaVelha();
}

class _JogoDaVelha extends State<JogoDaVelha> {
  final Shader _linearGradient = const LinearGradient(
    colors: [Color.fromRGBO(255, 0, 199, 1.0), Colors.white],
    begin: Alignment.topCenter,
    end: Alignment.bottomCenter,
  ).createShader(const Rect.fromLTWH(0.0, 0.0, 300.0, 60.0));

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  final TextEditingController player1Controller = TextEditingController();
  final TextEditingController player2Controller = TextEditingController();

  late List<List<String>> _board;
  late String _currentPlayer;
  late String _winner;
  late bool _gameOver;

  @override
  void initState() {
    super.initState();
    _board = List.generate(3, (_) => List.generate(3, (_) => ""));
    _currentPlayer = "X";
    _winner = "";
    _gameOver = false;
  }

  void _resetGame() {
    setState(() {
      _board = List.generate(3, (_) => List.generate(3, (_) => ""));
      _currentPlayer = "X";
      _winner = "";
      _gameOver = false;
    });
  }

  void _makeMove(int row, int col) {
    if (_board[row][col] != "" || _gameOver) {
      return;
    }
    setState(() {
      _board[row][col] = _currentPlayer;
      if (_board[row][0] == _currentPlayer &&
          _board[row][1] == _currentPlayer &&
          _board[row][2] == _currentPlayer) {
        _winner = _currentPlayer;
        _gameOver = true;
      } else if (_board[0][col] == _currentPlayer &&
          _board[1][col] == _currentPlayer &&
          _board[2][col] == _currentPlayer) {
        _winner = _currentPlayer;
        _gameOver = true;
      } else if (_board[0][0] == _currentPlayer &&
          _board[1][1] == _currentPlayer &&
          _board[2][2] == _currentPlayer) {
        _winner = _currentPlayer;
        _gameOver = true;
      } else if (_board[0][2] == _currentPlayer &&
          _board[1][1] == _currentPlayer &&
          _board[2][0] == _currentPlayer) {
        _winner = _currentPlayer;
        _gameOver = true;
      }
      _currentPlayer = _currentPlayer == "X" ? "O" : "X";
      if (!_board.any((row) => row.any((cell) => cell == ""))) {
        _gameOver = true;
        _winner = "Empatou";
      }
      if (_winner != "") {}
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
      body: Container(
          decoration: const BoxDecoration(
              gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [
                Color.fromRGBO(58, 34, 204, 1.0),
                Color.fromRGBO(250, 1, 140, 1.0),
              ])),
          child: SingleChildScrollView(
              child: Padding(
            padding: EdgeInsets.fromLTRB(20, 20, 20, 0),
            child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    'Jogo da Velha',
                    style: TextStyle(
                        color: Colors.white, fontSize: 20, fontFamily: 'Inter'),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Container(
                    decoration: BoxDecoration(
                      color: Color.fromRGBO(250, 1, 140, 0.5),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    margin: EdgeInsets.fromLTRB(100, 5, 100, 2),
                    child: GridView.builder(
                        itemCount: 9,
                        shrinkWrap: true,
                        physics: NeverScrollableScrollPhysics(),
                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 3),
                        itemBuilder: (context, index) {
                          int row = index ~/ 3;
                          int col = index % 3;
                          return GestureDetector(
                            onTap: () => _makeMove(row, col),
                            child: Container(
                              margin: EdgeInsets.all(4),
                              decoration: BoxDecoration(
                                  color: Color.fromRGBO(58, 34, 204, 0.75),
                                  borderRadius: BorderRadius.circular(10)),
                              child: Center(
                                  child: Text(
                                _board[row][col],
                                style: TextStyle(
                                  fontSize: 120,
                                  fontWeight: FontWeight.bold,
                                  color: _board[row][col] == "X"
                                      ? Colors.black
                                      : Colors.white,
                                ),
                              )),
                            ),
                          );
                        }),
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  SizedBox(
                    height: 60,
                    child: Column(children: [
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            "Vez do: ",
                            style: TextStyle(fontSize: 16, color: Colors.white),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Text(
                                "X",
                                style: TextStyle(
                                    decoration: _currentPlayer == "X"
                                        ? TextDecoration.underline
                                        : TextDecoration.none,
                                    fontWeight: _currentPlayer == "X"
                                        ? FontWeight.bold
                                        : FontWeight.normal,
                                    fontSize: 35,
                                    color: Colors.black),
                              ),
                              Text(
                                "O",
                                style: TextStyle(
                                    decoration: _currentPlayer == "O"
                                        ? TextDecoration.underline
                                        : TextDecoration.none,
                                    fontWeight: _currentPlayer == "O"
                                        ? FontWeight.bold
                                        : FontWeight.normal,
                                    fontSize: 35,
                                    color: Colors.white),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ]),
                  ),
                  //TODO: adicionar um texto mostrando quem venceu ou que empatou
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      InkWell(
                        onTap: _resetGame,
                        child: Container(
                            margin: EdgeInsets.fromLTRB(0, 15, 0, 15),
                            decoration: BoxDecoration(
                              color: const Color.fromRGBO(58, 34, 204, 1.0),
                              borderRadius: BorderRadius.circular(10),
                            ),
                            padding: EdgeInsets.symmetric(
                                vertical: 18, horizontal: 20),
                            child: Text(
                              "Reiniciar",
                              style: TextStyle(
                                fontSize: 24,
                                fontWeight: FontWeight.bold,
                                color: Colors.white,
                              ),
                            )),
                      ),
                    ],
                  ),
                  const Text(
                    'V.0.0.1',
                    style: TextStyle(
                        color: Colors.white, fontSize: 12, fontFamily: 'Inter'),
                  ),
                ]),
          ))),
    );
  }
}

class JogoDaMemoria extends StatefulWidget {
  const JogoDaMemoria({super.key, required this.title});

  final String title;

  @override
  State<JogoDaMemoria> createState() => _JogoDaMemoria();
}

class _JogoDaMemoria extends State<JogoDaMemoria> {
  final Shader _linearGradient = const LinearGradient(
    colors: [Color.fromRGBO(255, 0, 199, 1.0), Colors.white],
    begin: Alignment.topCenter,
    end: Alignment.bottomCenter,
  ).createShader(const Rect.fromLTWH(0.0, 0.0, 300.0, 60.0));

  Memory _game = Memory();

  @override
  void initState() {
    super.initState();
    _game.initGame();
  }

  @override
  Widget build(BuildContext context) {
    double screen_width = MediaQuery.of(context).size.width;

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
        child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Center(
                child: Text(
                  "Jogo da Memória",
                  style: TextStyle(
                    fontSize: 20,
                    color: Colors.white,
                    fontFamily: 'Inter',
                  ),
                ),
              ),
              SizedBox(
                height: 24,
              ),
              SizedBox(
                height: displayWidth(context) * 0.5,
                width: displayWidth(context) * 0.5,
                child: GridView.builder(
                    itemCount: _game.gameImg!.length,
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 3,
                      crossAxisSpacing: 16,
                      mainAxisSpacing: 16,
                    ),
                    padding: EdgeInsets.all(16),
                    itemBuilder: (context, index) {
                      return GestureDetector(
                        onTap: () {
                          print(_game.cards_list[index]);
                          setState(() {
                            _game.gameImg![index] = _game.cards_list[index];
                            _game.matchCheck
                                .add({index: _game.cards_list[index]});
                          });
                          if (_game.matchCheck.length == 2) {
                            if (_game.matchCheck[0].values.first ==
                                _game.matchCheck[1].values.first) {
                              print("true");
                              _game.matchCheck.clear();
                            } else {
                              print("false");
                              Future.delayed(Duration(milliseconds: 500), () {
                                print(_game.gameImg);
                                setState(() {
                                  _game.gameImg![_game.matchCheck[0].keys
                                      .first] = _game.hiddenCardpath;
                                  _game.gameImg![_game.matchCheck[1].keys
                                      .first] = _game.hiddenCardpath;
                                  _game.matchCheck.clear();
                                });
                              });
                            }
                          }
                        },
                        child: Container(
                          padding: EdgeInsets.all(16),
                          decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(15),
                              image: DecorationImage(
                                image: AssetImage(_game.gameImg![index]),
                                fit: BoxFit.cover,
                              )),
                        ),
                      );
                    }),
              ),
              const Text(
                'V.0.0.1',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 12,
                  fontFamily: 'Inter',
                ),
              ),
            ]),
      ),
    );
  }
}
