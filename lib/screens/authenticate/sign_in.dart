import 'package:brewcrew/services/auth.dart';
import 'package:brewcrew/shared/constants.dart';
import 'package:brewcrew/shared/loading.dart';
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
  final _formKey = GlobalKey<FormState>();
  bool loading = false;

  //text field state
  String email = "";
  String password = "";
  String error = "";

  //

  @override
  Widget build(BuildContext context) {
    return loading ? Loading() : Scaffold(
      backgroundColor: Colors.grey[100],
      appBar: AppBar(
        backgroundColor: Colors.grey,
        elevation: 0.0,
        title: Text("Sign In to Brew Crew"),
        actions: [
          TextButton.icon(
            onPressed: () {
              widget.toggleView();
            },
            icon: Icon(
              Icons.app_registration_rounded,
              color: Colors.white,
            ),
            label: Text(
              "Register",
              style: TextStyle(color: Colors.white),
            ),
            style: ButtonStyle(
              backgroundColor: MaterialStateProperty.all(Colors.grey),
              elevation: MaterialStateProperty.all(0.0),
            ),
          )
        ],
      ),
      body: Container(
        padding: EdgeInsets.symmetric(vertical: 20, horizontal: 50),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              SizedBox(
                height: 20,
              ),
              TextFormField(
                decoration: textInputDecoration,
                validator: (val) {
                  if (val!.isEmpty) {
                    return 'Enter an E-mail';
                  } else {
                    return null;
                  }
                },
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
                decoration: textInputDecoration.copyWith(hintText: 'password'),
                validator: (val) {
                  if (val!.length < 6) {
                    return 'Enter an Password containing minimum six characters';
                  } else {
                    return null;
                  }
                },
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
                  shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                      RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30),
                    side: BorderSide(
                      color: Colors.black26,
                      width: 2,
                    ),
                  )),
                  backgroundColor: MaterialStateProperty.all(Colors.grey),
                ),
                onPressed: () async {
                  if (_formKey.currentState!.validate()) {
                    setState(() {
                      loading = true;
                    });
                    dynamic result =
                        await _auth.signInWithEmailAndPassword(email, password);
                    if (result == null) {
                      setState(() {

                        error = "Couldn't Sign in With those Credentials ";
                        loading = false;
                      });
                    }
                  }
                },
                child: Text(
                  "Sign In",
                  style: TextStyle(color: Colors.white),
                ),
              ),
              SizedBox(
                height: 12,
              ),
              Text(
                error,
                style: TextStyle(
                  fontSize: 14,
                  color: Colors.red,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
