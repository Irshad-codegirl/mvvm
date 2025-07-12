import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mvvm/resources/component/colors.dart';
import 'package:mvvm/resources/component/round_button.dart';
import 'package:mvvm/utilis/routes_name.dart';
import 'package:mvvm/utilis/utils.dart';
import 'package:mvvm/view_model/auth_view_model.dart';
import 'package:provider/provider.dart';

class Signupview extends StatefulWidget {
  const Signupview({super.key});

  @override
  State<Signupview> createState() => _SignupviewState();
}

class _SignupviewState extends State<Signupview> {
  ValueNotifier<bool> obsecurepassword = ValueNotifier<bool>(true);
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  FocusNode emailFocusNode = FocusNode();
  FocusNode passwordFocusNode = FocusNode();

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    emailController.dispose();
    passwordController.dispose();
    emailFocusNode.dispose();
    passwordFocusNode.dispose();
    obsecurepassword.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final authViewModel = Provider.of<AuthViewModel>(context);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.btnColor,
        centerTitle: true,
        title: Text('Sign Up', style: TextStyle(color: Colors.white)),
      ),
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 20.0, vertical: 20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              TextFormField(
                controller: emailController,
                focusNode: emailFocusNode,
                keyboardType: TextInputType.emailAddress,
                style: TextStyle(color: Colors.black),
                decoration: InputDecoration(
                  hintText: 'Email',

                  hintStyle: TextStyle(color: Colors.black),
                  prefixIcon: Icon(Icons.alternate_email),
                ),
                onFieldSubmitted: (value) {
                  Utils.fieldFocusChange(
                    context,
                    emailFocusNode,
                    passwordFocusNode,
                  );
                },
              ),
              SizedBox(height: 30.h),
              ValueListenableBuilder(
                valueListenable: obsecurepassword,
                builder: (context, value, child) {
                  return TextFormField(
                    obscureText: obsecurepassword.value,
                    obscuringCharacter: '*',
                    controller: passwordController,
                    focusNode: passwordFocusNode,
                    style: TextStyle(color: Colors.black),
                    decoration: InputDecoration(
                      hintText: 'Password',
                      hintStyle: TextStyle(color: Colors.black),
                      prefixIcon: Icon(Icons.lock_outlined),
                      suffixIcon: InkWell(
                        onTap: () {
                          obsecurepassword.value = !obsecurepassword.value;
                        },
                        child: obsecurepassword.value
                            ? Icon(Icons.visibility_off)
                            : Icon(Icons.visibility),
                      ),
                    ),
                  );
                },
              ),
              SizedBox(height: 30.h),
              RoundButton(
                title: 'Sign Up',
                loading: authViewModel.signUploading,
                onpress: () {
                  if (emailController.text.isEmpty) {
                    Utils.flushBarErrorMessage('Please enter email', context);
                  } else if (passwordController.text.isEmpty) {
                    Utils.flushBarErrorMessage(
                      'Please enter password',
                      context,
                    );
                  } else if (passwordController.text.length < 6) {
                    Utils.flushBarErrorMessage(
                      'Please enter 6 digit password',
                      context,
                    );
                  } else {
                    Map data = {
                      'email': emailController.text.toString(),
                      'password': passwordController.text.toString(),
                    };
                    authViewModel.signUpApi(data, context);
                    print('Api hit');
                  }
                },
              ),
              SizedBox(height: 30.h),
              InkWell(
                onTap: () {
                  Navigator.pushNamed(context, RoutesName.login);
                },
                child: Text(
                  "Already have an account? Login",
                  style: TextStyle(color: Colors.black),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
