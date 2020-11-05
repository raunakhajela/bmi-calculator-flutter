import 'package:flutter/material.dart';
import 'icon_content.dart';
import 'reusable_card.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

const bottomContainerHeight = 80.0;
const activeCardColour = Color(0xFF1D1E33);
const inactiveCardColour = Color(0xFF111328);
const bottomContainerColour = Color(0xFFEB1555);

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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('BMI CALCULATOR'),
      ),
      body: Column(
        children: [
          Expanded(
              child: Row(
            children: [
              Expanded(
                  child: GestureDetector(
                    onTap: (){
                      setState(() {
                        selectedGender = Gender.male;
                      });
                    },
                    child: ReusableCard(
                colour: selectedGender == Gender.male ? activeCardColour : inactiveCardColour,
                cardChild:
                      IconContent(icon: FontAwesomeIcons.mars, label: 'MALE'),
              ),
                  )),
              Expanded(
                  child: GestureDetector(
                    onTap: (){
                      setState(() {
                        selectedGender = Gender.female;
                      });
                    },
                    child: ReusableCard(
                        colour: selectedGender == Gender.female ? activeCardColour : inactiveCardColour,
                        cardChild: IconContent(
                            icon: FontAwesomeIcons.venus, label: 'FEMALE')),
                  ))
            ],
          )),
          Expanded(child: ReusableCard(colour: inactiveCardColour)),
          Expanded(
              child: Row(
            children: [
              Expanded(child: ReusableCard(colour: inactiveCardColour)),
              Expanded(child: ReusableCard(colour: inactiveCardColour))
            ],
          )),
          Container(
            margin: EdgeInsets.only(top: 10.0),
            color: bottomContainerColour,
            width: double.infinity,
            height: bottomContainerHeight,
          )
        ],
      ),
    );
  }
}
