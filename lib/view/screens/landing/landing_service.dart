import '../../../constant/server_const.dart';
import '../../../data/checkInternet/check_internet.dart';
import 'package:http/http.dart' as http;

class LandingService {
  Future<bool> checkIfeventAlive(String token, Map<String, String> data) async {
    //Either for return two data type in the same time
    try {
      if (await checkInternet()) {
        print("start");
        Uri url = Uri.parse(ServerConstApis.chickEventIsIn);
        Map<String, String> headers = {
          // "Access-Control-Allow-Origin": "*",
          "x-access-token": token
        };

        http.Response response = await http.post(
          url,
          body: data,
          headers: headers,
        );
        print(response.body);
        if (response.statusCode == 200 || response.statusCode == 201) {
          return true;
        } else if (response.statusCode == 404) {
          return false;
        } else if (response.statusCode == 401) {
          return false;
        } else {
          return false;
        }
      } else {
        return false;
      }
    } catch (e) {
      return false;
    }
  }
}
