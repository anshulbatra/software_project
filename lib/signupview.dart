import 'package:flutter/material.dart';
import 'auth_provider.dart';


class SignUpView extends StatefulWidget {
  @override
  State createState() => new SignUpViewState();
  }
  
  class SignUpViewState extends State<SignUpView>{

    final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
    String _email, _password, _name,_contact,_aadhar,_dob;

    void submit() async {
    final form = _formKey.currentState;
    form.save();
        try
       {
         final auth = Provider.of(context).auth;
        String uid = await auth.createUserWithEmailAndPassword(_email,_password,_name,_aadhar,_dob,_contact);
        print("Signed up with New ID $uid");
        Navigator.of(context).pushReplacementNamed('/home');
      } catch (e) {
        print (e);
    }
    }

    @override
    Widget build(BuildContext context) {
      return new Scaffold(
        backgroundColor: Colors.white10,
        body: Center(
          child: SingleChildScrollView(
            child: Column(
              children: <Widget>[
                new Theme(
                  data: new ThemeData(
                    brightness: Brightness.dark,
                    inputDecorationTheme: new InputDecorationTheme(
                      hintStyle: new TextStyle(color: Colors.blueGrey, fontSize: 20.0),
                      labelStyle:
                        new TextStyle(color: Colors.white, fontSize: 20.0),
                    )
                  ),
                  isMaterialAppTheme: true,
                  child: new Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: <Widget>[
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
                                     labelText: "Name", fillColor: Colors.black,
                                     hintText: "Enter the your full name"),
                                    keyboardType: TextInputType.text,
                                   validator: (input) {
                                     if(input.isEmpty){
                                      return 'Please provide your name';
                                    }
                                    },
                                 onSaved: (input) => _name = input,
                              ),
                      new TextFormField(
                        decoration: new InputDecoration(
                            labelText: "Contact Number", fillColor: Colors.black,
                            hintText: "Enter the your phone number"),
                        keyboardType: TextInputType.phone,
                         validator: (input) {
                            if(input.length!=10){
                              return 'Please provide valid phone no.';
                            }
                          },
                           onSaved: (input) => _contact = input,
                      ),
                      new TextFormField(
                        decoration: new InputDecoration(
                            labelText: "Aadhar Number", fillColor: Colors.black,
                            hintText: "Enter the your aadhar number"),
                        keyboardType: TextInputType.number,
                         validator: (input) {
                            if(input.length!=12){
                              return 'Please provide valid Aadhar no.';
                            }
                          },
                           onSaved: (input) => _aadhar = input,
                      ),
                      new TextFormField(
                        decoration: new InputDecoration(
                            labelText: "DOB", fillColor: Colors.black,
                            hintText: "date of birth(dd-mm-yyyy)"),
                        keyboardType: TextInputType.datetime,
                         validator: (input) {
                            if(input.isEmpty){
                              return 'Please enter dob';
                            }
                          },
                           onSaved: (input) => _dob = input,
                      ),
                    
                      new TextFormField(
                        decoration: new InputDecoration(
                            labelText: "Email", fillColor: Colors.black,
                            hintText: "Enter your email id"),
                        keyboardType: TextInputType.emailAddress,
                        validator: (input) {
                            if(input.isEmpty){
                              return 'Please enter email';
                            }
                          },
                           onSaved: (input) => _email = input,
                      ),
                      new TextFormField(
                        decoration: new InputDecoration(
                          labelText: "Password",
                          hintText: "Enter a Password"
                        ),
                        obscureText: true,
                        keyboardType: TextInputType.text,
                        validator: (input) {
                            if(input.length<6){
                              return 'Password should be atleast 6 characters long';
                            }
                          },
                           onSaved: (input) => _password = input,
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
                          Text("Sign Up",textAlign: TextAlign.center,style: new TextStyle(fontSize: 20),),
                          new Icon(Icons.input),],
                          ), 
                        onPressed:submit,//signUp,
                      ),
                      new MaterialButton(
                       child:new Text("Existing User? Login!" ),
                       onPressed: (){
                         Navigator.of(context).pushReplacementNamed('/signIn');
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