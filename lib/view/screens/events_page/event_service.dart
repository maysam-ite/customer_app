import 'dart:convert';

import 'package:customer_app/view/screens/bar/bar_page_controller.dart';
import 'package:dartz/dartz.dart';
import 'package:get/get.dart';
import '../../../constant/server_const.dart';
import '../../../constant/status_request.dart';
import '../../../data/checkInternet/check_internet.dart';
import 'package:http/http.dart' as http;
import 'dart:async';

import '../../../main.dart';
import '../../widget/snak_bar_for_errors.dart';
import 'event_controller.dart';

class EventService {
  Future<bool> sse() async {
    BarPageController barPageController = Get.find();
    String customerId = barPageController.customer_id.toString();
    var _client = http.Client();
    var request = new http.Request("GET",
        Uri.parse('${ServerConstApis.baseAPI}sseForCustomers/$customerId'));
    request.headers["Cache-Control"] = "no-cache";
    request.headers["Accept"] = "text/event-stream";

    final response = await _client.send(request); // Await the response

    if (response.statusCode == 200) {
      await response.stream.listen((data) {
        String d = utf8.decode(data);
        d = d.trim();
        print("Received data: $d");
        print(d);
        if (d != 'data: init') {
          if (d == 'data: new Event') {
            print(d);
            EventController s = Get.find();
            s.finalListData = [];
            print(s.finalListData.length);
            s.sendingARequestAndHandlingData();

            snackBarForErrors("New Event added".tr, "Please take a look ".tr);
          } else if (d == 'data: event is ended') {
            barPageController.changePage(0);
            barPageController.isPlaceSet = false;
            barPageController.isReservationConfirmed = false;

            prefService.createString('reservationID', 0.toString());
            prefService.createString('isPlaceSet', false.toString());
            prefService.createString(
                'isReservationConfirmed', false.toString());
            snackBarForErrors(
                "Our event is ended".tr, "See you in anther events ".tr);
          } else {
            barPageController.isReservationConfirmed = true;
            prefService.createString('isReservationConfirmed', true.toString());
            String g = d.toString().substring(6);
            prefService.createString('reservationID', g);
            barPageController.update();
            snackBarForErrors(
                "Your attendance confirmed".tr, "Please take a look ".tr);
          }
        }
        // Here, you can parse the data as needed and handle the event
      }).asFuture(); // Await the stream subscription to complete
    } else {
      print("Received unexpected status code: ${response.statusCode}");
    }
    return true;
  }

  Future<Either<StatuseRequest, Map>> getEvents(String token) async {
    //Either for return two data type in the same time
    try {
      if (await checkInternet()) {
        print("start");
        Uri url = Uri.parse(ServerConstApis.showUpComing);
        Map<String, String> headers = {
          // "Access-Control-Allow-Origin": "*",
          "x-access-token": token
        };

        var response = await http.get(url, headers: headers);

        if (response.statusCode == 200 || response.statusCode == 201) {
          final responsebody = jsonDecode(response.body);

          return Right(responsebody);
        } else if (response.statusCode == 401) {
          return const Left(StatuseRequest.authfailuer);
        } else {
          return const Left(StatuseRequest.serverfailure);
        }
      } else {
        return const Left(StatuseRequest
            .offlinefailure); //left return the left data type =>StatuseRequest
      }
    } catch (e) {
      return const Left(StatuseRequest.offlinefailure);
    }
  }
}
