import 'package:flutter/material.dart';
import 'package:woody_app/demo/api_service.dart';
import 'package:woody_app/widget/app_button.dart';
import 'package:woody_app/widget/heading.dart';
import 'package:woody_app/widget/logo_image.dart';
import 'package:woody_app/widget/password_form_widget.dart';
import 'package:woody_app/widget/text_form_widget.dart';
import '../api_models/login_model.dart';
import 'const.dart';
import 'home_page.dart';

String?  token;

class LogIn extends StatefulWidget {
  // static final pageName='/login';
  const LogIn({Key? key}) : super(key: key);

  @override
  _LogInState createState() => _LogInState();
}

class _LogInState extends State<LogIn> {
  var email = TextEditingController();
  var password = TextEditingController();
  var formKey = GlobalKey<FormState>();
AutovalidateMode autoValidateMode = AutovalidateMode.disabled;
  
@override
  void initState() {
    super.initState();
    email.text = 'talha53@gmail.com';
    password.text = '12345678';

  }
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
                  Heading(label: 'Log in'),
                  TextFormWidget(
                    keyboard: TextInputType.emailAddress,
                    validator: (String? value) {
                      if (value!.isEmpty)
                        return "Invalid Email or password";
                      else
                        return null;
                    },
                    hint: 'Email address',
                    label: 'Email address',
                    controller: email,
                  ),
                  PasswordFormWidget(
                    passKeyboard: TextInputType.text,
                    hint: 'Password',
                    label: 'Password',
                    controller: password,
                    validator: (String? value) {
                      if (value!.isEmpty) {
                        return "Invalid Email or password";
                      } else {
                        return null;
                      }
                    },
                  ),
                  GestureDetector(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                            builder: (context) => HomePage()));
                      },
                      child: Text(
                        'Forgot Password?',
                        style: TextStyle(color: primaryColor.withOpacity(0.8)),
                      )),
                  SizedBox(height: 180),
                  AppButtonWidget(
                      onTap: () async {
                        if (formKey.currentState!.validate()) {
                          showDialog(
                              context: context,
                              builder: (ctx) {
                                return AlertDialog(
                                  content: Column(mainAxisSize:MainAxisSize.min,
                                    children: [

                                      SizedBox(
                                          height: 25,
                                          width: 25,
                                          child: CircularProgressIndicator()),
                                      Text("Logging In..."),
                                    ],
                                  ),
                                );
                              });
                            var token = await APIService().post(
                                context,
                                'auth/sign-in',
                                LoginModel(
                                    username: email.text,
                                    password: password.text)
                                    .toJson());

                            await APIService()
                                .setAccessToken(token['access_token']);
                            var person = await APIService().getOne(context, 'auth/profile');
                            await APIService().setPersonID(person['_id']);

                            Navigator.pop(context);
                            Navigator.pop(context);
                            Navigator.of(context).push(MaterialPageRoute(
                                builder: (context) => HomePage()));


                        } else {
                          setState(() {});
                        }
                      },
                      label: 'Sign in'),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
