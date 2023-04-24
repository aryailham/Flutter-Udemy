import 'package:flutter/material.dart';

class ReusableCard extends StatelessWidget {
  ReusableCard({ this.color = const Color(0xFF1D1E33), this.cardChild, this.onPress});

  final Color color;
  final Widget cardChild;
  final Function onPress;

  @override
  Widget build(BuildContext context) {
    return Expanded(
        flex: 1,
        child: GestureDetector(
          onTap: onPress,
          child: Container(
            child: cardChild,
            width: double.maxFinite,
            height: double.maxFinite,
            margin: EdgeInsets.all(15),
            decoration: BoxDecoration(
                color: this.color,
                borderRadius: BorderRadius.circular(10.0)
            ),
          ),
        )
    );
  }
}
