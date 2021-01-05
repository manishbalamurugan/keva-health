import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:keva_health/UI/demoPage.dart';
import 'package:keva_health/UI/surveyComplete.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class SurveyPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Size screen = MediaQuery.of(context).size;
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(children: [
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
            Padding(
              padding: EdgeInsets.only(top: screen.height * 0.075),
              child:
                  Container(height: screen.height * 0.7, child: UserSurvey()),
            ),
            Padding(
              padding: EdgeInsets.symmetric(
                  horizontal: screen.width * 0.025, vertical: 0.0),
              child: Container(
                alignment: Alignment.bottomRight,
                child: RaisedButton(
                  padding: EdgeInsets.symmetric(
                      horizontal: screen.width * 0.05,
                      vertical: screen.height * 0.01),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30)),
                  onPressed: () => [
                    Navigator.push(context, MaterialPageRoute(builder: (_) {
                      return Survey();
                    })),
                  ],
                  color: Color(0xFF426CB4),
                  child: Text("Next!",
                      style: TextStyle(
                          fontFamily: 'Poppins-Medium',
                          color: Colors.white,
                          fontSize: screen.height * 0.02)),
                ),
              ),
            )
          ]),
        ),
      ),
    );
  }
}

class UserSurvey extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Size screen = MediaQuery.of(context).size;
    return SingleChildScrollView(
      child: Column(children: [
        Padding(
          padding: const EdgeInsets.all(12.0),
          child: Image.asset(
            'assets/graphic.jpg',
            scale: 5,
          ),
        ),
        Padding(
          padding: EdgeInsets.all(screen.width * 0.05),
          child: Text(
            "Please fill out this questionnaire if you're interested in learning more about Keva Platform!",
            style: TextStyle(fontSize: screen.height * 0.0225),
          ),
        )
      ]),
    );
  }
}

class Survey extends StatefulWidget {
  Survey({Key key}) : super(key: key);

  @override
  _SurveyState createState() => _SurveyState();
}

class _SurveyState extends State<Survey> {
  @override
  Widget build(BuildContext context) {
    Size screen = MediaQuery.of(context).size;
    return Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
          backgroundColor: Colors.white,
          elevation: 0,
          title: Text.rich(
            TextSpan(
                text: 'keva health',
                style: TextStyle(
                  fontFamily: 'Poppins-Medium',
                  fontSize: screen.height * 0.0375,
                  color: Color(0xFF426CB4),
                )),
          ),
        ),
        body: SafeArea(
          child: ListView(children: <Widget>[Center(child: UserDetails())]),
        ));
  }
}

class UserDetails extends StatefulWidget {
  UserDetails({Key key}) : super(key: key);

  @override
  _UserDetailsState createState() => _UserDetailsState();
}

class _UserDetailsState extends State<UserDetails> {
  @override
  Widget build(BuildContext context) {
    Size screen = MediaQuery.of(context).size;
    return Column(
      children: [
        Container(
          height: screen.height * 0.5,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Your name",
                            style: TextStyle(
                                fontSize: screen.height * 0.025,
                                fontWeight: FontWeight.w500),
                            textAlign: TextAlign.left,
                          ),
                          Container(
                            width: screen.width * 0.9,
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
                                          horizontal: screen.width * 0.05,
                                          vertical: screen.height * 0.0125),
                                      hintText: "Please enter your name",
                                      hintStyle: TextStyle(
                                          color: Color(0xFF787878),
                                          fontSize: screen.height * 0.015)),
                                )),
                          ),
                        ]),
                    SizedBox(height: screen.height * 0.05),
                    Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Your email",
                            style: TextStyle(
                                fontSize: screen.height * 0.025,
                                fontWeight: FontWeight.w500),
                            textAlign: TextAlign.left,
                          ),
                          Container(
                            width: screen.width * 0.9,
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
                                          horizontal: screen.width * 0.05,
                                          vertical: screen.height * 0.0125),
                                      hintText: "Please enter your email",
                                      hintStyle: TextStyle(
                                          color: Color(0xFF787878),
                                          fontSize: screen.height * 0.015)),
                                )),
                          ),
                        ]),
                    SizedBox(height: screen.height * 0.05),
                    Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Your phone number",
                            style: TextStyle(
                                fontSize: screen.height * 0.025,
                                fontWeight: FontWeight.w500),
                            textAlign: TextAlign.left,
                          ),
                          Container(
                            width: screen.width * 0.9,
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
                                          horizontal: screen.width * 0.05,
                                          vertical: screen.height * 0.0125),
                                      hintText:
                                          "Please enter your phone number",
                                      hintStyle: TextStyle(
                                          color: Color(0xFF787878),
                                          fontSize: screen.height * 0.015)),
                                )),
                          ),
                        ]),
                  ]),
            ],
          ),
        ),
        Padding(
          padding: EdgeInsets.symmetric(
              vertical: screen.height * 0.25, horizontal: screen.width * 0.05),
          child: Container(
            alignment: Alignment.bottomRight,
            child: RaisedButton(
              padding: EdgeInsets.symmetric(
                  horizontal: screen.height * 0.04,
                  vertical: screen.height * 0.0125),
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30)),
              onPressed: () => [
                Navigator.push(context, MaterialPageRoute(builder: (_) {
                  return InitialQuestion();
                })),
              ],
              color: Color(0xFF426CB4),
              child: Text("Next!",
                  style: TextStyle(
                      fontFamily: 'Poppins-Medium',
                      color: Colors.white,
                      fontSize: screen.height * 0.025)),
            ),
          ),
        ),
      ],
    );
  }
}

enum boolChoices { yes, no }

class InitialQuestion extends StatefulWidget {
  InitialQuestion({Key key}) : super(key: key);

  @override
  _InitialQuestionState createState() => _InitialQuestionState();
}

class _InitialQuestionState extends State<InitialQuestion> {
  boolChoices initial;
  @override
  Widget build(BuildContext context) {
    Size screen = MediaQuery.of(context).size;
    return Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
          backgroundColor: Colors.white,
          elevation: 0,
          title: Text.rich(
            TextSpan(
                text: 'keva health',
                style: TextStyle(
                  fontFamily: 'Poppins-Medium',
                  fontSize: screen.height * 0.0375,
                  color: Color(0xFF426CB4),
                )),
          ),
        ),
        body: SafeArea(
          child: ListView(children: <Widget>[
            Padding(
              padding: EdgeInsets.only(top: screen.height * 0.125),
              child: Card(
                margin: EdgeInsets.all(12),
                elevation: 5.0,
                child: Column(children: [
                  Padding(
                    padding:
                        EdgeInsets.symmetric(horizontal: screen.width * 0.05),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(vertical: 12.0),
                      child: Text(
                        "Are you interested in learning about a 1 month, no commitment trial of the Keva Platform?",
                        style: TextStyle(
                            fontSize: screen.height * 0.025,
                            fontWeight: FontWeight.w500),
                        textAlign: TextAlign.left,
                      ),
                    ),
                  ),
                  RadioListTile(
                    title: Text(
                      'Yes',
                      style: TextStyle(
                        fontSize: screen.height * 0.025,
                        color: Colors.black,
                      ),
                    ),
                    value: boolChoices.yes,
                    groupValue: initial,
                    onChanged: (boolChoices value) {
                      setState(() {
                        initial = value;
                      });
                    },
                  ),
                  RadioListTile(
                    title: Text(
                      'No',
                      style: TextStyle(
                        fontSize: screen.height * 0.025,
                        color: Colors.black,
                      ),
                    ),
                    value: boolChoices.no,
                    groupValue: initial,
                    onChanged: (boolChoices value) {
                      setState(() {
                        initial = value;
                      });
                    },
                  )
                ]),
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(
                  vertical: screen.height * 0.325,
                  horizontal: screen.width * 0.05),
              child: Container(
                alignment: Alignment.bottomRight,
                child: RaisedButton(
                  padding: EdgeInsets.symmetric(
                      horizontal: screen.height * 0.04,
                      vertical: screen.height * 0.0125),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30)),
                  onPressed: () => [
                    initial == boolChoices.yes
                        ? Navigator.push(context,
                            MaterialPageRoute(builder: (_) {
                            return SurveyComplete();
                          }))
                        : Navigator.push(context,
                            MaterialPageRoute(builder: (_) {
                            return SecondaryQuestion();
                          }))
                  ],
                  color: Color(0xFF426CB4),
                  child: Text("Next!",
                      style: TextStyle(
                          fontFamily: 'Poppins-Medium',
                          color: Colors.white,
                          fontSize: screen.height * 0.025)),
                ),
              ),
            ),
          ]),
        ));
  }
}

class SecondaryQuestion extends StatefulWidget {
  SecondaryQuestion({Key key}) : super(key: key);

  @override
  _SecondaryQuestionState createState() => _SecondaryQuestionState();
}

class _SecondaryQuestionState extends State<SecondaryQuestion> {
  boolChoices initial;
  @override
  Widget build(BuildContext context) {
    Size screen = MediaQuery.of(context).size;
    return Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
          backgroundColor: Colors.white,
          elevation: 0,
          title: Text.rich(
            TextSpan(
                text: 'keva health',
                style: TextStyle(
                  fontFamily: 'Poppins-Medium',
                  fontSize: screen.height * 0.0375,
                  color: Color(0xFF426CB4),
                )),
          ),
        ),
        body: SafeArea(
          child: ListView(children: <Widget>[
            Padding(
              padding: EdgeInsets.only(top: screen.height * 0.125),
              child: Card(
                margin: EdgeInsets.all(12),
                elevation: 5.0,
                child: Column(children: [
                  Padding(
                    padding:
                        EdgeInsets.symmetric(horizontal: screen.width * 0.05),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(vertical: 12.0),
                      child: Text(
                        "Are you interested in seeing a quick demo of the Keva Platform? It shouldn't take more than 15 minutes",
                        style: TextStyle(
                            fontSize: screen.height * 0.025,
                            fontWeight: FontWeight.w500),
                        textAlign: TextAlign.left,
                      ),
                    ),
                  ),
                  RadioListTile(
                    title: Text(
                      'Yes',
                      style: TextStyle(
                        fontSize: screen.height * 0.025,
                        color: Colors.black,
                      ),
                    ),
                    value: boolChoices.yes,
                    groupValue: initial,
                    onChanged: (boolChoices value) {
                      setState(() {
                        initial = value;
                      });
                    },
                  ),
                  RadioListTile(
                    title: Text(
                      'No',
                      style: TextStyle(
                        fontSize: screen.height * 0.025,
                        color: Colors.black,
                      ),
                    ),
                    value: boolChoices.no,
                    groupValue: initial,
                    onChanged: (boolChoices value) {
                      setState(() {
                        initial = value;
                      });
                    },
                  )
                ]),
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(
                  vertical: screen.height * 0.3,
                  horizontal: screen.width * 0.05),
              child: Container(
                alignment: Alignment.bottomRight,
                child: RaisedButton(
                  padding: EdgeInsets.symmetric(
                      horizontal: screen.height * 0.04,
                      vertical: screen.height * 0.0125),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30)),
                  onPressed: () => [
                    initial == boolChoices.yes
                        ? Navigator.push(context,
                            MaterialPageRoute(builder: (_) {
                            return SurveyComplete();
                          }))
                        : Navigator.push(context,
                            MaterialPageRoute(builder: (_) {
                            return RPMQuestion();
                          }))
                  ],
                  color: Color(0xFF426CB4),
                  child: Text("Next!",
                      style: TextStyle(
                          fontFamily: 'Poppins-Medium',
                          color: Colors.white,
                          fontSize: screen.height * 0.025)),
                ),
              ),
            ),
          ]),
        ));
  }
}

class RPMQuestion extends StatefulWidget {
  RPMQuestion({Key key}) : super(key: key);

  @override
  _RPMQuestionState createState() => _RPMQuestionState();
}

class _RPMQuestionState extends State<RPMQuestion> {
  boolChoices initial;
  @override
  Widget build(BuildContext context) {
    Size screen = MediaQuery.of(context).size;
    return Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
          backgroundColor: Colors.white,
          elevation: 0,
          title: Text.rich(
            TextSpan(
                text: 'keva health',
                style: TextStyle(
                  fontFamily: 'Poppins-Medium',
                  fontSize: screen.height * 0.0375,
                  color: Color(0xFF426CB4),
                )),
          ),
        ),
        body: SafeArea(
          child: ListView(children: <Widget>[
            Padding(
              padding: EdgeInsets.only(top: screen.height * 0.125),
              child: Card(
                margin: EdgeInsets.all(12),
                elevation: 5.0,
                child: Column(children: [
                  Padding(
                    padding:
                        EdgeInsets.symmetric(horizontal: screen.width * 0.05),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(vertical: 12.0),
                      child: Text(
                        "Does your practice currently use an RPM?",
                        style: TextStyle(
                            fontSize: screen.height * 0.025,
                            fontWeight: FontWeight.w500),
                        textAlign: TextAlign.left,
                      ),
                    ),
                  ),
                  RadioListTile(
                    title: Text(
                      'Yes',
                      style: TextStyle(
                        fontSize: screen.height * 0.025,
                        color: Colors.black,
                      ),
                    ),
                    value: boolChoices.yes,
                    groupValue: initial,
                    onChanged: (boolChoices value) {
                      setState(() {
                        initial = value;
                      });
                    },
                  ),
                  RadioListTile(
                    title: Text(
                      'No',
                      style: TextStyle(
                        fontSize: screen.height * 0.025,
                        color: Colors.black,
                      ),
                    ),
                    value: boolChoices.no,
                    groupValue: initial,
                    onChanged: (boolChoices value) {
                      setState(() {
                        initial = value;
                      });
                    },
                  )
                ]),
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(
                  vertical: screen.height * 0.375,
                  horizontal: screen.width * 0.05),
              child: Container(
                alignment: Alignment.bottomRight,
                child: RaisedButton(
                  padding: EdgeInsets.symmetric(
                      horizontal: screen.height * 0.04,
                      vertical: screen.height * 0.0125),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30)),
                  onPressed: () => [
                    initial == boolChoices.yes
                        ? Navigator.push(context,
                            MaterialPageRoute(builder: (_) {
                            return RPMConditional();
                          }))
                        : Navigator.push(context,
                            MaterialPageRoute(builder: (_) {
                            return RPMQuestion2();
                          }))
                  ],
                  color: Color(0xFF426CB4),
                  child: Text("Next!",
                      style: TextStyle(
                          fontFamily: 'Poppins-Medium',
                          color: Colors.white,
                          fontSize: screen.height * 0.025)),
                ),
              ),
            ),
          ]),
        ));
  }
}

class RPMConditional extends StatefulWidget {
  RPMConditional({Key key}) : super(key: key);

  @override
  _RPMConditionalState createState() => _RPMConditionalState();
}

class _RPMConditionalState extends State<RPMConditional> {
  @override
  Widget build(BuildContext context) {
    Size screen = MediaQuery.of(context).size;
    return Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
          backgroundColor: Colors.white,
          elevation: 0,
          title: Text.rich(
            TextSpan(
                text: 'keva health',
                style: TextStyle(
                  fontFamily: 'Poppins-Medium',
                  fontSize: screen.height * 0.0375,
                  color: Color(0xFF426CB4),
                )),
          ),
        ),
        body: SafeArea(
          child: ListView(children: <Widget>[
            Padding(
              padding: EdgeInsets.symmetric(
                  vertical: screen.height * 0.125,
                  horizontal: screen.width * 0.1),
              child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "What RPM solution does your practice currently use?",
                      style: TextStyle(
                          fontSize: screen.height * 0.025,
                          fontWeight: FontWeight.w500),
                      textAlign: TextAlign.left,
                    ),
                    SizedBox(
                      height: screen.height * 0.025,
                    ),
                    Container(
                      height: screen.height * 0.125,
                      width: screen.width * 0.9,
                      child: Card(
                          elevation: 5.0,
                          child: TextFormField(
                            maxLines: 5,
                            validator: (String l) =>
                                null, //Links, while recommended, aren't needed if description covers it
                            style: TextStyle(color: Colors.black),
                            cursorColor: Colors.black,
                            decoration: InputDecoration(
                                border: InputBorder.none,
                                contentPadding: EdgeInsets.symmetric(
                                    horizontal: screen.width * 0.05,
                                    vertical: screen.height * 0.0125),
                                hintText: "Please enter your response",
                                hintStyle: TextStyle(
                                    color: Color(0xFF787878),
                                    fontSize: screen.height * 0.0175)),
                          )),
                    ),
                  ]),
            ),
            Padding(
              padding: EdgeInsets.symmetric(
                  vertical: screen.height * 0.3,
                  horizontal: screen.width * 0.05),
              child: Container(
                alignment: Alignment.bottomRight,
                child: RaisedButton(
                  padding: EdgeInsets.symmetric(
                      horizontal: screen.height * 0.04,
                      vertical: screen.height * 0.0125),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30)),
                  onPressed: () => [
                    Navigator.push(context, MaterialPageRoute(builder: (_) {
                      return RPMQuestion2();
                    }))
                  ],
                  color: Color(0xFF426CB4),
                  child: Text("Next!",
                      style: TextStyle(
                          fontFamily: 'Poppins-Medium',
                          color: Colors.white,
                          fontSize: screen.height * 0.025)),
                ),
              ),
            ),
          ]),
        ));
  }
}

class RPMQuestion2 extends StatefulWidget {
  RPMQuestion2({Key key}) : super(key: key);

  @override
  _RPMQuestion2State createState() => _RPMQuestion2State();
}

class _RPMQuestion2State extends State<RPMQuestion2> {
  @override
  Widget build(BuildContext context) {
    Size screen = MediaQuery.of(context).size;
    return Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
          backgroundColor: Colors.white,
          elevation: 0,
          title: Text.rich(
            TextSpan(
                text: 'keva health',
                style: TextStyle(
                  fontFamily: 'Poppins-Medium',
                  fontSize: screen.height * 0.0375,
                  color: Color(0xFF426CB4),
                )),
          ),
        ),
        body: SafeArea(
          child: ListView(children: <Widget>[
            Padding(
              padding: EdgeInsets.symmetric(
                  vertical: screen.height * 0.125,
                  horizontal: screen.width * 0.1),
              child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Do you think an RPM solution will improve outcomes for your asthma patients?",
                      style: TextStyle(
                          fontSize: screen.height * 0.025,
                          fontWeight: FontWeight.w500),
                      textAlign: TextAlign.left,
                    ),
                    SizedBox(
                      height: screen.height * 0.025,
                    ),
                    Container(
                      height: screen.height * 0.25,
                      width: screen.width * 0.9,
                      child: Card(
                          elevation: 5.0,
                          child: TextFormField(
                            maxLines: 20,
                            validator: (String l) =>
                                null, //Links, while recommended, aren't needed if description covers it
                            style: TextStyle(color: Colors.black),
                            cursorColor: Colors.black,
                            decoration: InputDecoration(
                                border: InputBorder.none,
                                contentPadding: EdgeInsets.symmetric(
                                    horizontal: screen.width * 0.05,
                                    vertical: screen.height * 0.0125),
                                hintText: "Please enter your response",
                                hintStyle: TextStyle(
                                    color: Color(0xFF787878),
                                    fontSize: screen.height * 0.0175)),
                          )),
                    ),
                  ]),
            ),
            Padding(
              padding: EdgeInsets.symmetric(
                  vertical: screen.height * 0.13,
                  horizontal: screen.width * 0.05),
              child: Container(
                alignment: Alignment.bottomRight,
                child: RaisedButton(
                  padding: EdgeInsets.symmetric(
                      horizontal: screen.height * 0.04,
                      vertical: screen.height * 0.0125),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30)),
                  onPressed: () => [
                    Navigator.push(context, MaterialPageRoute(builder: (_) {
                      return FinalQuestion();
                    }))
                  ],
                  color: Color(0xFF426CB4),
                  child: Text("Next!",
                      style: TextStyle(
                          fontFamily: 'Poppins-Medium',
                          color: Colors.white,
                          fontSize: screen.height * 0.025)),
                ),
              ),
            ),
          ]),
        ));
  }
}

class FinalQuestion extends StatefulWidget {
  FinalQuestion({Key key}) : super(key: key);

  @override
  _FinalQuestionState createState() => _FinalQuestionState();
}

class _FinalQuestionState extends State<FinalQuestion> {
  @override
  Widget build(BuildContext context) {
    Size screen = MediaQuery.of(context).size;
    return Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
          backgroundColor: Colors.white,
          elevation: 0,
          title: Text.rich(
            TextSpan(
                text: 'keva health',
                style: TextStyle(
                  fontFamily: 'Poppins-Medium',
                  fontSize: screen.height * 0.0375,
                  color: Color(0xFF426CB4),
                )),
          ),
        ),
        body: SafeArea(
          child: ListView(children: <Widget>[
            Padding(
              padding: EdgeInsets.symmetric(
                  vertical: screen.height * 0.125,
                  horizontal: screen.width * 0.1),
              child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "If you could have anything attainable to improve your practice, what would it be?",
                      style: TextStyle(
                          fontSize: screen.height * 0.025,
                          fontWeight: FontWeight.w500),
                      textAlign: TextAlign.left,
                    ),
                    SizedBox(
                      height: screen.height * 0.025,
                    ),
                    Container(
                      height: screen.height * 0.25,
                      width: screen.width * 0.9,
                      child: Card(
                          elevation: 5.0,
                          child: TextFormField(
                            maxLines: 20,
                            validator: (String l) =>
                                null, //Links, while recommended, aren't needed if description covers it
                            style: TextStyle(color: Colors.black),
                            cursorColor: Colors.black,
                            decoration: InputDecoration(
                                border: InputBorder.none,
                                contentPadding: EdgeInsets.symmetric(
                                    horizontal: screen.width * 0.05,
                                    vertical: screen.height * 0.0125),
                                hintText: "Please enter your response",
                                hintStyle: TextStyle(
                                    color: Color(0xFF787878),
                                    fontSize: screen.height * 0.0175)),
                          )),
                    ),
                  ]),
            ),
            Padding(
              padding: EdgeInsets.symmetric(
                  vertical: screen.height * 0.13,
                  horizontal: screen.width * 0.05),
              child: Container(
                alignment: Alignment.bottomRight,
                child: RaisedButton(
                  padding: EdgeInsets.symmetric(
                      horizontal: screen.height * 0.04,
                      vertical: screen.height * 0.0125),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30)),
                  onPressed: () => [
                    Navigator.push(context, MaterialPageRoute(builder: (_) {
                      return SurveyComplete();
                    }))
                  ],
                  color: Color(0xFF426CB4),
                  child: Text("Next!",
                      style: TextStyle(
                          fontFamily: 'Poppins-Medium',
                          color: Colors.white,
                          fontSize: screen.height * 0.025)),
                ),
              ),
            ),
          ]),
        ));
  }
}
