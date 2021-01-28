import 'package:flutter/material.dart';
//importing the Math to be able to use Random class
import 'dart:math';
//importing the package to be able to use our phone shake
import 'package:shake/shake.dart';

//Original text will be displayed
String answer = 'ASK YOUR QUESTION';

//List of possible numbers to be shuffled
List answers = [
  'IT IS CERTAIN',
  'WITHOUT A DOUBT',
  'AS I SEE IT YES',
  'REPLY HAZY, TRY AGAIN',
  'DO NOT COUNT ON IT',
  'MY SOURCES SAY NO',
  'OUTLOOK NOT SO GOOD'
];

void main() => runApp(
      MaterialApp(
        //removing debug label
        debugShowCheckedModeBanner: false,
        home: BallPage(),
      ),
    );

class BallPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Ball(),
    );
  }
}

class Ball extends StatefulWidget {
  @override
  _BallState createState() => _BallState();
}

class _BallState extends State {
  @override
  //initialising our state
  void initState() {
    super.initState();

    //specific ShakeDetector class from the package imported
    ShakeDetector detector = ShakeDetector.autoStart(
      onPhoneShake: () {
        setState(() {
          // randomising the list elements to be displayed
          answer = answers[Random().nextInt(7)];
        });
      },
    );
    detector.startListening();
  }

  Widget build(BuildContext context) {
    return Center(
      child: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: BoxDecoration(
          image: DecorationImage(
            image: NetworkImage(
                'https://image.freepik.com/free-photo/blue-mist-smog-black-background_23-2148092704.jpg'),
            fit: BoxFit.cover,
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              width: 400,
              height: 400,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: NetworkImage(
                      'https://upload.wikimedia.org/wikipedia/commons/e/eb/Magic_eight_ball.png'),
                  fit: BoxFit.cover,
                ),
                shape: BoxShape.circle,
              ),
              child: Center(
                child: Center(
                  child: Container(
                    width: 85,
                    child: Text(
                      answer,
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
