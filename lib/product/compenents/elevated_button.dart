import 'package:covid_onboarding/feature/onboard/view/home_screen.dart';
import 'package:covid_onboarding/feature/onboard/view/register_view.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import 'app_string.dart';
import 'colors.dart';

class CustomElavated extends StatelessWidget {
  String? baslik;
  CustomElavated({
    required this.baslik,
    Key? key,
    required GlobalKey<FormState> formKey,
    required this.context,
  })  : _formKey = formKey,
        super(key: key);

  final GlobalKey<FormState> _formKey;
  final BuildContext context;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
        style: ElevatedButton.styleFrom(
          primary: ConstColors.buttonColor,
        ),
        onPressed: () async {
          try {
            await auth.signInWithEmailAndPassword(
                email: email, password: password);
            ScaffoldMessenger.of(context).showSnackBar(SnackBar(
              content: Text('Sucessfully Login'),
            ));
            Navigator.of(context)
                .push(MaterialPageRoute(builder: (context) => HomeScreen()));
          } on FirebaseAuthException catch (e) {
            showDialog(
                context: context,
                builder: (ctx) => AlertDialog(
                    title: Text(' Ops! Login Failed'),
                    content: Text('${e.message}')));
          }
          ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(content: Text(AppString().talepAlindi ?? '')));
        },
        child: Text(
          baslik ?? '',
          style: const TextStyle(
              color: Colors.white, fontSize: 32, fontWeight: FontWeight.normal),
        ));
  }
}
