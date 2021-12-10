// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, unused_local_variable
import 'package:flutter/material.dart';
import 'package:flutter_firebase_app/auth_controller.dart';

class SignUpPage extends StatelessWidget {
  const SignUpPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var nameController=TextEditingController();
    var emailController=TextEditingController();
    var passwordController=TextEditingController();

    List img = ["images/g.png", "images/t.png", "images/f.png"];
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
            Container(
              margin: EdgeInsets.only(left: 20, right: 20),
              width: w,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: 20),
                  textField(
                      controllers:nameController,
                      text: "Name",
                      icon: Icon(Icons.person, color: Colors.deepOrange)),
                  SizedBox(height: 20),
                  textField(
                      controllers:emailController,
                      text: "Email",
                      icon: Icon(Icons.email, color: Colors.deepOrange)),
                  SizedBox(height: 20),
                  textField(
                      controllers:passwordController,
                      text: "Password",
                      icon: Icon(Icons.password, color: Colors.deepOrange)),
                  // SizedBox(height: 20),
                ],
              ),
            ),
            SizedBox(height: 50),
            GestureDetector(
              onTap: (){
                AuthController.instance.register(nameController.text.trim(), emailController.text.trim(), passwordController.text.trim());
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
                    "Sign Up",
                    style: TextStyle(
                      fontSize: 25,
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
            ),
            TextButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: Text(
                "Have an account?",
                style: TextStyle(
                  fontSize: 20,
                  color: Colors.grey[500],
                ),
              ),
            ),
            SizedBox(height: w / 10),
            RichText(
              text: TextSpan(
                text: "Sign up using one of the following methods",
                style: TextStyle(
                  fontSize: 15,
                  color: Colors.grey[500],
                ),
              ),
            ),
            // SizedBox(height: w / 20),
            Wrap(
              children: List<Widget>.generate(3, (index) {
                return Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: CircleAvatar(
                    radius: 30,
                    backgroundColor: Colors.grey[500],
                    child: CircleAvatar(
                      radius: 25,
                      backgroundImage: AssetImage(img[index]),
                    ),
                  ),
                );
              }),
            ),
          ],
        ),
      ),
    );
  }

  Container textField({required Icon icon, required String text, required TextEditingController controllers}) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(25),
        boxShadow: [
          BoxShadow(
            blurRadius: 10,
            spreadRadius: 10,
            offset: Offset(1, 1),
            color: Colors.grey.withOpacity(0.2),
          )
        ],
      ),
      child: TextField(
        controller: controllers,
        decoration: InputDecoration(
          hintText: text,
          prefixIcon: icon,
          focusedBorder: oulineInputBorder(),
          enabledBorder: oulineInputBorder(),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(25),
          ),
        ),
      ),
    );
  }

  OutlineInputBorder oulineInputBorder() {
    return OutlineInputBorder(
      borderRadius: BorderRadius.circular(25),
      borderSide: BorderSide(
        color: Colors.white,
        width: 1.0,
      ),
    );
  }
}