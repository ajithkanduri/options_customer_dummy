import 'package:flutter/material.dart';
class SplashWidget extends StatefulWidget {
  @override
  _SplashWidgetState createState() => _SplashWidgetState();
}

class _SplashWidgetState extends State<SplashWidget>{

  Widget showLoading(Color color, {double size}) {
    return Center(
      child: new Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          SizedBox(
            child: CircularProgressIndicator(
              strokeWidth: 2,
              valueColor: AlwaysStoppedAnimation<Color>(color),
            ),
            height: size == null ? 23.0 : size,
            width: size == null ? 23.0 : size,
          )
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Container(
            height: 200,
            width: 200,
            child: Image.asset(
              "assets/images/logo.png",
              fit: BoxFit.fill,
            ),
          ),
          SizedBox(
            height: 30,
          ),
          Text("Loading Please Wait..."),
          SizedBox(
            height: 30,
          ),
          showLoading(Colors.grey),
        ],
      ),
    );
  }

}