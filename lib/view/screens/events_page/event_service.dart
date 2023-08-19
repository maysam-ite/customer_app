import 'dart:convert';

import 'package:dartz/dartz.dart';
import '../../../constant/server_const.dart';
import '../../../constant/status_request.dart';
import '../../../data/checkInternet/check_internet.dart';
import 'package:http/http.dart' as http;
// import 'package:sse/client/sse_client.dart';
// import 'package:sse/server/sse_handler.dart';


import 'dart:async';

// import 'package:meta/meta.dart';
// import 'package:universal_html/html.dart' as html;

// class Sse {
//   final html.EventSource eventSource;
//   final StreamController<String> streamController;

//   Sse._internal(this.eventSource, this.streamController);

//   factory Sse.connect({
//     required Uri uri,
//     bool withCredentials = false,
//     bool closeOnError = true,
//   }) {
//     final streamController = StreamController<String>();
//     final eventSource = html.EventSource(uri.toString(), withCredentials: withCredentials);

//     eventSource.addEventListener('message', (html.Event message) {
//       streamController.add((message as html.MessageEvent).data as String);
//     });

//     ///close if the endpoint is not working
//     if (closeOnError) {
//       eventSource.onError.listen((event) {
//         eventSource?.close();
//         streamController?.close();
//       });
//     }
//     return Sse._internal(eventSource, streamController);
//   }

//   Stream get stream => streamController.stream;

//   bool isClosed() => this.streamController == null || this.streamController.isClosed;

//   void close() {
//     this.eventSource?.close();
//     this.streamController?.close();
//   }
// // }
// import 'package:sse_client/sse_client.dart';
class EventService {
// test()async{
//  final stream= Sse.connect(
//       uri: Uri.parse('http://localhost:8080/elastic/services/ws/subscribe/<clientId>'),
//       closeOnError: true,
//       withCredentials: false,
//     ).stream;

//     stream.listen((event) {
//       print('Received:' + DateTime.now().millisecondsSinceEpoch.toString() + ' : ' + event.toString());
//     });
// }

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
        print(response.body);
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
