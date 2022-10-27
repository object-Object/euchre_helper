import "package:flutter/material.dart";
import "enums.dart";

class CardOrder extends StatelessWidget {
  final Suit trump;
  final Suit leading;
  final double iconSize;

  const CardOrder({
    super.key,
    required this.trump,
    required this.leading,
    required this.iconSize,
  });

  @override
  Widget build(BuildContext context) {
    return Table(
      children: [
        _buildCardRow(_getTrumpCards()),
        if (trump != leading) _buildCardRow(_getLeadingCards()),
      ],
    );
  }

  TableRow _buildCardRow(List<PlayingCard> cards) {
    List<Widget> children = cards
        .map((c) => Container(
              padding: const EdgeInsets.only(bottom: 16),
              child: Image.asset(
                c.filename,
                height: iconSize,
              ),
            ))
        .toList();

    while (children.length < 7) {
      children.add(Container());
    }

    return TableRow(
      children: children,
    );
  }

  List<PlayingCard> _getTrumpCards() {
    return [
      PlayingCard(trump, Rank.jack),
      PlayingCard(_getLeftBowerSuit(), Rank.jack),
      PlayingCard(trump, Rank.ace),
      PlayingCard(trump, Rank.king),
      PlayingCard(trump, Rank.queen),
      PlayingCard(trump, Rank.ten),
      PlayingCard(trump, Rank.nine),
    ];
  }

  List<PlayingCard> _getLeadingCards() {
    return [
      PlayingCard(leading, Rank.ace),
      PlayingCard(leading, Rank.king),
      PlayingCard(leading, Rank.queen),
      if (leading != _getLeftBowerSuit()) PlayingCard(leading, Rank.jack),
      PlayingCard(leading, Rank.ten),
      PlayingCard(leading, Rank.nine),
    ];
  }

  Suit _getLeftBowerSuit() {
    switch (trump) {
      case Suit.clubs:
        return Suit.spades;
      case Suit.spades:
        return Suit.clubs;
      case Suit.hearts:
        return Suit.diamonds;
      case Suit.diamonds:
        return Suit.hearts;
    }
  }
}
