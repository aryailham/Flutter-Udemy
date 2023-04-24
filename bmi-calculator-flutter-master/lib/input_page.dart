import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'reusable_components/reusable_card.dart';
import 'reusable_components/gender_selector.dart';
import 'constants.dart';

enum Gender { male, female }

class InputPage extends StatefulWidget {
  @override
  _InputPageState createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {
  Gender selectedGender;

  Color maleCardColor = kInactiveCardColor;
  Color femaleCardColor = kInactiveCardColor;
  int height = 170;

  void changeGender(Gender gender) {
    selectedGender = gender;

    setState(() {
      maleCardColor =
          gender == Gender.male ? kInactiveCardColor : kActiveCardColor;
      femaleCardColor =
          gender == Gender.female ? kInactiveCardColor : kActiveCardColor;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('BMI CALCULATOR'),
      ),
      body: Column(
        children: [
          Expanded(
              flex: 1,
              child: Row(
                children: [
                  ReusableCard(
                      color: maleCardColor,
                      onPress: () {
                        changeGender(Gender.male);
                      },
                      cardChild: GenderSelector()),
                  ReusableCard(
                      color: femaleCardColor,
                      onPress: () {
                        changeGender(Gender.female);
                      },
                      cardChild: GenderSelector(
                        genderIcon: FontAwesomeIcons.venus,
                        genderTitle: "Female",
                      ))
                ],
              )),
          ReusableCard(
            color: kActiveCardColor,
            cardChild: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text("HEIGHT", style: kLabelTextStyle),
                Row(
                  textBaseline: TextBaseline.alphabetic,
                  crossAxisAlignment: CrossAxisAlignment.baseline,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(height.toString(), style: kNumberTextStyle),
                    Text("cm", style: kLabelTextStyle)
                  ],
                ),
                Slider(
                  activeColor: kBottomContainerColor,
                    inactiveColor: Color(0xFF8D8E98),
                    value: height.toDouble(),
                    min: 120,
                    max: 220,
                    onChanged: (double newValue) {
                    setState(() {
                      height = newValue.round();
                    });
                    }
                )
              ],
            ),
          ),
          Expanded(
              flex: 1,
              child: Row(
                children: [ReusableCard(), ReusableCard()],
              )),
          Container(
            color: kBottomContainerColor,
            margin: EdgeInsets.only(top: 10),
            width: double.infinity,
            height: kBottomContainerHeight,
          )
        ],
      ),
    );
  }
}
