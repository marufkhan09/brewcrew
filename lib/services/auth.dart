import 'package:brewcrew/models/user.dart';
import 'package:firebase_auth/firebase_auth.dart';

class AuthService {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  //create user object based on firebase user
  User? _userFromFirebaseUser(FirebaseUser user) {
    return user != null ? User(uid: user.uid) : null;
  }

  //auth change user stream

  Stream<User?> get user {
    // return _auth.onAuthStateChanged.map((FirebaseUser user) => _userFromFirebaseUser(user));
    //same thing is above
    return _auth.onAuthStateChanged.map((_userFromFirebaseUser));
  }

  //sign in anon

  Future signInAnon() async {
    try {
      //here we are assigning it to a variable of type (AuthResult) named result

      AuthResult result = await _auth.signInAnonymously();
      FirebaseUser user = result.user;
      return _userFromFirebaseUser(user);
    } catch (e) {
      print(e.toString());
      return null;
    }
  }

  //sign in with email and pass

  //register with email and pass

  //sign out

  Future signOut() async {
    try {
      //here we are just waiting for this to complete so no need to assign this
      //to something as when its completed the value of the user in root(wrapper)
      //will be null and it will return authenticate screen instead of home.
      return await _auth.signOut();
    } catch (e) {
      print(e.toString());
      return null;
    }
  }
}
