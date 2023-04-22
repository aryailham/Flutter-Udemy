import 'package:flutter/material.dart';

class ReusableCard extends StatelessWidget {
  ReusableCard({ this.color = const Color(0xFF1D1E33)});

  final Color color;

  @override
  Widget build(BuildContext context) {
    return Expanded(
        flex: 1,
        child: Container(
          width: double.maxFinite,
          height: double.maxFinite,
          margin: EdgeInsets.all(15),
          decoration: BoxDecoration(
              color: this.color,
              borderRadius: BorderRadius.circular(10.0)
          ),
        )
    );
  }
}