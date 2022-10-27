enum Suit { diamonds, clubs, hearts, spades }

extension SuitFilename on Suit {
  String get filename => "${name[0].toUpperCase()}.png";
  String get path => "assets/$filename";
}

enum Rank { ace, king, queen, jack, ten, nine }

extension RankFilename on Rank {
  String get filenamePrefix => name[0].toUpperCase();
}

class PlayingCard {
  final Suit suit;
  final Rank rank;

  PlayingCard(this.suit, this.rank);

  String get filename => rank.filenamePrefix + suit.filename;
  String get path => "assets/$filename";
}
