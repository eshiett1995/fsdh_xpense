import 'package:flutter/material.dart';
import 'package:fsdh_xpense/components/CustomButton.dart';
import 'package:fsdh_xpense/components/CustomTextField.dart';
import 'package:fsdh_xpense/utilities/Constants.dart';

import 'LoginScreen.dart';

class SignUpScreen extends StatefulWidget {
  @override
  _SignUpScreenState createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final _formKey = GlobalKey<FormState>();
  var firstnameController = TextEditingController();
  var lastnameController = TextEditingController();
  var emailController = TextEditingController();
  var passwordController = TextEditingController();
  var passwordConfirmationController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Constants.primaryColor,
      appBar: AppBar(automaticallyImplyLeading: false, backgroundColor: Colors.transparent, elevation: 0,),
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.only(left: 22, right: 22, bottom: 50),
          child: Form(
            key: _formKey,
            child: Column(
              children: [
                Align(
                    alignment: Alignment.centerLeft,
                    child: Text("Create Account", style: TextStyle(color: Constants.whiteColor, fontSize: 30, fontWeight: FontWeight.bold),)),
                SizedBox(height: 10,),
                Align(
                    alignment: Alignment.centerLeft,
                    child: Text("Fill the fields below to continue", style: TextStyle(color: Constants.whiteColor, fontSize: 15, fontWeight: FontWeight.w600),)),
                SizedBox(height: 40,),
                CustomTextField(label: "First name", controller: firstnameController, ),
                SizedBox(height: 20,),
                CustomTextField(label: "Last name", controller: lastnameController, ),
                SizedBox(height: 20,),
                CustomTextField(label: "Email Address", controller: emailController, ),
                SizedBox(height: 20,),
                CustomTextField(label: "Password", controller: passwordController, ),
                SizedBox(height: 20,),
                CustomTextField(label: "Password again", controller: passwordConfirmationController, ),
                SizedBox(height: 40,),
                CustomButton(
                  data : "Sign up",
                  color: Constants.secondaryColor,
                  textColor :Constants.whiteColor,
                  onPressed: (){
                  },
                ),
                SizedBox(height: 20,),
                Row(
                  children: [
                    Expanded(child: Divider(color: Constants.greyishBlueColor,)),
                    Container(
                        margin: EdgeInsets.symmetric(horizontal: 15),
                        child: Text("OR", style: TextStyle(color: Constants.whiteColor, fontSize: 15, fontWeight: FontWeight.w600),)),
                    Expanded(child: Divider(color: Constants.greyishBlueColor,)),
                  ],
                ),
                SizedBox(height: 20,),
                SizedBox(height: 20,),
                GestureDetector(
                  onTap: (){
                    //Navigator.of(context).push(MaterialPageRoute(builder: (context) => ResetPasswordScreen()));
                  },
                  child: Align(
                      alignment: Alignment.center,
                      child: Text(
                        "Forgot Password?",
                        style: TextStyle(color: Constants.whiteColor, fontSize: 15, fontWeight: FontWeight.w600),
                      )
                  ),
                ),
                SizedBox(height: 20,),
                GestureDetector(
                  onTap: (){},
                  child: Align(
                      alignment: Alignment.center,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            "Already a member ?",
                            style: TextStyle(color: Constants.whiteColor, fontSize: 15, fontWeight: FontWeight.w600),
                          ),
                          SizedBox(width: 5,),
                          GestureDetector(
                            onTap: (){
                              Navigator.of(context).push(MaterialPageRoute(builder: (context) => LoginScreen()));
                            },
                            child: Text(
                              "login",
                              style: TextStyle(color: Constants.secondaryColor, fontSize: 15, fontWeight: FontWeight.w600),
                            ),
                          ),
                        ],
                      )
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
