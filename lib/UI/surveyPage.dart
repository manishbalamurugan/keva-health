import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

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
                      fontSize: 25,
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
              padding:
                  const EdgeInsets.symmetric(horizontal: 20.0, vertical: 0.0),
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
                  color: Color(0xFF426CB4),
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
                          fontSize: 25,
                          color: Color(0xFF426CB4),
                        )),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(
                      left: 15.0, bottom: 12.0, top: screen.height * 0.025),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Do you have an RPM solution?",
                        style: TextStyle(
                            fontSize: 18, fontWeight: FontWeight.w500),
                        textAlign: TextAlign.left,
                      ),
                      SizedBox(height: 10),
                      Container(
                        width: screen.width * 0.9,
                        child: Card(
                            elevation: 5.0,
                            child: Container(
                                height: 125,
                                width: screen.width * 0.7,
                                child: Column(
                                  children: [
                                    ListTile(
                                      title: Text('Yes',
                                          style: TextStyle(fontSize: 15)),
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
                                          style: TextStyle(fontSize: 15)),
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
                    "If yes, what's the name of your current solution?",
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
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
                            hintText: "Please enter your current solution",
                            hintStyle: TextStyle(
                                color: Color(0xFF787878), fontSize: 13)),
                      )),
                )),
                SizedBox(height: 20),
                Padding(
                  padding: EdgeInsets.only(
                      left: 15.0, bottom: 12.0, top: screen.height * 0.05),
                  child: Text(
                    "How many asthma patients do you currently have?",
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
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
                            hintText:
                                "Please your current number of asthma patients",
                            hintStyle: TextStyle(
                                color: Color(0xFF787878), fontSize: 13)),
                      )),
                )),
              ]),
          Padding(
            padding: EdgeInsets.symmetric(
                horizontal: 20.0, vertical: screen.height * 0.175),
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
                color: Color(0xFF426CB4),
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
                      left: 15.0, bottom: 0.0, top: screen.height * 0.025),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Would you be interested in signing up?",
                        style: TextStyle(
                            fontSize: 18, fontWeight: FontWeight.w500),
                        textAlign: TextAlign.left,
                      ),
                      SizedBox(height: 10),
                      Container(
                        width: screen.width * 0.9,
                        child: Card(
                            elevation: 5.0,
                            child: Container(
                                height: 125,
                                width: screen.width * 0.7,
                                child: Column(
                                  children: [
                                    ListTile(
                                      title: Text('Yes',
                                          style: TextStyle(fontSize: 15)),
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
                                          style: TextStyle(fontSize: 15)),
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
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
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
                            hintText: "Please enter your full name",
                            hintStyle: TextStyle(
                                color: Color(0xFF787878), fontSize: 13)),
                      )),
                )),
                Padding(
                  padding: EdgeInsets.only(
                      left: 15.0, bottom: 12.0, top: screen.height * 0.05),
                  child: Text(
                    "Your email",
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
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
                Padding(
                  padding: EdgeInsets.only(
                      left: 15.0, bottom: 12.0, top: screen.height * 0.05),
                  child: Text(
                    "Your phone number",
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
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
              ]),
          Padding(
            padding: EdgeInsets.symmetric(
                horizontal: 20.0, vertical: screen.height * 0.11),
            child: Container(
              alignment: Alignment.bottomRight,
              child: RaisedButton(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20)),
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
                        fontSize: 16)),
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
                    fontSize: 25,
                    color: Color(0xFF426CB4),
                  )),
            ),
          ),
          SingleChildScrollView(
            child: Column(children: [
              Image.asset(
                'assets/graphic.png',
                scale: 2.0,
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: screen.width * 0.075),
                child: Text(
                  "Thank you for completing our survey!",
                  style: TextStyle(fontSize: 25),
                ),
              )
            ]),
          )
        ],
      )
    ]));
  }
}
