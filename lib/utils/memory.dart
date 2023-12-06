class Memory {
  final String hiddenCardpath = '/images/G.png';
  List<String>? gameImg;

  final List<String> cards_list = [
    "/images/circle.png",
    "/images/triangle.png",
    "/images/circle.png",
    "/images/heart.png",
    "/images/star.png",
    "/images/triangle.png",
    "/images/star.png",
    "/images/joker.png",
    "/images/heart.png",
  ];

  List<Map<int, String>> matchCheck = [];

  final int cardCount = 9;

  void initGame() {
    gameImg = List.generate(cardCount, (index) => hiddenCardpath);
  }
}
