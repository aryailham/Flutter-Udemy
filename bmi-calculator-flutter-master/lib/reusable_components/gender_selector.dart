import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class GenderSelector extends StatelessWidget {
  GenderSelector({this.genderIcon = FontAwesomeIcons.mars, this.genderTitle = "Male"});

  final genderIcon;
  final genderTitle;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: double.infinity,
      width: double.infinity,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Icon(
            genderIcon,
            size: 120,
          ),
          Text(
            genderTitle,
            style: TextStyle(
                fontSize: 20,
                color: Colors.grey[300]
            ),
          )
        ],
      ),
    );
  }
}
