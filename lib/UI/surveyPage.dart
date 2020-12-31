import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:keva_health/Widgets/survey_objects%20copy.dart';
import 'package:keva_health/Widgets/survey_objects.dart';
import 'package:research_package/research_package.dart';
import 'dart:convert';
import 'package:video_player/video_player.dart';

class SurveyPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Size screen = MediaQuery.of(context).size;
    return Scaffold(
      body: SafeArea(
        child: Column(children: [
          Container(
            alignment: Alignment.topLeft,
            margin: EdgeInsets.all(12),
            child: Text.rich(
              TextSpan(
                  text: 'keva health',
                  style: TextStyle(
                    fontFamily: 'Poppins-Medium',
                    fontSize: 25,
                    color: Colors.lightBlueAccent,
                  )),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(top: screen.height * 0.075),
            child: Container(height: screen.height * 0.7, child: UserSurvey()),
          ),
          Padding(
            padding:
                const EdgeInsets.symmetric(horizontal: 8.0, vertical: 20.0),
            child: Container(
              alignment: Alignment.bottomRight,
              child: RaisedButton(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20)),
                onPressed: () => [
                  Navigator.push(context, MaterialPageRoute(builder: (_) {
                    return SurveyIntro();
                  })),
                ],
                color: Colors.lightBlueAccent,
                child: Text("Next!",
                    style: TextStyle(
                        fontFamily: 'Poppins-Medium',
                        color: Colors.white,
                        fontSize: 16)),
              ),
            ),
          )
        ]),
      ),
    );
  }
}

class UserSurvey extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(children: [
        Padding(
          padding: const EdgeInsets.all(12.0),
          child: Image.asset(
            'assets/graphic.jpg',
            scale: 0.9,
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(12.0),
          child: Text(
            "Please fill out this questionnaire if you're interested in learning more about Keva Platform!",
            style: TextStyle(fontSize: 20),
          ),
        )
      ]),
    );
  }
}

class SurveyIntro extends StatelessWidget {
  const SurveyIntro({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size screen = MediaQuery.of(context).size;
    return Scaffold(
      body: ListView(
        children: [
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
                          fontSize: 25,
                          color: Colors.lightBlueAccent,
                        )),
                  ),
                ),
                Container(
                    height: screen.height * 0.39, child: LinearSurveyPage()),
                Padding(
                  padding: const EdgeInsets.only(
                      left: 15.0, bottom: 12.0, top: 10.0),
                  child: Text(
                    "If yes, what's the name of your current solution?",
                    style: TextStyle(fontSize: 24, fontWeight: FontWeight.w500),
                    textAlign: TextAlign.left,
                  ),
                ),
                SizedBox(height: 10),
                Container(
                    child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 15.0),
                  child: Card(
                      elevation: 5.0,
                      child: TextFormField(
                        validator: (String l) =>
                            null, //Links, while recommended, aren't needed if description covers it
                        style: TextStyle(color: Colors.black),
                        cursorColor: Colors.black,
                        decoration: InputDecoration(
                            border: InputBorder.none,
                            contentPadding: EdgeInsets.symmetric(
                                horizontal: 12.0, vertical: 12.0),
                            hintText: "Please enter your current solution",
                            hintStyle: TextStyle(
                                color: Color(0xFF787878), fontSize: 13)),
                      )),
                )),
                SizedBox(height: 20),
                Padding(
                  padding: const EdgeInsets.only(left: 15.0, bottom: 12.0),
                  child: Text(
                    "How many asthma patients do you currently have?",
                    style: TextStyle(fontSize: 24, fontWeight: FontWeight.w500),
                    textAlign: TextAlign.left,
                  ),
                ),
                SizedBox(height: 10),
                Container(
                    child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 15.0),
                  child: Card(
                      elevation: 5.0,
                      child: TextFormField(
                        validator: (String l) =>
                            null, //Links, while recommended, aren't needed if description covers it
                        style: TextStyle(color: Colors.black),
                        cursorColor: Colors.black,
                        decoration: InputDecoration(
                            border: InputBorder.none,
                            contentPadding: EdgeInsets.symmetric(
                                horizontal: 12.0, vertical: 12.0),
                            hintText: "Please enter your current solution",
                            hintStyle: TextStyle(
                                color: Color(0xFF787878), fontSize: 13)),
                      )),
                )),
              ]),
          Padding(
            padding:
                const EdgeInsets.symmetric(horizontal: 8.0, vertical: 10.0),
            child: Container(
              alignment: Alignment.bottomRight,
              child: RaisedButton(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20)),
                onPressed: () => [
                  Navigator.push(context, MaterialPageRoute(builder: (_) {
                    return SurveyExtended();
                  })),
                ],
                color: Colors.lightBlueAccent,
                child: Text("Next!",
                    style: TextStyle(
                        fontFamily: 'Poppins-Medium',
                        color: Colors.white,
                        fontSize: 16)),
              ),
            ),
          )
        ],
      ),
    );
  }
}

class LinearSurveyPage extends StatelessWidget {
  String _encode(Object object) =>
      const JsonEncoder.withIndent(' ').convert(object);

  void resultCallback(RPTaskResult result) {
    // Do anything with the result
    print(_encode(result));
  }

  void cancelCallBack(RPTaskResult result) {
    // Do anything with the result at the moment of the cancellation
    print("The result so far:\n" + _encode(result));
  }

  @override
  Widget build(BuildContext context) {
    return RPUITask(
      task: surveyTask,
      onSubmit: (result) {
        resultCallback(result);
      },
    );
  }
}

class LinearSurveyPage2 extends StatelessWidget {
  String _encode(Object object) =>
      const JsonEncoder.withIndent(' ').convert(object);

  void resultCallback(RPTaskResult result) {
    // Do anything with the result
    print(_encode(result));
  }

  void cancelCallBack(RPTaskResult result) {
    // Do anything with the result at the moment of the cancellation
    print("The result so far:\n" + _encode(result));
  }

  @override
  Widget build(BuildContext context) {
    return RPUITask(
      task: surveyTask2,
      onSubmit: (result) {
        resultCallback(result);
      },
    );
  }
}

class SurveyExtended extends StatelessWidget {
  const SurveyExtended({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size screen = MediaQuery.of(context).size;
    return Scaffold(
      body: ListView(
        children: [
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
                          fontSize: 25,
                          color: Colors.lightBlueAccent,
                        )),
                  ),
                ),
                Container(
                    height: screen.height * 0.39, child: LinearSurveyPage2()),
                Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: Text(
                    "Your Name",
                    style: TextStyle(fontSize: 24, fontWeight: FontWeight.w500),
                    textAlign: TextAlign.left,
                  ),
                ),
                Container(
                    child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 15.0),
                  child: Card(
                      elevation: 5.0,
                      child: TextFormField(
                        validator: (String l) =>
                            null, //Links, while recommended, aren't needed if description covers it
                        style: TextStyle(color: Colors.black),
                        cursorColor: Colors.black,
                        decoration: InputDecoration(
                            border: InputBorder.none,
                            contentPadding: EdgeInsets.symmetric(
                                horizontal: 12.0, vertical: 12.0),
                            hintText: "Please enter your name",
                            hintStyle: TextStyle(
                                color: Color(0xFF787878), fontSize: 13)),
                      )),
                )),
                SizedBox(height: 25),
                Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: Text(
                    "Your Email",
                    style: TextStyle(fontSize: 24, fontWeight: FontWeight.w500),
                    textAlign: TextAlign.left,
                  ),
                ),
                Container(
                    child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 15.0),
                  child: Card(
                      elevation: 5.0,
                      child: TextFormField(
                        validator: (String l) =>
                            null, //Links, while recommended, aren't needed if description covers it
                        style: TextStyle(color: Colors.black),
                        cursorColor: Colors.black,
                        decoration: InputDecoration(
                            border: InputBorder.none,
                            contentPadding: EdgeInsets.symmetric(
                                horizontal: 12.0, vertical: 12.0),
                            hintText: "Please enter your email",
                            hintStyle: TextStyle(
                                color: Color(0xFF787878), fontSize: 13)),
                      )),
                )),
                SizedBox(height: 25),
                Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: Text(
                    "Your Phone Number",
                    style: TextStyle(fontSize: 24, fontWeight: FontWeight.w500),
                    textAlign: TextAlign.left,
                  ),
                ),
                Container(
                    child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 15.0),
                  child: Card(
                      elevation: 5.0,
                      child: TextFormField(
                        validator: (String l) =>
                            null, //Links, while recommended, aren't needed if description covers it
                        style: TextStyle(color: Colors.black),
                        cursorColor: Colors.black,
                        decoration: InputDecoration(
                            border: InputBorder.none,
                            contentPadding: EdgeInsets.symmetric(
                                horizontal: 12.0, vertical: 12.0),
                            hintText: "Please enter your phone number",
                            hintStyle: TextStyle(
                                color: Color(0xFF787878), fontSize: 13)),
                      )),
                )),
                SizedBox(height: 25),
              ]),
          Padding(
            padding:
                const EdgeInsets.symmetric(horizontal: 8.0, vertical: 10.0),
            child: Container(
              alignment: Alignment.bottomRight,
              child: RaisedButton(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20)),
                onPressed: () => [
                  Navigator.push(context, MaterialPageRoute(builder: (_) {
                    return Scaffold(
                      body: SafeArea(
                        child: Column(children: [
                          Container(
                            alignment: Alignment.topLeft,
                            margin: EdgeInsets.all(12),
                            child: Text.rich(
                              TextSpan(
                                  text: 'keva health',
                                  style: TextStyle(
                                    fontFamily: 'Poppins-Medium',
                                    fontSize: 25,
                                    color: Colors.lightBlueAccent,
                                  )),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(12.0),
                            child: Text(
                              "Thank you for completing our survey! We will be in touch with more details soon.",
                              style: TextStyle(fontSize: 20),
                            ),
                          )
                        ]),
                      ),
                    );
                    ;
                  })),
                ],
                color: Colors.lightBlueAccent,
                child: Text("Next!",
                    style: TextStyle(
                        fontFamily: 'Poppins-Medium',
                        color: Colors.white,
                        fontSize: 16)),
              ),
            ),
          )
        ],
      ),
    );
  }
}
