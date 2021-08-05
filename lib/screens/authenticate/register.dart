import 'package:brewcrew/services/auth.dart';
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

  //text field state
  String email = "";
  String password = "";
  String error = "";

  //

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[100],
      appBar: AppBar(
        backgroundColor: Colors.grey,
        elevation: 0.0,
        title: Text("Sign Up to Brew Crew"),
        actions: [
          // ElevatedButton.icon(
          //   onPressed: () {
          //     widget.toggleView();
          //   },
          //   icon: Icon(Icons.person),
          //   label: Text("Sign In"),
          //   style: ButtonStyle(
          //     backgroundColor: MaterialStateProperty.all(Colors.black),
          //     elevation: MaterialStateProperty.all(0.0),
          //   ),
          // ),
          TextButton.icon(
            onPressed: (){
              widget.toggleView();
            },
            icon: Icon(Icons.login_sharp,
            color: Colors.white,),
            label: Text("Sign In",style: TextStyle(color: Colors.white),),
            style: ButtonStyle(
            backgroundColor: MaterialStateProperty.all(Colors.grey),
            elevation:  MaterialStateProperty.all(0.0),

          ),)
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
                  backgroundColor: MaterialStateProperty.all(Colors.grey),
                ),
                onPressed: () async {
                  if (_formKey.currentState!.validate()) {
                    dynamic result = await _auth.registerWithEmailAndPassword(email, password);
                    if(result == null){
                    setState(() {
            error = "please register with a valid email";
                    });
                    }
                  }
                },
                child: Text(
                  "Register",
                  style: TextStyle(color: Colors.white),
                ),
              ),
              SizedBox(height: 12,),
              Text(error,
              style: TextStyle(
                fontSize: 14,
                color: Colors.red,
              ),),
            ],
          ),
        ),
      ),
    );
  }
}
