import'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';


const bottomContainerHeight = 80.0;
const activeCardColour = Color(0xFF1D1E33);
const inactiveCardColour = Color(0xFF111328);
const bottomCardColour = Color(0xFFEB1555);
class InputPage extends StatefulWidget {
  @override
  _InputPageState createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {
  Color maleCardColour = inactiveCardColour;
  Color femaleCardColour = inactiveCardColour;
  //1= male, 2=female
  void updateColour(int gender) {
    //male card is pressed
    if(gender ==1) {
     if (maleCardColour == inactiveCardColour){
       maleCardColour = activeCardColour;
       femaleCardColour = inactiveCardColour;
     }else{
       maleCardColour = inactiveCardColour;
     }
    } if(gender == 2){
      if (femaleCardColour == inactiveCardColour){
        femaleCardColour = activeCardColour;
        maleCardColour = inactiveCardColour;
      } else {
        femaleCardColour = inactiveCardColour;
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('BMI CALCULATOR'),
      ),
      body: Column(
        children: <Widget>[
          Expanded(child: Row (
            children: <Widget>[
              Expanded(child: GestureDetector(
                onTap:(){
                  setState(() {
                    updateColour(1);
                  });
    },
                child: ReusableCard(
                  colour: maleCardColour,
                  cardChild: IconContent(
                    icon: FontAwesomeIcons.mars,
                    label: 'MALE',
                  ),
                ),
              ),
              ),
              Expanded(child: GestureDetector(
                onTap: (){
                  setState(() {
                    updateColour(2);
                  });
                },
                child: ReusableCard(colour: femaleCardColour,
                  cardChild: IconContent(
                    icon: FontAwesomeIcons.venus,
                    label:'FEMALE',
                  ),
                ),
              ),
              ),
            ],
          ),
          ),
          Expanded(child: ReusableCard(colour: activeCardColour
          ),
          ),
          Expanded(child: Row(
        children: <Widget>[
          Expanded(child: ReusableCard(colour: activeCardColour
          ),
          ),
          Expanded( child: ReusableCard(colour: activeCardColour
          ),
          ),
    ],
    ),
          ),
          Container(
            color: bottomCardColour,
            margin: EdgeInsets.only(top: 10.0),
            width: double.infinity,
            height: bottomContainerHeight,
          ),
        ],
      ),
      );

  }
}

const labelTextStyle = TextStyle(
  fontSize: 18.0,
  color: Color( 0xFF8D8E98),
);
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
          style: labelTextStyle,
        ),
      ],
    );
  }
}


class ReusableCard extends StatelessWidget {
  ReusableCard({@required this.colour, this.cardChild });
  final Color colour;
  final Widget cardChild;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: cardChild,
      margin: EdgeInsets.all(15.0),
      decoration: BoxDecoration(
        color: colour,
        borderRadius: BorderRadius.circular(10.0),
      ),
    );
  }
}

