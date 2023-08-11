import 'package:customer_app/constant/status_request.dart';
import 'package:customer_app/general_controllers/statuse_request_controller.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../widget/snak_bar_for_errors.dart';
import 'register_service.dart';

class RegisterController extends GetxController
    implements StatuseRequestController {
  late String password;
  late String email;
  late String firstName;
  late String lastName;
  late String confirmPassword;
  late String phoneNumber;
  @override
  StatuseRequest? statuseRequest = StatuseRequest.init;
  late RxBool passwordSecure = true.obs;
  late RxBool confirmPasswordSecure = true.obs;
  RegisterService service = RegisterService();
  GlobalKey<FormState> formstate = GlobalKey<FormState>();
  late RxString imagePath;
  @override
  void onInit() async {
    imagePath = ''.obs;
    confirmPassword = '';
    firstName = '';
    lastName = '';
    password = '';
    phoneNumber='';
    email = '';
    // statuseRequest = await checkIfTheInternetIsConectedBeforGoingToThePage();
    super.onInit();
  }

  void changePasswordSecure() {
    passwordSecure.value = !passwordSecure.value;
  }

  void changeConfirmPasswordSecure() {
    confirmPasswordSecure.value = !confirmPasswordSecure.value;
  }

  void onpresslogin() async {

    FormState? formdata = formstate.currentState;
    if (formdata!.validate()) {
      formdata.save();
      statuseRequest = StatuseRequest.loading;
      update();

      dynamic response = await signupdata(); // check if the return data is statuseRequest or real data
      statuseRequest = handlingData(response); //return the statuseResponse
      if (statuseRequest == StatuseRequest.success) {
          whenSignUpSuccess(response);
        
      } else if (statuseRequest == StatuseRequest.authfailuer) {
        snackBarForErrors("Auth Error", "Please try again");
      } else if (statuseRequest == StatuseRequest.validationfailuer) {
        snackBarForErrors("Your input isn't valid", "Please try again");
      } else {
        snackBarForErrors("Server Error", "Please try later");
      }
    }
    update();
  }

  signupdata() async {
    Map<String,String> data={
     "first_name":firstName,
     "last_name":lastName,
     "email":email,
     "password":password,
     "phone_number":phoneNumber
    };
    Either<StatuseRequest, Map<dynamic, dynamic>> response =
        await service.register(data,"");

    return response.fold((l) => l, (r) => r);
  }

  handlingData(response) {
    if (response is StatuseRequest) {
      return response;
    } else {
      return StatuseRequest.success;
    }
  }

  whenSignUpSuccess(response) async {
    Get.offNamed('/LoginPage');
   
  }
}
