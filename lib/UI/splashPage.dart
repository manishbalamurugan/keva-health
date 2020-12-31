import 'package:flutter/material.dart';
import 'package:keva_health/UI/demoPage.dart';

class SplashPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Size screen = MediaQuery.of(context).size;
    return Scaffold(
      body: SafeArea(
        child: Wrap(
          children: [
            Padding(
              padding: EdgeInsets.only(top: screen.height * 0.2),
              child: Container(
                alignment: Alignment.center,
                margin: EdgeInsets.symmetric(horizontal: 20),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text.rich(
                      TextSpan(
                        text: 'Meet\n',
                        style: TextStyle(
                          fontFamily: 'Poppins-Normal',
                          fontSize: 45,
                          color: Colors.black,
                        ),
                        children: <TextSpan>[
                          TextSpan(
                              text: 'Keva Platform',
                              style: TextStyle(
                                fontFamily: 'Poppins-Medium',
                                fontSize: 45,
                                color: Color(0xFF426CB4),
                              )),
                        ],
                      ),
                    ),
                    SizedBox(height: 5),
                    Text(
                      'your solution for respiratory disease management',
                      style: TextStyle(
                          fontFamily: 'Poppins-Normal',
                          fontSize: 20,
                          color: Colors.grey[800]),
                    ),
                  ],
                ),
              ),
            ),
            Container(
              alignment: Alignment.bottomCenter,
              margin: EdgeInsets.only(top: screen.height * 0.375),
              child: RaisedButton(
                padding: EdgeInsets.symmetric(
                    horizontal: screen.width * 0.25,
                    vertical: screen.height * 0.01),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20)),
                onPressed: () {
                  Navigator.push(context, MaterialPageRoute(builder: (_) {
                    return DemoPage();
                  }));
                },
                color: Color(0xFF426CB4),
                child: Text("Let's get started",
                    style: TextStyle(
                        fontFamily: 'Poppins-Medium',
                        color: Colors.white,
                        fontSize: 16)),
              ),
            )
          ],
        ),
      ),
    );
  }
}
