import 'package:finplanto/models/users.dart';
import 'package:finplanto/ui/home.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';


import 'package:shimmer/shimmer.dart';


class SignUp extends StatefulWidget {
  @override
  _SignUpState createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  final FirebaseAuth firebaseAuth = FirebaseAuth.instance;
  final _formKey = GlobalKey<FormState>();

  UserServices _userServices=UserServices();
  TextEditingController _emailTextController = TextEditingController();
  TextEditingController _passwordTextController = TextEditingController();
  TextEditingController _nameTextController = TextEditingController();
  TextEditingController _conpasswordTextController = TextEditingController();
  String gender;
  String groupValue = "Male";
  String error = "";
  bool hideP1 = true;
  bool hideP2 = true;
  bool loading = false;

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
                height: MediaQuery.of(context).size.height * 0.70,
                alignment: Alignment.center,
                child: Form(
                  key: _formKey,
                  child: ListView(
                    physics: const NeverScrollableScrollPhysics(),
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
                          elevation: 20.0,
                          child: Padding(
                            padding: const EdgeInsets.only(left: 12.0),
                            child: TextFormField(
                              controller: _nameTextController,
                              decoration: InputDecoration(
                                border: InputBorder.none,
                                hintText: "Name",
                                icon: Icon(
                                  Icons.person_outline,
                                  color: Colors.black,
                                ),
                              ),
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
                          elevation: 20.0,
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
                            elevation: 20,
                            borderRadius: BorderRadius.circular(10.0),
                            color: Colors.white,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: <Widget>[
                                Container(
                                  child: Row(
                                    children: <Widget>[
                                      Radio(
                                          activeColor: Colors.black,
                                          value: "Male",
                                          groupValue: groupValue,
                                          onChanged: (e) => valueChange(e)),
                                      Text("Male"),
                                    ],
                                  ),
                                ),
                                Container(
                                  child: Row(
                                    children: <Widget>[
                                      Radio(
                                          activeColor: Colors.black,
                                          value: "Female",
                                          groupValue: groupValue,
                                          onChanged: (e) => valueChange(e)),
                                      Text("Female"),
                                    ],
                                  ),
                                ),
                                Container(
                                  child: Row(
                                    children: <Widget>[
                                      Radio(
                                          activeColor: Colors.black,
                                          value: "Other",
                                          groupValue: groupValue,
                                          onChanged: (e) => valueChange(e)),
                                      Text("Other"),
                                    ],
                                  ),
                                )
                              ],
                            )),
                      ),
                      Padding(
                        padding:
                            const EdgeInsets.fromLTRB(14.0, 8.0, 14.0, 8.0),
                        child: Material(
                          borderRadius: BorderRadius.circular(10.0),
                          color: Colors.white,
                          elevation: 20.0,
                          child: Padding(
                            padding: const EdgeInsets.only(left: 12.0),
                            child: ListTile(
                              title: TextFormField(
                                obscureText: hideP1,
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
                              trailing: IconButton(
                                  icon: Icon(
                                    Icons.remove_red_eye,
                                    color: Colors.black,
                                  ),
                                  onPressed: () => _toggle()),
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
                          elevation: 20.0,
                          child: Padding(
                            padding: const EdgeInsets.only(left: 12.0),
                            child: ListTile(
                              title: TextFormField(
                                obscureText: hideP2,
                                controller: _conpasswordTextController,
                                decoration: InputDecoration(
                                  border: InputBorder.none,
                                  hintText: "Confirm Password",
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
                                  } else if (_passwordTextController.text !=
                                      value) {
                                    return "Passwords do not match";
                                  }
                                  return null;
                                },
                              ),
                              trailing: IconButton(
                                  icon: Icon(
                                    Icons.remove_red_eye,
                                    color: Colors.black,
                                  ),
                                  onPressed: () =>  _toggle2()),
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
                            elevation: 20.0,
                            child: MaterialButton(
                              onPressed: () async {
                                validateForm();
//                                if (_formKey.currentState.validate()) {
//                                  print(_nameTextController);
//                                  print(_emailTextController);
//                                  print(_passwordTextController);
//                                  print(gender);
//                                  
//                                }
                              },
                              child: Text(
                                "Register",
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 20.0),
                              ),
                            )),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Container(
                            child: InkWell(
                          onTap: () {
                            Navigator.pop(context);
                          },
                          child: Text("Login",
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black)),
                        )),
                      )
                    ],
                  ),
                ),
              ),
            ),
          ),
          Visibility(
              visible: loading ?? true,
              child: Center(
                child: Container(
                  alignment: Alignment.center,
                  child: CircularProgressIndicator(
                    valueColor: AlwaysStoppedAnimation<Color>(Colors.green),
                  ),
                ),
              )),
        ],
      ),
    );
  }

  valueChange(e) {
    setState(() {
      if (e == "Male") {
        groupValue = e;
        gender = e;
      } else if (e == "Female") {
        groupValue = e;
        gender = e;
      } else {
        groupValue = e;
        gender = e;
      }
    });
    debugPrint(groupValue);
  }

  void _toggle() {
    setState(() {
      hideP1 = !hideP1;
    });
  }

  void _toggle2() {
    setState(() {
      hideP2=!hideP2;
    });
  }

  Future validateForm() async{
    FormState formstate=_formKey.currentState;
    if(formstate.validate()){

      FirebaseUser user=await firebaseAuth.currentUser();

      if(user==null){
        await firebaseAuth.createUserWithEmailAndPassword(
            email: _emailTextController.text,
            password: _passwordTextController.text).then(
                (user) =>{
                  _userServices.createUser(

                    {
                      "username": user.user.displayName,
                      "email": user.user.email,
                      "userId":user.user.uid,
                      "gender":gender
                    }
                  )
                }).catchError((error)=>{
                  print(error.toString())
        });
        Navigator.pushReplacement(context, MaterialPageRoute(builder: (context){
          return HomeScreen();
        }));

      }



    }

  }




}

