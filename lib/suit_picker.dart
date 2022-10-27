import "enums.dart";
import "package:flutter/material.dart";

class SuitPicker extends StatefulWidget {
  final Suit suit;
  final String name;
  final void Function(Suit suit) setSuit;
  final double iconSize;

  const SuitPicker({
    super.key,
    required this.suit,
    required this.name,
    required this.setSuit,
    required this.iconSize,
  });

  @override
  State<SuitPicker> createState() => _SuitPickerState();
}

class _SuitPickerState extends State<SuitPicker> {
  bool isPicking = false;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(bottom: 8),
      child: Row(children: [
        Expanded(
          child: Row(children: [
            const Spacer(),
            Text("${widget.name}:"),
            const SizedBox(width: 10),
          ]),
        ),
        _buildSuitRow(),
      ]),
    );
  }

  Widget _buildSuitRow() {
    if (isPicking) {
      return Expanded(
        child: Row(
          children: Suit.values
              .map((suit) => GestureDetector(
                    onTap: () {
                      setState(() => isPicking = false);
                      widget.setSuit(suit);
                    },
                    child: Image.asset(
                      suit.filename,
                      width: widget.iconSize,
                      height: widget.iconSize,
                    ),
                  ))
              .toList(),
        ),
      );
    }
    return Expanded(
      child: Row(children: [
        GestureDetector(
          onTap: () => setState(() => isPicking = true),
          child: Image.asset(
            widget.suit.filename,
            width: widget.iconSize,
            height: widget.iconSize,
          ),
        ),
        const Spacer(),
      ]),
    );
  }
}
