import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:keva_health/UI/demoPage.dart';
import 'package:url_launcher/url_launcher.dart';

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
                      fontSize: screen.width * 0.0375,
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
                      return SurveyIntro();
                    })),
                  ],
                  color: Color(0xFF426CB4),
                  child: Text("Next!",
                      style: TextStyle(
                          fontFamily: 'Poppins-Medium',
                          color: Colors.white,
                          fontSize: screen.width * 0.03)),
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
            style: TextStyle(fontSize: screen.height * 0.02),
          ),
        )
      ]),
    );
  }
}

enum boolChoices { yes, no }

class SurveyIntro extends StatefulWidget {
  const SurveyIntro({Key key}) : super(key: key);

  @override
  _SurveyIntroState createState() => _SurveyIntroState();
}

class _SurveyIntroState extends State<SurveyIntro> {
  boolChoices initial = boolChoices.no;
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
                          fontSize: screen.width * 0.0375,
                          color: Color(0xFF426CB4),
                        )),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(
                      left: 15.0, bottom: 12.0, top: screen.height * 0.075),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Do you have an RPM solution?",
                        style: TextStyle(
                            fontSize: screen.width * 0.025,
                            fontWeight: FontWeight.w500),
                        textAlign: TextAlign.left,
                      ),
                      SizedBox(height: screen.height * 0.0125),
                      Container(
                        width: screen.width * 0.9,
                        height: screen.height * 0.15,
                        child: Card(
                            elevation: 5.0,
                            child: Container(
                                height: screen.height * 0.125,
                                width: screen.width * 0.7,
                                child: Column(
                                  children: [
                                    ListTile(
                                      title: Text('Yes',
                                          style: TextStyle(
                                              fontSize: screen.width * 0.02)),
                                      leading: Radio(
                                        value: boolChoices.yes,
                                        groupValue: initial,
                                        onChanged: (boolChoices value) {
                                          setState(() {
                                            initial = value;
                                          });
                                        },
                                      ),
                                    ),
                                    ListTile(
                                      title: Text('No',
                                          style: TextStyle(
                                              fontSize: screen.width * 0.02)),
                                      leading: Radio(
                                        value: boolChoices.no,
                                        groupValue: initial,
                                        onChanged: (boolChoices value) {
                                          setState(() {
                                            initial = value;
                                          });
                                        },
                                      ),
                                    ),
                                  ],
                                ))),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(
                      left: 15.0, bottom: 12.0, top: screen.height * 0.075),
                  child: Text(
                    "If yes, what's the name of your current solution?",
                    style: TextStyle(
                        fontSize: screen.width * 0.025,
                        fontWeight: FontWeight.w500),
                    textAlign: TextAlign.left,
                  ),
                ),
                Container(
                    child: Padding(
                  padding: EdgeInsets.only(left: 15.0),
                  child: Container(
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
                                  horizontal: 12.0, vertical: 12.0),
                              hintText: "Please enter your current solution",
                              hintStyle: TextStyle(
                                  color: Color(0xFF787878),
                                  fontSize: screen.width * 0.02)),
                        )),
                  ),
                )),
                Padding(
                  padding: EdgeInsets.only(
                      left: 15.0, bottom: 12.0, top: screen.height * 0.075),
                  child: Text(
                    "How many asthma patients do you currently have?",
                    style: TextStyle(
                        fontSize: screen.width * 0.025,
                        fontWeight: FontWeight.w500),
                    textAlign: TextAlign.left,
                  ),
                ),
                Container(
                    child: Padding(
                  padding: EdgeInsets.only(left: 15.0),
                  child: Container(
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
                                  horizontal: 12.0, vertical: 12.0),
                              hintText: "Please enter your current solution",
                              hintStyle: TextStyle(
                                  color: Color(0xFF787878),
                                  fontSize: screen.width * 0.02)),
                        )),
                  ),
                )),
              ]),
          Padding(
            padding: EdgeInsets.symmetric(
                horizontal: 20.0, vertical: screen.height * 0.175),
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
                    return SurveyExtended();
                  })),
                ],
                color: Color(0xFF426CB4),
                child: Text("Next!",
                    style: TextStyle(
                        fontFamily: 'Poppins-Medium',
                        color: Colors.white,
                        fontSize: screen.width * 0.03)),
              ),
            ),
          )
        ],
      ),
    );
  }
}

class SurveyExtended extends StatefulWidget {
  const SurveyExtended({Key key}) : super(key: key);

  @override
  _SurveyExtendedState createState() => _SurveyExtendedState();
}

class _SurveyExtendedState extends State<SurveyExtended> {
  @override
  Widget build(BuildContext context) {
    Size screen = MediaQuery.of(context).size;
    boolChoices initial = boolChoices.no;
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
                          color: Color(0xFF426CB4),
                        )),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(
                      left: 15.0, bottom: 12.0, top: screen.height * 0.075),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Would you be interested in signing up?",
                        style: TextStyle(
                            fontSize: screen.width * 0.025,
                            fontWeight: FontWeight.w500),
                        textAlign: TextAlign.left,
                      ),
                      SizedBox(height: screen.height * 0.0125),
                      Container(
                        width: screen.width * 0.9,
                        height: screen.height * 0.15,
                        child: Card(
                            elevation: 5.0,
                            child: Container(
                                height: screen.height * 0.125,
                                width: screen.width * 0.7,
                                child: Column(
                                  children: [
                                    ListTile(
                                      title: Text('Yes',
                                          style: TextStyle(
                                              fontSize: screen.width * 0.02)),
                                      leading: Radio(
                                        value: boolChoices.yes,
                                        groupValue: initial,
                                        onChanged: (boolChoices value) {
                                          setState(() {
                                            initial = value;
                                          });
                                        },
                                      ),
                                    ),
                                    ListTile(
                                      title: Text('No',
                                          style: TextStyle(
                                              fontSize: screen.width * 0.02)),
                                      leading: Radio(
                                        value: boolChoices.no,
                                        groupValue: initial,
                                        onChanged: (boolChoices value) {
                                          setState(() {
                                            initial = value;
                                          });
                                        },
                                      ),
                                    ),
                                  ],
                                ))),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(
                      left: 15.0, bottom: 12.0, top: screen.height * 0.05),
                  child: Text(
                    "Your name",
                    style: TextStyle(
                        fontSize: screen.width * 0.025,
                        fontWeight: FontWeight.w500),
                    textAlign: TextAlign.left,
                  ),
                ),
                Container(
                    child: Padding(
                  padding: EdgeInsets.only(left: 15.0),
                  child: Container(
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
                                  horizontal: 12.0, vertical: 12.0),
                              hintText: "Please enter your name",
                              hintStyle: TextStyle(
                                  color: Color(0xFF787878),
                                  fontSize: screen.width * 0.02)),
                        )),
                  ),
                )),
                Padding(
                  padding: EdgeInsets.only(
                      left: 15.0, bottom: 12.0, top: screen.height * 0.05),
                  child: Text(
                    "Your email",
                    style: TextStyle(
                        fontSize: screen.width * 0.025,
                        fontWeight: FontWeight.w500),
                    textAlign: TextAlign.left,
                  ),
                ),
                Container(
                    child: Padding(
                  padding: EdgeInsets.only(left: 15.0),
                  child: Container(
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
                                  horizontal: 12.0, vertical: 12.0),
                              hintText: "Please enter your email",
                              hintStyle: TextStyle(
                                  color: Color(0xFF787878),
                                  fontSize: screen.width * 0.02)),
                        )),
                  ),
                )),
                Padding(
                  padding: EdgeInsets.only(
                      left: 15.0, bottom: 12.0, top: screen.height * 0.05),
                  child: Text(
                    "Your phone number",
                    style: TextStyle(
                        fontSize: screen.width * 0.025,
                        fontWeight: FontWeight.w500),
                    textAlign: TextAlign.left,
                  ),
                ),
                Container(
                    child: Padding(
                  padding: EdgeInsets.only(left: 15.0),
                  child: Container(
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
                                  horizontal: 12.0, vertical: 12.0),
                              hintText: "Please enter your phone number",
                              hintStyle: TextStyle(
                                  color: Color(0xFF787878),
                                  fontSize: screen.width * 0.02)),
                        )),
                  ),
                )),
              ]),
          Padding(
            padding: EdgeInsets.symmetric(
                horizontal: 20.0, vertical: screen.height * 0.075),
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
                    return SurveyComplete();
                  })),
                ],
                color: Color(0xFF426CB4),
                child: Text("Next!",
                    style: TextStyle(
                        fontFamily: 'Poppins-Medium',
                        color: Colors.white,
                        fontSize: screen.width * 0.03)),
              ),
            ),
          )
        ],
      ),
    );
  }
}

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
                    fontSize: screen.width * 0.0375,
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
