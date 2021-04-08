//import 'package:kweliscore/provider/providers.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:kweliscore/models/models.dart';
import 'package:kweliscore/provider/providers.dart';

enum Status { Uninitialized, Authenticated, Authenticating, Unauthenticated }

class AuthProvider with ChangeNotifier {
  final FirebaseAuth auth;
  User currentUser;
  Status _status = Status.Uninitialized;
  DatabaseProvider database = DatabaseProvider();

  Status get status => _status;
  User get user => currentUser;

  // DatabaseProvider database = DatabaseProvider();

  AuthProvider.instance() : auth = FirebaseAuth.instance {
    auth.authStateChanges().listen(_onAuthStateChanged);
  }

  /*
  AUTH LISTENER
  */
  Future<void> _onAuthStateChanged(User firebaseUser) async {
    if (firebaseUser == null) {
      _status = Status.Unauthenticated;
    } else {
      currentUser = firebaseUser;
      _status = Status.Authenticated;
    }
    notifyListeners();
  }

  /*
  ANONYMOUS LOGIN
  */
  Future anonymousSignIn() async {
    _status = Status.Authenticating;
    notifyListeners();
    try {
      UserCredential result = await FirebaseAuth.instance.signInAnonymously();
      currentUser = result.user;

      return Future.value(currentUser);
    } on FirebaseAuthException catch (error) {
      _status = Status.Unauthenticated;
      notifyListeners();
      return error.message;
    }
  }

  /*
  USER REGISTRATION
  */
  Future createUser(UserModel user) async {
    _status = Status.Authenticating;
    notifyListeners();
    try {
      UserCredential result = await auth.createUserWithEmailAndPassword(
        email: user.email,
        password: user.password,
      );
      currentUser = result.user;
      String uid = currentUser.uid;
      print('The new user is identified by $uid');

      // Send an email verification
      currentUser.sendEmailVerification();

      // Save the user to the database
        await database.saveUser(user, uid);

      return Future.value(currentUser);
    } on FirebaseAuthException catch (error) {
      _status = Status.Unauthenticated;
      notifyListeners();
      return error.message;
    }
  }

  /*
  USER LOGIN
  */
  Future signInEmailPass(UserModel user) async {
    _status = Status.Authenticating;
    notifyListeners();
    try {
      UserCredential result = await auth.signInWithEmailAndPassword(
        email: user.email,
        password: user.password,
      );
      currentUser = result.user;

      return Future.value(currentUser);
    } on FirebaseAuthException catch (error) {
      _status = Status.Unauthenticated;
      notifyListeners();
      return error.message;
    }
  }

  /*
  USER LOGOUT
  */
  Future<void> signOut() async {
    auth.signOut();
    _status = Status.Unauthenticated;
    notifyListeners();
    return Future.delayed(Duration.zero);
  }
}
