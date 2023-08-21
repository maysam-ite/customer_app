import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../constant/status_request.dart';
import '../../../general_controllers/statuse_request_controller.dart';
import '../../../main.dart';
import '../../widget/snak_bar_for_errors.dart';
import '../event_info/event_info_controller.dart';
import 'make_reservation_service.dart';

class MakeReservationController extends GetxController
 implements StatuseRequestController {
  late String numberOfPlaces;
  // late String email;
  @override
  StatuseRequest? statuseRequest = StatuseRequest.init;

  MakeReservationService service = MakeReservationService();
  late GlobalKey<FormState> formstate;

  @override
  void onInit() async {
 numberOfPlaces='';
    formstate = GlobalKey<FormState>();
    //statuseRequest = await checkIfTheInternetIsConectedBeforGoingToThePage();
    super.onInit();
  }

  void onpressDone() async {
    FormState? formdata = formstate.currentState;
    if (formdata!.validate()) {
      formdata.save();
      statuseRequest = StatuseRequest.loading;
      update();
      dynamic response =
          await sendData(); // check if the return data is statuseRequest or real data
      statuseRequest = handlingData(response); //return the statuseResponse
      if (statuseRequest == StatuseRequest.success) {
        whenLoginSuccess(response);
      } else if (statuseRequest == StatuseRequest.validationfailuer){
        snackBarForErrors("There is no enough places".tr, "Please decrease your seats number".tr);
      
      }
       else if (statuseRequest == StatuseRequest.authfailuer) {
      snackBarForErrors("Auth error".tr, "Please login again".tr);
      Get.offAllNamed('LoginPage');
    } else {
        
      }
    }
    update();
  }

 

  sendData() async {
    EventInfoController eventInfoController=Get.find();
    int eventId=eventInfoController.eventId;
     String token = await prefService.readString('token');
   
    Map<String, String> data = {
    "event_id": eventId.toString(),
    "number_of_places": numberOfPlaces
};
    Either<StatuseRequest, Map<dynamic, dynamic>> response =
        await service.makeReservation(token ,data);

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
    EventInfoController eventInfoController=Get.find();
    eventInfoController.model.availablePlaces-=int.parse( numberOfPlaces);
    eventInfoController.update();
    Get.back();
    update();
  }}