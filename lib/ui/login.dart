import 'package:finplanto/ui/signUp.dart';
import 'package:finplanto/ui/splash.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import 'package:shimmer/shimmer.dart';


class signIn extends StatefulWidget {
  @override
  _signInState createState() => _signInState();
}

class _signInState extends State<signIn> {
  final FirebaseAuth firebaseAuth = FirebaseAuth.instance;
  final _formKey = GlobalKey<FormState>();
  TextEditingController _emailTextController = TextEditingController();
  TextEditingController _passwordTextController = TextEditingController();

//  SharedPreferences preferences;
  bool loading = false;
  bool isLoggedin = false;
//
  @override
  void initState() {
    super.initState();
    isSignedin();
  }

  void isSignedin() async {
    setState(() {
      loading = true;
    });
   await firebaseAuth.currentUser().then((user){
      if(user != null){
        setState(() => isLoggedin=true);
      }
    });

    if (isLoggedin == true) {
      Navigator.pushReplacement(context,
          MaterialPageRoute(builder: (BuildContext context) {
        return Splash();
      }));
    }
    setState(() {
      loading = false;
    });
  }

//  Future handleSignedIn() async {
//
//    setState(() {
//      loading = true;
//    });
//
//  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: <Widget>[
          Opacity(
            opacity: 0.5,
            child: Container(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height,
              decoration: BoxDecoration(
                image: DecorationImage(
                    fit: BoxFit.fill,
                    image: AssetImage("assets/images/dd.jpg")),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Center(
              child: Container(
                color: Colors.transparent,
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height * 0.42,
                alignment: Alignment.center,
                child: Form(
                  child: ListView(
                    children: <Widget>[
                      Center(
                        child: Shimmer.fromColors(
                          baseColor: Colors.green.shade800,
                          highlightColor: Color(0xffc8e6c9),
                          child: Container(
                            child: Text(
                              "Planto",
                              style: TextStyle(
                                  fontSize: 95, fontFamily: 'Pacifico'),
                            ),
                          ),
                        ),
                      ),
                      Padding(
                        padding:
                            const EdgeInsets.fromLTRB(14.0, 8.0, 14.0, 8.0),
                        child: Material(
                          borderRadius: BorderRadius.circular(10.0),
                          color: Colors.white,
                          elevation: 10.0,
                          child: Padding(
                            padding: const EdgeInsets.only(left: 12.0),
                            child: TextFormField(
                              controller: _emailTextController,
                              decoration: InputDecoration(
                                border: InputBorder.none,
                                hintText: "Email",
                                icon: Icon(
                                  Icons.alternate_email,
                                  color: Colors.black,
                                ),
                              ),
                              validator: (value) {
                                Pattern pattern =
                                    r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
                                RegExp regex = new RegExp(pattern);
                                if (value.isEmpty) {
                                  return "Please enter an email";
                                }
                                if (!regex.hasMatch(value)) {
                                  return 'Please make sure your email address is valid';
                                } else {
                                  return null;
                                }
                              },
                            ),
                          ),
                        ),
                      ),
                      Padding(
                        padding:
                            const EdgeInsets.fromLTRB(14.0, 8.0, 14.0, 8.0),
                        child: Material(
                          borderRadius: BorderRadius.circular(10.0),
                          color: Colors.white,
                          elevation: 10.0,
                          child: Padding(
                            padding: const EdgeInsets.only(left: 12.0),
                            child: TextFormField(
                              obscureText: true,
                              controller: _passwordTextController,
                              decoration: InputDecoration(
                                border: InputBorder.none,
                                hintText: "Password",
                                icon: Icon(
                                  Icons.lock_outline,
                                  color: Colors.black,
                                ),
                              ),
                              validator: (value) {
                                if (value.isEmpty) {
                                  return "The password field cannot be empty";
                                } else if (value.length < 6) {
                                  return "the password has to be at least 6 characters long";
                                }
                                return null;
                              },
                            ),
                          ),
                        ),
                      ),
                      Padding(
                        padding:
                            const EdgeInsets.fromLTRB(14.0, 8.0, 14.0, 8.0),
                        child: Material(
                            borderRadius: BorderRadius.circular(20.0),
                            color: Colors.black,
                            elevation: 10.0,
                            child: MaterialButton(
                              onPressed: () async {
                                if (_formKey.currentState.validate()) {
                                  print(_emailTextController.text);
                                  print(_passwordTextController.text);
                                }
                              },
                              child: Text(
                                "Sign In",
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 20.0),
                              ),
                            )),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: <Widget>[
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text(
                              "Forgot password",
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                          ),
                          Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: InkWell(
                                  onTap: () {
                                    Navigator.push(context, MaterialPageRoute(
                                        builder: (BuildContext context) {
                                      return SignUp();
                                    }));
                                  },
                                  child: Text(
                                    "Create an account",
                                    textAlign: TextAlign.center,
                                    style: TextStyle(color: Colors.black),
                                  ))),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),

//                      Visibility(
//                      visible: loading?? true,
//                      child: Center(
//                        child: Container(
//                          alignment: Alignment.center,
//                          child: CircularProgressIndicator(
//                            valueColor: AlwaysStoppedAnimation<Color>(Colors.green),
//                          ),
//                        ),
//                      )),
        ],
      ),
    );
  }
}

//
//import 'package:flutter/cupertino.dart';
//import 'package:flutter/material.dart';
//import 'package:google_sign_in/google_sign_in.dart';
//import 'package:planto/ui/splash.dart';
//import 'package:flutter_signin_button/flutter_signin_button.dart';
//
//import 'package:shimmer/shimmer.dart';
//
//class loginScreen extends StatefulWidget {
//  @override
//  _loginScreenState createState() => _loginScreenState();
//}
//
//class _loginScreenState extends State<loginScreen> {
//
//  bool _isLoggedIn = false;
//
//  GoogleSignIn _googleSignIn = GoogleSignIn(scopes: ['email']);
//
//  _login() async {
//    try {
//      await _googleSignIn.signIn();
//      setState(() {
//        _isLoggedIn = true;
//      });
//    } catch (err) {
//      print(err);
//    }
//  }
//
//  _logout() {
//    _googleSignIn.signOut();
//    setState(() {
//      _isLoggedIn = false;
//    });
//  }
//
//
//  @override
//  Widget build(BuildContext context) {
//    // TODO: implement build
//    return
//      MaterialApp(
//        home: Scaffold(
//          body: Container(
//              child: _isLoggedIn
//                  ? Splash(currentuser: _googleSignIn.currentUser)
////            Column(
////              mainAxisAlignment: MainAxisAlignment.center,
////              children: <Widget>[
////                Image.network(_googleSignIn.currentUser.photoUrl, height: 50.0, width: 50.0,),
////                Text(_googleSignIn.currentUser.displayName),
////                OutlineButton( child: Text("Logout"), onPressed: (){
////                  _logout();
////                },)
////              ],
////            )
//                  :
//                  Stack(
//                alignment: Alignment.center,
//                children: <Widget>[
//                  Opacity(
//                      opacity: 0.5,
//                      child: Container(
//
////                width: MediaQuery.of(context).size.width,
//                        child: Image.asset(
//                            'assets/images/dd.jpg'),
//                      )),
//                  Shimmer.fromColors(
//                    baseColor: Color(0xff66bb6a),
//                    highlightColor: Color(0xffc8e6c9),
//                    child: Container(
//                      child: Text("Planto",
//                        style: TextStyle(
//                            fontSize: 95,
//                            fontFamily: 'Pacifico'
//                        ),),
//                    ),
//                  ),
//                  Positioned(bottom: 300,
//                    child: Container(height: 50, width: 160,
//                        child: SignInButton(
//                          Buttons.Google,
//
//                          onPressed: () {
//                            _login();
//                          },
//                        )
//                    ),
//                  )
//
//
//                ],
//              )),
//        ),
//      );
//  }
//
//
//}

//
