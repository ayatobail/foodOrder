import 'package:bot_toast/bot_toast.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:food_order/UI/shared/custom_widgets/custom_textField.dart';
import 'package:food_order/UI/shared/custom_widgets/custom_toast.dart';
import 'package:food_order/UI/views/main_view/main_view.dart';
import 'package:food_order/core/data/repositories/shared_preference_repositories.dart';

import '../../../core/data/repositories/user_repository.dart';
import '../../../core/enums/message_type.dart';
import '../../shared/colors.dart';
import '../../shared/custom_widgets/custom_button.dart';
import '../../shared/utilis.dart';

class LoginView extends StatefulWidget {
  LoginView({Key? key}) : super(key: key);

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  TextEditingController emailController =
  TextEditingController(text: 'Test@gmail.com');
  TextEditingController passwordController =
  TextEditingController(text: 'Test@1234');

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  bool isLoading = false;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Form(
            key: _formKey,
            child: Column(
              children: [
                SizedBox(
                  height: size.width * 0.25,
                ),
                Text(
                  'Login',
                  style: TextStyle(
                      fontSize: size.width * 0.07,
                      fontWeight: FontWeight.bold,
                      color: AppColors.mainBlackColor),
                ),
                Padding(
                  padding: EdgeInsets.only(
                      top: size.width * 0.01, bottom: size.width * 0.1),
                  child: Text(
                    'Add your details to login',
                    style: TextStyle(
                        fontSize: size.width * 0.04,
                        fontWeight: FontWeight.normal,
                        color: AppColors.mainTextColor),
                  ),
                ),
                customTextField(
                  hintTExt: 'Your Email',
                  controller: emailController,
                  validator: (value) {
                    if (value!.isEmpty || !isEmail(value)) {
                      return 'please check your email';
                    }
                  },
                ),
                customTextField(
                  hintTExt: 'password',
                  controller: passwordController,
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'please enter your password';
                    }
                  },
                ),
                isLoading
                    ? SpinKitCircle(
                  color: AppColors.mainOrangeColor,
                )
                    : customButton(
                    text: 'Login',
                    onPressed: () {
                      setState(() {
                        isLoading = true;
                      });

                      UserRepository()
                          .login(
                          email: emailController.text,
                          password: passwordController.text)
                          .then((value) {
                        value.fold((l) {
                          setState(() {
                            isLoading = false;
                          });
                          customToast.showMessage(
                              context: context,
                              message: l,
                              messageType: MessageType.REJECTED);
                        }, (r) {
                          sharedPreferenceRepository.setLoggedIn(true);
                          sharedPreferenceRepository.setTokenInfo(r);

                          Navigator.pushReplacement(context,
                              MaterialPageRoute(
                                builder: (context) {
                                  return MainView();
                                },
                              ));
                        });
                      });

                    }),
                Padding(
                  padding: EdgeInsets.only(
                      top: size.width * 0.06, bottom: size.width * 0.1),
                  child: Text(
                    'Forget password',
                    style: TextStyle(
                        fontSize: size.width * 0.04,
                        fontWeight: FontWeight.normal,
                        color: AppColors.mainTextColor),
                  ),
                ),
                Text(
                  'or Login With',
                  style: TextStyle(
                      fontSize: size.width * 0.04,
                      fontWeight: FontWeight.normal,
                      color: AppColors.mainTextColor),
                ),
                Padding(
                  padding: EdgeInsets.only(
                      top: size.width * 0.06, bottom: size.width * 0.06),
                  child: customButton(
                    text: 'Login with Facebook',
                    primary: AppColors.mainBlueColor,
                    svgName: 'Facebook',
                  ),
                ),
                customButton(
                  text: 'Login with Google',
                  primary: AppColors.mainRedColor,
                  svgName: 'google-plus-logo',
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
