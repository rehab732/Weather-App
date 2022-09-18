import 'package:flutter/material.dart';
import 'package:weather_news/pages/search.dart';

import '../sharedwidgets/mainbutton.dart';
import 'homepage.dart';

class login extends StatefulWidget {
  @override
  State<login> createState() => _loginState();
}

class _loginState extends State<login> {
  final _formkey = GlobalKey<FormState>();
  final emailcontroller = TextEditingController();
  final passcontroller = TextEditingController();
  final namecontroller = TextEditingController();
  final _emailFocusNode = FocusNode();
  final _passFocusNode = FocusNode();
  final _nameFocusNode = FocusNode();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 46.0, horizontal: 32.0),
        child: Form(
          key: _formkey,
          child: SingleChildScrollView(
            child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const SizedBox(
                    height: 90,
                  ),
                  const Center(
                    child: Text(
                      "Weather News ",
                      style: TextStyle(
                          color: Color(0xFFE80F88),
                          fontSize: 30,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  TextFormField(
                    keyboardType: TextInputType.text,
                    controller: namecontroller,
                    focusNode: _nameFocusNode,
                    onEditingComplete: () =>
                        FocusScope.of(context).requestFocus(_emailFocusNode),
                    textInputAction: TextInputAction.next,
                    validator: (value) =>
                        value!.isEmpty ? 'please enter your Name' : null,
                    decoration: const InputDecoration(
                      labelText: 'Name',
                      hintText: 'Enter Your Name',
                      suffix: Icon(Icons.person, color: Color(0xFFE80F88)),
                    ),
                  ),
                  const SizedBox(height: 30),
                  TextFormField(
                    keyboardType: TextInputType.emailAddress,
                    controller: emailcontroller,
                    focusNode: _emailFocusNode,
                    onEditingComplete: () =>
                        FocusScope.of(context).requestFocus(_passFocusNode),
                    textInputAction: TextInputAction.next,
                    validator: (value) =>
                        value!.isEmpty ? 'please enter your email' : null,
                    decoration: const InputDecoration(
                      labelText: 'Email',
                      hintText: 'Enter Your Email',
                      suffix:
                          Icon(Icons.email_outlined, color: Color(0xFFE80F88)),
                    ),
                  ),
                  const SizedBox(height: 30),
                  TextFormField(
                    keyboardType: TextInputType.visiblePassword,
                    controller: passcontroller,
                    focusNode: _passFocusNode,
                    //onChanged: model.updatepassword,
                    validator: (value) =>
                        value!.isEmpty ? 'please enter your password' : null,
                    decoration: const InputDecoration(
                      labelText: 'Password',
                      hintText: 'Enter Your Password',
                      suffix: Icon(Icons.lock_clock_outlined,
                          color: Color(0xFFE80F88)),
                    ),
                  ),
                  const SizedBox(
                    height: 50,
                  ),
                  MainButton(
                      text: 'Login',
                      ontap: () {
                        if (_formkey.currentState!.validate()) {
                          Navigator.push(context,MaterialPageRoute(
                  builder: (context){
                    return Home();
                  }
                  ));
                        }
                      }),
                ]),
          ),
        ),
      ),
    );
  }
}
