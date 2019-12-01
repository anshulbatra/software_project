import 'package:flutter/material.dart';


class LoginRegisterPage extends StatefulWidget {
  @override
  _LoginRegisterPageState createState() => _LoginRegisterPageState();
}

enum FormType {
  login,
  register
}

class _LoginRegisterPageState extends State<LoginRegisterPage> {

  final formKey = GlobalKey<FormState>();
  FormType _formType = FormType.login;
  String _email = "";
  String _password = "";
  
  //methods
  bool validateAndSave() {
    final form = formKey.currentState;

    if(form.validate()) {
      form.save();
      return true;
    }
    else
      return false;
  }

  void moveToRegister() {
    formKey.currentState.reset();

    setState(() {
      _formType = FormType.register;
    });
  }
  
  void moveToLogin() {
    formKey.currentState.reset();

    setState(() {
      _formType = FormType.login;
    });
  }
  
  //Design
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: EdgeInsets.fromLTRB(10.0, 0, 10.0, 0),
        color: Colors.black87,
        child: Form(
          key: formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: createInput() + createButtons(),
          ),
        ),
      ),
    );
  }

  List<Widget> createInput() {
    if(_formType == FormType.login) {
      return 
      [
        //SizedBox(height: 10.0,),
        logo(),
        SizedBox(height: 20.0),
        TextFormField(
          decoration: InputDecoration(labelText: 'Email...',
          
          hoverColor: Colors.grey,
          ),
          style: TextStyle(color: Colors.white),
          validator: (value){
            return value.isEmpty ? 'Email isrequired' : null;
          },

          onSaved: (value){
            return _email = value;
          },

        ),
        SizedBox(height: 10.0),
        TextFormField(
          decoration: InputDecoration(labelText: 'Password...'),
          obscureText: true,
          style: TextStyle(color: Colors.white),
          validator: (value){
            return value.isEmpty ? 'Password is required' : null;
          },

          onSaved: (value){
            return _password = value;
          },
        ),
        SizedBox(height: 20.0),
      ];
    }
    else {
      return 
      [
        //SizedBox(height: 10.0,),
        //logo(),
        SizedBox(height: 70.0),
        TextFormField(
          decoration: InputDecoration(labelText: 'Name',
          focusColor: Colors.white,    
          fillColor: Colors.white,      
          ),
          style: TextStyle(color: Colors.white),
          validator: (value){
            return value.isEmpty ? 'Name is required' : null;
          },
          onSaved: (value){
            return _password = value;
          },
        ),
        SizedBox(height: 20.0),
        TextFormField(
          decoration: InputDecoration(labelText: 'City'),
          validator: (value){
            return value.isEmpty ? 'City is required' : null;
          },
          onSaved: (value){
            return _password = value;
          },
        ),
        SizedBox(height: 20.0),
        TextFormField(
          decoration: InputDecoration(labelText: 'Contact',
          hoverColor: Colors.grey,
          ),
          validator: (value){
            return value.isEmpty ? 'Contact is required' : null;
          },
          onSaved: (value){
            return _email = value;
          },

        ),
        SizedBox(height: 20.0),
        TextFormField(
          decoration: InputDecoration(labelText: 'Email'),
          validator: (value){
            return value.isEmpty ? 'Email is required' : null;
          },
          onSaved: (value){
            return _password = value;
          },
        ),
        SizedBox(height: 20.0),
        TextFormField(
          decoration: InputDecoration(labelText: 'Password'),
          obscureText: true,
          validator: (value){
            return value.isEmpty ? 'Password is required' : null;
          },
          onSaved: (value){
            return _password = value;
          },
        ),
        SizedBox(height: 40.0),
      ];
    }
  }

  Widget logo() {
    return Container(
        child: Image.asset('Assets/stylish-wavy-indian-flag.png'),
    );
  }

  List<Widget> createButtons() {
    if(_formType == FormType.login) {
      return [
        RaisedButton(
          child: Text("Login", style: TextStyle(fontSize: 20.0,),),
          textColor: Colors.white,
          color: Colors.black26,
          onPressed: validateAndSave,
        ),

        FlatButton(
          child: Text("Don't have an account? Create Account!", style: TextStyle(fontSize: 14.0,),),
          textColor: Colors.white,
          color: Colors.transparent,
          onPressed: moveToRegister,
        ),
      ];
    }
    else {
      return [
        RaisedButton(
          child: Text("Create Account", style: TextStyle(fontSize: 20.0,),),
          textColor: Colors.white,
          color: Colors.grey,
          onPressed: validateAndSave,
        ),

        FlatButton(
          child: Text("Already have an account? Login!", style: TextStyle(fontSize: 14.0,),),
          textColor: Colors.white,
          color: Colors.transparent,
          onPressed: moveToLogin,
        ),
      ];
    }
  }

}