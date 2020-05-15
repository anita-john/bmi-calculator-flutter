import'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'constants.dart';



enum Gender {
  male,
  female,
}
class InputPage extends StatefulWidget {
  @override
  _InputPageState createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {
  Gender selectedGender;
  int height =180;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('BMI CALCULATOR'),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch ,
        children: <Widget>[
          Expanded(child: Row (
            children: <Widget>[
              Expanded(child: ReusableCard(
                onPress: (){
                  setState(() {
                    selectedGender = Gender.male;
                  });
                },
                colour:selectedGender == Gender.male ? kActiveCardColour: kInactiveCardColour,
                cardChild: IconContent(
                  icon: FontAwesomeIcons.mars,
                  label: 'MALE',
                ),
              ),
              ),
              Expanded(child: ReusableCard(
                onPress: (){
                  setState(() {
                    selectedGender = Gender.female;
                  });
                },
                colour: selectedGender == Gender.female ? kActiveCardColour: kInactiveCardColour,
                cardChild: IconContent(
                  icon: FontAwesomeIcons.venus,
                  label:'FEMALE',
                ),
              ),
              ),
            ],
          ),
          ),
          Expanded(child: ReusableCard(colour: kActiveCardColour,
            cardChild: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[Text('HEIGHT', style: kLabelTextStyle ,
              ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.baseline,
                  textBaseline: TextBaseline.alphabetic,
                  children: <Widget>[
                    Text(
                      height.toString(),
                      style: kNumberTextStyle,
                    ),
                    Text(
                      'cm',
                      style: kLabelTextStyle,
                    ),
                  ],
                ),
                Slider(
                  value: height.toDouble(),
                  min: 120.0,
                  max: 220.0,
                  activeColor: Color(0xFFEB1555),
                  inactiveColor: Color(0xFF8D8E98),
                  onChanged: (double newValue){
                    setState(() {
                      height = newValue.round();
                    });
                  } ,
                ),
              ],
            ),
          ),
          ),
          Expanded(child: Row(
        children: <Widget>[
          Expanded(child: ReusableCard(colour: kActiveCardColour
          ),
          ),
          Expanded( child: ReusableCard(colour: kActiveCardColour
          ),
          ),
    ],
    ),
          ),
          Container(
            color: kBottomCardColour,
            margin: EdgeInsets.only(top: 10.0),
            width: double.infinity,
            height: kBottomContainerHeight,
          ),
        ],
      ),
      );

  }
}


class IconContent extends StatelessWidget {
  IconContent({this.icon, this.label});
  final IconData icon;
  final String label;


  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Icon(
          icon,
          size: 80.0,
        ),
        SizedBox(
          height: 15.0,
        ),
        Text(label,
          style: kLabelTextStyle,
        ),
      ],
    );
  }
}


class ReusableCard extends StatelessWidget {
  ReusableCard({@required this.colour, this.cardChild, this.onPress });
  final Color colour;
  final Widget cardChild;
  final Function onPress;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPress,
      child: Container(
        child: cardChild,
        margin: EdgeInsets.all(15.0),
        decoration: BoxDecoration(
          color: colour,
          borderRadius: BorderRadius.circular(10.0),
        ),
      ),
    );
  }
}

