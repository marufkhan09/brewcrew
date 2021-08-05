import 'package:brewcrew/services/auth.dart';
import 'package:brewcrew/shared/constants.dart';
import 'package:brewcrew/shared/loading.dart';
import 'package:flutter/material.dart';

class Register extends StatefulWidget {
  //const Register({Key? key}) : super(key: key);

  final Function toggleView;

  Register({required this.toggleView});

  @override
  _RegisterState createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
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
        title: Text("Sign Up to Brew Crew"),
        actions: [
          TextButton.icon(
            onPressed: () {
              widget.toggleView();
            },
            icon: Icon(
              Icons.login_sharp,
              color: Colors.white,
            ),
            label: Text(
              "Sign In",
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
                decoration: textInputDecoration.copyWith(hintText: "password"),
                validator: (val) {
                  if (val!.length < 6) {
                    return 'Password must contain six characters';
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
                    dynamic result = await _auth.registerWithEmailAndPassword(
                        email, password);
                    if (result == null) {
                      setState(() {

                        error = "please register with a valid email";
                        loading = false;
                      });
                    }
                  }
                },
                child: Text(
                  "Register",
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
