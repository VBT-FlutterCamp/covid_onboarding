// ignore_for_file: prefer_const_constructors

import 'package:covid_onboarding/product/compenents/app_string.dart';
import 'package:covid_onboarding/product/compenents/register_button.dart';
import 'package:flutter/material.dart';
import 'package:kartal/kartal.dart';
import 'package:firebase_auth/firebase_auth.dart';

import '../../../product/compenents/colors.dart';
import '../../../product/compenents/consts.dart';
import '../../../product/compenents/elevated_button.dart';
import '../../../product/compenents/text_fields.dart';

final auth = FirebaseAuth.instance;
String email = '';
String password = '';

class RegisterView extends StatefulWidget {
  const RegisterView({Key? key}) : super(key: key);

  @override
  _RegisterViewState createState() => _RegisterViewState();
}

class _RegisterViewState extends State<RegisterView> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _mailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  bool isCheckBox = false;
  final FocusNode _emailNode = FocusNode();
  final FocusNode _passwordNode = FocusNode();
  bool isValidate = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        body: SingleChildScrollView(
          physics: NeverScrollableScrollPhysics(),
          child: Column(
            children: [
              Container(
                height: context.dynamicHeight(0.2),
                decoration: BoxDecoration(color: Colors.white),
              ),
              Container(
                height: context.dynamicHeight(0.17),
                padding: EdgeInsets.only(
                    left: context.dynamicWidth(Consts.paddingDynamic)),
                decoration: BoxDecoration(color: Colors.white),
                child: Column(
                  // ignore: prefer_const_literals_to_create_immutables
                  children: [
                    Align(
                        alignment: Alignment.topLeft,
                        child: Text(AppString.welcome,
                            style: TextStyle(
                                fontSize: 30,
                                fontWeight: FontWeight.normal,
                                color: ConstColors.firstText))),
                    Align(
                      alignment: Alignment.topLeft,
                      child: Text(
                        AppString.designRelish,
                        style: TextStyle(
                            fontSize: 56,
                            fontWeight: FontWeight.bold,
                            color: ConstColors.secondText),
                      ),
                    )
                  ],
                ),
              ),
              Container(
                  height: context.dynamicHeight(0.30),
                  decoration: BoxDecoration(color: Colors.white),
                  padding: EdgeInsets.only(
                      left: context.dynamicWidth(Consts.paddingDynamic),
                      right: context.dynamicWidth(Consts.paddingDynamic)),
                  child: Column(
                    children: [
                      Align(
                          alignment: Alignment.topLeft,
                          child: TextFields(
                              formKey: _formKey,
                              emailNode: _emailNode,
                              mailController: _mailController,
                              passwordNode: _passwordNode,
                              passwordController: _passwordController)),
                      Padding(padding: context.paddingLow),
                      Align(
                          alignment: Alignment.topRight,
                          child: Text(
                            AppString.forgetPass,
                            style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.normal,
                                color: ConstColors.email),
                          ))
                    ],
                  )),
              Padding(padding: context.paddingLow),
              Container(
                //height: context.dynamicHeight(0.31),
                decoration: BoxDecoration(color: Colors.brown),
                child: SizedBox(
                  height: context.dynamicHeight(0.1),
                  width: context.dynamicWidth(0.9),
                  child: GestureDetector(
                    onTap: () async {
                      try {
                        await auth.createUserWithEmailAndPassword(
                            email: email, password: password);
                        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                          content:
                              Text('Sucessfully Register.You Can Login Now'),
                        ));
                        Navigator.of(context).pop();
                      } on FirebaseAuthException catch (e) {
                        showDialog(
                            context: context,
                            builder: (ctx) => AlertDialog(
                                title: Text(' Ops! Registration Failed'),
                                content: Text('${e.message}')));
                      }
                      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                          content: Text(AppString().talepAlindi ?? '')));
                    },
                    child: RegisterButton(
                        baslik: AppString().registerText,
                        formKey: _formKey,
                        context: context),
                  ),
                ),
              ),
              SizedBox(height: context.dynamicHeight(0.16)),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                // ignore: prefer_const_literals_to_create_immutables
                children: [
                  Text(
                    AppString.createAccount,
                    style: TextStyle(
                        fontWeight: FontWeight.normal,
                        color: ConstColors.email),
                  ),
                  Text(AppString.create,
                      style: TextStyle(
                          color: ConstColors.secondText,
                          fontWeight: FontWeight.bold,
                          decoration: TextDecoration.underline))
                ],
              )
            ],
          ),
        ));
  }
}
