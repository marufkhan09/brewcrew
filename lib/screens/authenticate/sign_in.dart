import 'package:brewcrew/services/auth.dart';
import 'package:flutter/material.dart';

class SignIn extends StatefulWidget {
  // const SignIn({Key? key}) : super(key: key);

  final Function toggleView;

  SignIn({required this.toggleView});

  @override
  _SignInState createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  final AuthService _auth = AuthService();

  //text field state
  String email = "";
  String password = "";

  //

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[100],
      appBar: AppBar(
        backgroundColor: Colors.grey,
        elevation: 0.0,
        title: Text("Sign In to Brew Crew"),
        actions: [

          TextButton.icon(
            onPressed: (){
              widget.toggleView();
            },
            icon: Icon(Icons.app_registration_rounded,
              color: Colors.white,),
            label: Text("Register",style: TextStyle(color: Colors.white),),
            style: ButtonStyle(
              backgroundColor: MaterialStateProperty.all(Colors.grey),
              elevation:  MaterialStateProperty.all(0.0),

            ),)
        ],
      ),
      body: Container(
        padding: EdgeInsets.symmetric(vertical: 20, horizontal: 50),
        child: Form(
          child: Column(
            children: [
              SizedBox(
                height: 20,
              ),
              TextFormField(
                onChanged: (val) {
                  setState(() {
                    email = val;
                  });
                },
              ),
              SizedBox(
                height: 20,
              ),
              TextFormField(
                obscureText: true,
                onChanged: (val) {
                  setState(() {
                    password = val;
                  });
                },
              ),
              SizedBox(
                height: 20,
              ),
              ElevatedButton(
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all(Colors.grey),
                ),
                onPressed: () async {
                  print(email);
                  print(password);
                },
                child: Text(
                  "Sign In",
                  style: TextStyle(color: Colors.white),
                ),
              ),

            ],
          ),
        ),
      ),
    );
  }
}
