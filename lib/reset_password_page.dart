import 'package:flutter/material.dart';
import 'package:woddy_app/vehicle_input_page.dart';

import 'widget/text_field.dart';

class ResetPassword extends StatefulWidget {
  const ResetPassword({Key? key}) : super(key: key);

  @override
  _ResetPasswordState createState() => _ResetPasswordState();
}

class _ResetPasswordState extends State<ResetPassword> {
  var formKey = GlobalKey<FormState>();
  var email = TextEditingController();
  AutovalidateMode autoValidateMode = AutovalidateMode.disabled;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Form(
          key: formKey,
          autovalidateMode: autoValidateMode,
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: SingleChildScrollView(
              child: Column(
                children: [
                  LogoImage(),
                  Heading(label: 'Reset your password'),
                  TextFormWidget(
                    validator: (String? value) {
                      if (value!.isEmpty)
                        return "Email is required";
                      else
                        return null;
                    },
                    hint: 'Email address',
                    label: 'Email address',
                    controller: email,
                  ),
                  SizedBox(height:300.0),
                  AppButtonWidget(
                      onTap: () {
                        if (formKey.currentState!.validate()) {
                          print('validate');
                          Navigator.of(context).push(
                              MaterialPageRoute(builder: (context) => VehicleInput()));
                        } else {
                          setState(() {
                            autoValidateMode = AutovalidateMode.always;
                          });
                        }
                      },
                      label: 'Reset password'),

                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}