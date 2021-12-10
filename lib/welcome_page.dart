// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, unused_local_variable, use_key_in_widget_constructors
import 'package:flutter/material.dart';

import 'auth_controller.dart';

class WelcomePage extends StatelessWidget {
  // const WelcomePage({Key? key}) : super(key: key);

  String email;
  WelcomePage({required this.email});

  @override
  Widget build(BuildContext context) {
    double w = MediaQuery.of(context).size.width;
    double h = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Column(
          children: [
            Container(
              height: h / 3,
              width: w,
              decoration: BoxDecoration(
                image: DecorationImage(
                  fit: BoxFit.cover,
                  image: AssetImage("images/signup.png"),
                ),
              ),
              child: Column(
                children: [
                  SizedBox(
                    height: h / 5,
                  ),
                  CircleAvatar(
                    radius: 50,
                    backgroundColor: Colors.white70,
                    backgroundImage: AssetImage("images/img1.png"),
                  ),
                ],
              ),
            ),
            SizedBox(height: 50),
            Container(
              width: w,
              margin: EdgeInsets.only(left: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                Text(
                  "Welcome",
                  style: TextStyle(
                    fontSize: 36,
                    fontWeight: FontWeight.bold,
                    color: Colors.black54,
                  ),
                ),
                Text(
                  email,
                  style: TextStyle(
                    fontSize: 20,
                    color: Colors.grey[500],
                  ),
                ),
              ]),
            ),
            SizedBox(height: 200,),
           GestureDetector(
              onTap: (){
                AuthController.instance.logOut();
              },
              child: Container(
                height: h / 14,
                width: w / 2,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(25),
                  image: DecorationImage(
                    fit: BoxFit.cover,
                    image: AssetImage("images/loginbtn.png"),
                  ),
                ),
                child: Center(
                  child: Text(
                    "Sign Out",
                    style: TextStyle(
                      fontSize: 25,
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
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