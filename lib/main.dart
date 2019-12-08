import 'package:flutter/material.dart';
import 'package:sample_software_project/homepage.dart';


import 'authentication.dart';
import 'auth_provider.dart';

import 'sign_in.dart';
import 'signupview.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return Provider(
      auth: AuthService(),
        child: MaterialApp(
        title: 'Behtar Bharat',
        theme: ThemeData(
          // This is the theme of your application.
          //
          // Try running your application with "flutter run". You'll see the
          // application has a blue toolbar. Then, without quitting the app, try
          // changing the primarySwatch below to Colors.green and then invoke
          // "hot reload" (press "r" in the console where you ran "flutter run",
          // or simply save your changes to "hot reload" in a Flutter IDE).
          // Notice that the counter didn't reset back to zero; the application
          // is not restarted.
          primarySwatch: Colors.blue,
        ),
        home: HomeController(), //MyHomePage(title: 'Behtar Bharat'),
        routes: <String, WidgetBuilder>{
          '/signUp': (BuildContext context) => SignUpView(),
          '/signIn': (BuildContext context) => Signin(),
          '/home': (BuildContext context) => HomeController(),
        },
      ),
    );
  }
}

class HomeController extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final AuthService auth = Provider.of(context).auth;
    return StreamBuilder<String>(
      stream: auth.onAuthStateChanged,
      builder: (context, AsyncSnapshot<String> snapshot) {
        if (snapshot.connectionState == ConnectionState.active) {
          final bool signedIn = snapshot.hasData;
          return signedIn ? MyHomePage() : Signin();
        }
        return CircularProgressIndicator();
      },
    );
  }
}