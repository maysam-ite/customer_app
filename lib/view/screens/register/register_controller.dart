import 'package:customer_app/constant/status_request.dart';
import 'package:customer_app/general_controllers/statuse_request_controller.dart';
import 'package:customer_app/main.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

import '../../../constant/theme.dart';
import '../../../data/Models/login_model.dart';
import 'register_service.dart';

class RegisterController extends GetxController
    implements StatuseRequestController {
  late String password;
  late String email;
  late String firstName;
  late String lastName;
  late String confirmPassword;

  @override
  StatuseRequest? statuseRequest = StatuseRequest.init;
  late RxBool passwordSecure = true.obs;
  late RxBool confirmPasswordSecure = true.obs;
  RegisterService service = RegisterService();
 GlobalKey<FormState> formstate=GlobalKey<FormState>();
late RxString imagePath;
  @override
  void onInit() async {
    imagePath=''.obs;
    confirmPassword = '';
    firstName='';
    lastName='';
    password = '';
    email = '';
    // statuseRequest = await checkIfTheInternetIsConectedBeforGoingToThePage();
    super.onInit();
  }
   Future pickimage() async {
    final myfile = await ImagePicker().pickImage(source: ImageSource.gallery);
    if (myfile != null) {
      imagePath.value = myfile.path;
    }
  }

  void changePasswordSecure() {
    passwordSecure.value = !passwordSecure.value;
  }
  void changeConfirmPasswordSecure() {
    confirmPasswordSecure.value = !confirmPasswordSecure.value;
  }

  void onpresslogin() async {
     print(confirmPassword);
      print(password);
    FormState? formdata = formstate.currentState;
    if (formdata!.validate()) {
      formdata.save();
   /*   statuseRequest = StatuseRequest.loading;
      update();
      LoginModel model = LoginModel(password: password, email: email);
      dynamic response = await logindata(
          model); // check if the return data is statuseRequest or real data
      statuseRequest = handlingData(response); //return the statuseResponse
      if (statuseRequest == StatuseRequest.success) {
        if (response['msg'] == "Logged in Successfully") {
          whenLoginSuccess(response);
        }
      } else if (statuseRequest == StatuseRequest.authfailuer) {
        snackBarForErrors();
      } else if (statuseRequest == StatuseRequest.validationfailuer) {
        snackBarForErrors();
      } else {
        snackBarForErrors();
      }*/
     
    }
    update();
  }

  SnackbarController snackBarForErrors() {
    return Get.snackbar(
        "Incorrect email or password".tr, ///// adding for translate  done
        "Try entering your data again".tr, //// adding for translate  done
        snackPosition: SnackPosition.TOP,
        colorText: Get.isDarkMode ? skinColorWhite : backGroundDarkColor,
        backgroundColor: Get.isDarkMode ? backGroundDarkColor : skinColorWhite,
        duration: const Duration(seconds: 5));
  }

  logindata(LoginModel model) async {
    Either<StatuseRequest, Map<dynamic, dynamic>> response =
        await service.register(model);

    return response.fold((l) => l, (r) => r);
  }

  handlingData(response) {
    if (response is StatuseRequest) {
      return response;
    } else {
      return StatuseRequest.success;
    }
  }

  whenLoginSuccess(response) async {
    Map<String, dynamic> data = response[
        'data']; // for getting a body of data from map and save a token in local dataBase
    await prefService.createString('token', response['token']); // storing token
    await prefService.createString('id', data['admin_id'].toString());
    Get.offNamed('/Home');
    update();
  }
}
