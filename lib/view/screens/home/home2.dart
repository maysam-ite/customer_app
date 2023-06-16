import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:customer_app/view/widget/general_text_style.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'controlle.dart';
import 'curved.dart';

Widget Home2() {
  return Center(
    child: Container(
      height: 250,
      width: 320,
      decoration: BoxDecoration(
          color: Colors.red,
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(20), topRight: Radius.circular(20))),
      // color: Colors.yellow,
      child: Column(
        children: [
          Container(
            width: 320,
            height: 150,
            decoration: BoxDecoration(
                image: DecorationImage(
                    image: AssetImage('assets/images/event_image.jpg')),
                color: Colors.red,
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(20),
                    topRight: Radius.circular(20),),),
            child: const Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [Text("first"), Text("second")],
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                children: [Text("2018"), Text("babtoma")],
              ),
              Text("7:00")
            ],
          )
        ],
      ),
    ),
  );
}
// class Home2 extends StatelessWidget {
// G controller=Get.find();
//   int index=2;
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Page 2'),
//       ),
//       body: Center(
//         child: Text('Page 2'),
//       ),
//   //    bottomNavigationBar: Obx(()=>c()),
//     );
//   }
// }
