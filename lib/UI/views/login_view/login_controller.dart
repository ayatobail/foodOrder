/*Malek Alzein, [6/11/2023 6:49 PM]
import 'package:flutter/material.dart';
import 'package:food_order/UI/shared/custom_widgets/custom_toast.dart';
import 'package:food_order/core/data/repositories/shared_preference_repositories.dart';
import 'package:food_ordering_sp2/core/data/repositories/shared_prefreance_repository.dart';
import 'package:food_ordering_sp2/core/data/repositories/user_repository.dart';
import 'package:food_ordering_sp2/core/enums/message_type.dart';
import 'package:food_ordering_sp2/ui/shared/custom_widgets/custom_toast.dart';
import 'package:food_ordering_sp2/ui/views/main_view/main_view.dart';
import 'package:get/get.dart';

import '../../../core/data/repositories/user_repository.dart';
import '../../../core/enums/message_type.dart';
import '../main_view/main_view.dart';

class LoginController extends GetxController {
  TextEditingController emailController =
  TextEditingController(text: 'Test@gmail.com');
  TextEditingController passwordController =
  TextEditingController(text: 'Test@1234');

  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  RxBool isLoading = false.obs;

  void login() {
    if (formKey.currentState!.validate()) {
      isLoading.value = true;
      UserRepository()
          .login(email: emailController.text, password: passwordController.text)
          .then((value) {
        value.fold((l) {
          isLoading.value = false;
          customToast.showMessage(
              message: l, messageType: MessageType.REJECTED);
        }, (r) {
          sharedPreferenceRepository.setLoggedIn(true);
          sharedPreferenceRepository.setTokenInfo(r);
          Get.off(MainView());
        });
      });
    } else {}
  }
}

*/