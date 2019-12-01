import 'package:flutter/material.dart';

import 'login_register.dart';
import 'homepage.dart';
import 'authentication.dart';

class MappingPage extends StatefulWidget {

  final AuthImplementation auth;

  MappingPage({
    this.auth,
  });


  @override
  _MappingPageState createState() => _MappingPageState();
}

enum AuthStatus {
  notSignedIn,
  signedIn,
}


class _MappingPageState extends State<MappingPage> {

  AuthStatus authStatus = AuthStatus.notSignedIn;

  @override
  void initState() {
    super.initState();
    widget.auth.getCurrentUser().then((firebaseUserId){
      setState(() {
        authStatus = (firebaseUserId == null) ? AuthStatus.notSignedIn : AuthStatus.signedIn;
      });
    });
  }

  void _signedIn() {
    setState(() {
      authStatus = AuthStatus.signedIn;
    });
  }

  void _signOut() {
    setState(() {
      authStatus = AuthStatus.notSignedIn;
    });
  }

  @override
  Widget build(BuildContext context) {
    switch(authStatus) {
      case AuthStatus.notSignedIn:
      return new LoginRegisterPage(
        auth: widget.auth,
        onSignedIn: _signedIn,
      );

      case AuthStatus.signedIn:
      return new MyHomePage(
        auth: widget.auth,
        onSignedOut: _signOut,
      );
    }
  }
}