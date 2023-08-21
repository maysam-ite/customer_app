import 'package:get/get.dart';

import '../../../main.dart';

class OnBoardController extends GetxController {
  final List<Map<String, String>> pageDetails = [
    {
      "title": "welcome to our app",
      "image": "assets/images/medium page background image.jpg"
    },
    {
      "title": "manage all the house with this system",
      "image": "assets/images/medium page background image.jpg"
    },
    {
      "title": "other thing need to rewrite",
      "image": "assets/images/medium page background image.jpg"
    },
    {
      "title": "other thing need to rewrite",
      "image": "assets/images/medium page background image.jpg"
    },
  ];

  RxInt pageIndex = 1.obs;

  @override
  void onInit() {
    super.onInit();
  }

  void setPageIndex(int index) {
    pageIndex.value = index;
  }

  void onPress() async {
    try {
      if (await prefService.isContainKey('token')) {
        if(! await prefService.isContainKey('isReservationConfirmed')){
          prefService.createString('isPlaceSet',false.toString());
            prefService.createString('isReservationConfirmed',false.toString());
            
        }
          
        String isReservationConfirmed=await prefService.readString('isReservationConfirmed');
        String isPlaceSet= await prefService.readString('isPlaceSet');
        String customer_id=await prefService.readString('customer_id'); 
         Map<String,String > data = {
      "isPlaceSet" : isPlaceSet,
      "isReservationConfirmed" : isReservationConfirmed,
      "customer_id":customer_id
   };
        Get.offAllNamed('/Bar',parameters: data);
      } else {
        Get.offAllNamed('/LoginPage');
      }
    } catch (e) {
      prefService.remove('token');
    }
  }
}
