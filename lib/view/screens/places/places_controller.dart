import 'package:customer_app/view/screens/places/places_service.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../constant/status_request.dart';
import '../../../general_controllers/statuse_request_controller.dart';
import '../../../main.dart';
import '../../widget/snak_bar_for_errors.dart';

class PlacesController extends GetxController
    implements StatuseRequestController {
  late String reservationId;
  // late String email;
  late int? section;
  @override
  StatuseRequest? statuseRequest = StatuseRequest.init;

  PlaceService service = PlaceService();
  late GlobalKey<FormState> formstate;

  @override
  void onInit() async {
    reservationId = '36';
    section = null;
    formstate = GlobalKey<FormState>();
    //statuseRequest = await checkIfTheInternetIsConectedBeforGoingToThePage();
    super.onInit();
  }

  void onpressDone() async {
    statuseRequest = StatuseRequest.loading;
    update();
    dynamic response =
        await sendData(); // check if the return data is statuseRequest or real data
    statuseRequest = handlingData(response); //return the statuseResponse
    if (statuseRequest == StatuseRequest.success) {
      whenLoginSuccess(response);
    } else if (statuseRequest == StatuseRequest.authfailuer) {
      snackBarForErrors("Auth error", "Please login again");
      Get.offAllNamed('LoginPage');
    } else {}
    update();
  }

  sendData() async {
    String token = await prefService.readString('token');

    Map<String, String> data = {
      "reservation_id": reservationId,
      "section_number": section.toString()
    };
    Either<StatuseRequest, Map<dynamic, dynamic>> response =
        await service.setSection(token, data);

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
    update();
  }
}
