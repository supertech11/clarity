import 'package:flutter/material.dart';

class SlideDots extends StatelessWidget {
  final int index;
  SlideDots(this.index, {Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: Duration(microseconds: 150),
      margin: const EdgeInsets.symmetric(horizontal: 4),
      height: 6,
      width: 42,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(8),
      ),
      child: Row(
        mainAxisAlignment:
            index == 0 ? MainAxisAlignment.start : MainAxisAlignment.end,
        children: [
          Container(
            key: Key("indicator"),
            margin: const EdgeInsets.all(1),
            height: 4,
            width: 20.69,
            decoration: BoxDecoration(
              color: Theme.of(context).primaryColor,
              borderRadius: BorderRadius.circular(8),
            ),
          ),
        ],
      ),
    );
  }
}
