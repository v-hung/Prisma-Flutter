import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:mobile/models/User.dart';
import 'package:mobile/providers/user.provider.dart';
import 'package:mobile/screens/auth/signup/signup_screen.dart';
import 'package:mobile/utils/config.dart';
import 'package:mobile/widgets/already_have_an_account_check.dart';
import 'package:mobile/widgets/rounded_button.dart';
import 'package:mobile/widgets/rounded_input_field.dart';
import 'package:mobile/widgets/rounded_password_field.dart';
import 'package:mobile/utils/validatate.dart';

import 'background.dart';

class Body extends StatefulWidget {
  const Body({
    Key? key,
  }) : super(key: key);

  @override
  State<Body> createState() => _BodyState();
}

class _BodyState extends State<Body> {

  final _formKey = GlobalKey<FormState>();

  String email ='', password ='';

  @override
  Widget build(BuildContext context) {

    Size size = MediaQuery.of(context).size;
    final UserController? _user = Get.find();

    return SingleChildScrollView(
      child: Background(
        child: Form(
          key: _formKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'LOGIN',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: size.height * 0.03,),
              SvgPicture.asset(
                'icons/login.svg',
                height: size.height * 0.35,
              ),
              SizedBox(height: size.height * 0.03,),
              RoundedInputField(
                hintText: "Your Email",
                validator: (val) => !EmailValidator(val) ? 'Email format is not correct' : null,
                onChanged: (value) {
                  setState(() {
                    email = value;
                  });
                },
              ),
              RoundedPasswordField(
                hintText: "Password",
                validator: (val) => !PasswordValidator(val) ? 'Password format is not correct' : null,
                onChanged: (value) {
                  setState(() {
                    password = value;
                  });
                },
              ),
              RoundedButton(
                title: "LOGIN",
                press: () async {
                  // if (_formKey.currentState!.validate()) {
                  //   print('$email - $password');
                  // }
                  await _user?.login(email:email, password: password);
                },
              ),
              SizedBox(height: size.height * 0.03,),
              AlreadyHaveAnAccountCheck(
                login: true,
                press: () {
                  Get.to(SignupScreen());
                },
              ),
              // StreamBuilder<User?>(
              //   // initialData: 0,
              //   stream: _auth.user,
              //   builder: (context, snapshot) {
              //     return Text(snapshot.data?.username.toString() ?? 'null',);
              //   },
              // )
            ],
          ),
        ),
      ),
    );
  }
}

