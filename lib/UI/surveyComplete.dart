import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:keva_health/UI/demoPage.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class SurveyComplete extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Size screen = MediaQuery.of(context).size;
    return Scaffold(
        body: ListView(children: [
      Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            alignment: Alignment.topLeft,
            margin: EdgeInsets.all(12),
            child: Text.rich(
              TextSpan(
                  text: 'keva health',
                  style: TextStyle(
                    fontFamily: 'Poppins-Medium',
                    fontSize: screen.height * 0.0375,
                    color: Color(0xFF426CB4),
                  )),
            ),
          ),
          SingleChildScrollView(
            child: Padding(
              padding: EdgeInsets.only(top: screen.height * 0.1),
              child: Column(children: [
                Container(
                  height: screen.height * 0.5,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                        image: AssetImage('assets/graphic.jpg'),
                        fit: BoxFit.contain),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(
                      left: screen.width * 0.075,
                      top: screen.height * 0.075,
                      bottom: screen.height * 0.02),
                  child: Text(
                    "Thank you for completing our survey! We appreciate the feedback.",
                    style: TextStyle(fontSize: screen.height * 0.02),
                  ),
                ),
                Container(
                  alignment: Alignment.center,
                  child: RaisedButton(
                    padding: EdgeInsets.symmetric(
                        horizontal: screen.width * 0.05,
                        vertical: screen.height * 0.01),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30)),
                    onPressed: _launchURL,
                    color: Color(0xFF426CB4),
                    child: Text("Learn more!",
                        style: TextStyle(
                            fontFamily: 'Poppins-Medium',
                            color: Colors.white,
                            fontSize: screen.width * 0.0375)),
                  ),
                ),
                SizedBox(
                  height: 5.0,
                ),
                GestureDetector(
                  onTap: () => [
                    Navigator.push(context, MaterialPageRoute(builder: (_) {
                      return DemoPage();
                    })),
                  ],
                  child: Text(
                    "Submit another response",
                    style: TextStyle(
                        fontSize: screen.height * 0.0125,
                        color: Colors.grey[600]),
                  ),
                ),
              ]),
            ),
          )
        ],
      )
    ]));
  }
}

_launchURL() async {
  const url = 'https://www.kevahealth.com/';
  if (await canLaunch(url)) {
    await launch(url);
  } else {
    throw 'Could not launch $url';
  }
}
