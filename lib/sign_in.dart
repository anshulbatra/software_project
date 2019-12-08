import 'package:flutter/material.dart';

import 'auth_provider.dart';

class Signin extends StatefulWidget {
  @override
  State createState() => new SigninState();
}

class SigninState extends State<Signin>
    with SingleTickerProviderStateMixin {
       final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  String _email, _password;
   void submit() async {
    final form = _formKey.currentState;
    form.save();
        try {
        final auth = Provider.of(context).auth;
        String uid = await auth.signInWithEmailAndPassword(_email, _password);
        print("Signed In with ID $uid");
        Navigator.of(context).pushReplacementNamed('/home');
      } 
      catch (e) {
        print (e);
    }
   }
  Animation<double> _iconAnimation;
  AnimationController _iconAnimationController;

  @override
  void initState() {
    super.initState();
    _iconAnimationController = new AnimationController(
        vsync: this, duration: new Duration(milliseconds: 500));
    _iconAnimation = new CurvedAnimation(
      parent: _iconAnimationController,
      curve: Curves.bounceOut,
    );
    _iconAnimation.addListener(() => this.setState(() {}));
    _iconAnimationController.forward();
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      backgroundColor: Colors.white10,
      body: Center(
        child: SingleChildScrollView(
         //child:new Stack(
       // fit: StackFit.expand, 
       child: Column(
        children: <Widget>[
        new Theme(
          data: new ThemeData(
              brightness: Brightness.dark,
              inputDecorationTheme: new InputDecorationTheme(
                hintStyle: new TextStyle(color: Colors.blueGrey, fontSize: 20.0),
                labelStyle:
                    new TextStyle(color: Colors.white, fontSize: 25.0),
              )),
          isMaterialAppTheme: true,
          child: new Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              new FlutterLogo(
                size: _iconAnimation.value * 140.0,
              ),
              new Container(
                padding: const EdgeInsets.all(40.0),
                child: new Form(
                  key: _formKey,
                  autovalidate: true,
                  child: new Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: <Widget>[
                      new TextFormField(
                        decoration: new InputDecoration(
                            labelText: "Email", fillColor: Colors.black,
                            hintText: "Enter email id"),
                        keyboardType: TextInputType.text,
                        validator: (value) {
                            if(value.isEmpty){
                              return 'Please provide an email';
                              }
                          },
                          onSaved: (input) => _email = input,
                      ),
                      new TextFormField(
                        decoration: new InputDecoration(
                          labelText: "Password",
                          hintText: "Enter the Password"
                        ),
                        obscureText: true,
                        keyboardType: TextInputType.text,
                         validator: (input) {

                            if(input.length < 6){
                               return 'password should be atleast 6 digits long';
                                }
                            },
                            onSaved: (input)=>_password=input,
                      ),
                      new Padding(
                        padding: const EdgeInsets.only(top: 50.0),
                      ),
                      new MaterialButton(
                        height: 50.0,
                        minWidth: 150,
                        color: Colors.blueAccent,
                        splashColor: Colors.blue,
                        textColor: Colors.white,
                        child:new Row(mainAxisAlignment: MainAxisAlignment.center,
                          children : [ 
                          Text("Login ",textAlign: TextAlign.center,style: new TextStyle(fontSize: 20),),
                          new Icon(Icons.input),],
                          ), 
                        onPressed: submit,//sign in
                      ),
                      new MaterialButton(
                       child:new Text("New User? Signup" ),
                       onPressed: (){
                         Navigator.of(context).pushReplacementNamed('/signUp');
                        // navigateToSignUpPage(context);
                         /*Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => SignUpPage()),
                          );*/
                       },
                      ),
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ]
      ),
        ),
      ),
    );
  }
  
}