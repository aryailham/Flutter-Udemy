import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'reusable_components/reusable_card.dart';
import 'reusable_components/gender_selector.dart';

const bottomContainerHeight = 80.0;
const bottomContainerColor = Color(0xFFEB1555);
const activeCardColor = Color(0xFF1D1E33);
const inactiveCardColor = Color(0xFF111328);

enum Gender {
  male,
  female
}

class InputPage extends StatefulWidget {
  @override
  _InputPageState createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {
  Gender selectedGender;

  Color maleCardColor = inactiveCardColor;
  Color femaleCardColor = inactiveCardColor;

  void changeGender(Gender gender) {
    selectedGender = gender;

    setState(() {
      maleCardColor = gender == Gender.male ? inactiveCardColor : activeCardColor;
      femaleCardColor = gender == Gender.female ? inactiveCardColor : activeCardColor;
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
                      cardChild: GestureDetector(
                          onTap: () {
                            print("male is tapped");
                            changeGender(Gender.male);
                          },
                          child: GenderSelector()
                      )
                  ),
                  ReusableCard(
                    color: femaleCardColor,
                    cardChild: GestureDetector(
                      onTap: () {
                        print("Female is tapped");
                        changeGender(Gender.female);
                      },
                      child: GenderSelector(
                        genderIcon: FontAwesomeIcons.venus, 
                        genderTitle: "Female",
                      ),
                    )
                  )
                ],
              )),
          ReusableCard(),
          Expanded(
              flex: 1,
              child: Row(
                children: [ReusableCard(), ReusableCard()],
              )),
          Container(
            color: bottomContainerColor,
            margin: EdgeInsets.only(top: 10),
            width: double.infinity,
            height: bottomContainerHeight,
          )
        ],
      ),
    );
  }
}
