import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../constants.dart';
import '../components/reusable_card.dart';
import 'package:bmi_calculator/components/bottom_button.dart';
    class ResultsPage extends StatelessWidget {
      @override
      Widget build(BuildContext context) {
        return Scaffold(
          appBar: AppBar(
            title: Text(' BMI CALCULATOR'),
          ) ,
          body: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              Expanded(
                child: Container(
                  padding: EdgeInsets.all(15.0),
                  alignment: Alignment.bottomLeft,
                  child: Text('YOUR RESULTS',
                  style: kTitleTextStyle,),
                ),
              ),
              Expanded(
                flex: 5,
                child: ReusableCard(
                    colour: kActiveCardColour,
                  cardChild: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    crossAxisAlignment: CrossAxisAlignment.center,
                      children: <Widget>[
                        Text(
                          'NORMAL',
                          style: kResultTextStyle,
                        ),
                        Text(
                          '18.5',
                          style: kBMITextStyle,
                        ),
                        Text(
                          'Your BMI results are normal! Keep doing what your doing!',
                            textAlign: TextAlign.center,
                            style: kBodyTextStyle,
                        ),
                      ],
                  ),
                ),
              ),
              BottomButton(buttonTitle: 'RECALCULATE',
              onTap: (){
                Navigator.pop(context);
              },

              ),
            ],
          )
        );
      }
    }
    