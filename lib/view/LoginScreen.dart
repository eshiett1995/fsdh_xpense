import 'package:flutter/material.dart';
import 'package:fsdh_xpense/components/CustomButton.dart';
import 'package:fsdh_xpense/components/CustomTextField.dart';
import 'package:fsdh_xpense/utilities/Constants.dart';
import 'package:fsdh_xpense/view/HomeScreen.dart';

import 'SignUpScreen.dart';

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  TextEditingController emailController = new TextEditingController();
  TextEditingController passwordController = new TextEditingController();
  bool isLoading = false;
  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Constants.primaryColor,
      appBar: AppBar(automaticallyImplyLeading: false, backgroundColor: Colors.transparent, elevation: 0,),
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 22),
          child: Form(
            key: _formKey,
            child: Column(
              children: [
                Align(
                  alignment: Alignment.centerLeft,
                    child: Text("Welcome Back", style: TextStyle(color: Constants.whiteColor, fontSize: 30, fontWeight: FontWeight.bold),)),
                SizedBox(height: 10,),
                Align(
                  alignment: Alignment.centerLeft,
                    child: Text("Lets sign you in", style: TextStyle(color: Constants.whiteColor, fontSize: 15, fontWeight: FontWeight.w600),)),
                SizedBox(height: 40,),
                CustomTextField(label: "Username or Email", controller: this.emailController, ),
                SizedBox(height: 20,),
                CustomTextField(label: "Password", controller: this.passwordController),
                SizedBox(height: 40,),
                CustomButton(
                  data : "Login",
                  color: Constants.secondaryColor,
                  textColor :Constants.whiteColor,
                  isLoading: this.isLoading,
                  onPressed: () async{
                    try{
                      setState(() => this.isLoading = true);
                      if(_formKey.currentState.validate()) {
                        Future.delayed(const Duration(milliseconds: 2500), () {
                          setState(() =>this.isLoading = false);
                          Navigator.of(context).push(MaterialPageRoute(builder: (context) => HomeScreen()));
                        });
                      }
                    }catch(e){}
                  }, ),
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
                            "Not a member ?",
                            style: TextStyle(color: Constants.whiteColor, fontSize: 15, fontWeight: FontWeight.w600),
                          ),
                          SizedBox(width: 5,),
                          GestureDetector(
                            onTap: (){
                              Navigator.of(context).push(MaterialPageRoute(builder: (context) => SignUpScreen()));
                            },
                            child: Text(
                              "Create account",
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
  void loginHandler(){}
}
