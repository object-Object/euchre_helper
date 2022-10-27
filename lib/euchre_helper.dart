import "package:flutter/material.dart";
import "card_order.dart";
import "enums.dart";
import "suit_picker.dart";

class EuchreHelper extends StatefulWidget {
  const EuchreHelper({super.key});

  @override
  State<EuchreHelper> createState() => _EuchreHelperState();
}

class _EuchreHelperState extends State<EuchreHelper> {
  Suit trump = Suit.hearts;
  Suit leading = Suit.spades;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      child: ListView(
        children: [
          SuitPicker(
            name: "Trump",
            suit: trump,
            setSuit: (suit) => setState(() => trump = suit),
            iconSize: 48,
          ),
          SuitPicker(
            name: "Leading card",
            suit: leading,
            setSuit: (suit) => setState(() => leading = suit),
            iconSize: 48,
          ),
          const SizedBox(height: 10),
          CardOrder(
            trump: trump,
            leading: leading,
            iconSize: 96,
          ),
        ],
      ),
    );
  }
}
