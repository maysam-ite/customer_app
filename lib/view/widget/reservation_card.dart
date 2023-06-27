import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../constant/theme.dart';
import 'general_text_style.dart';

class ReservationCard extends StatelessWidget {
  final Reservation reservation;
  const ReservationCard({super.key, required this.reservation});

  @override
  Widget build(BuildContext context) {
    final ReservationCardController controller = Get.put(
      ReservationCardController(),
      tag: reservation.hashCode.toString(),
    );

    return Column(
      children: [
        Container(
          padding: const EdgeInsets.only(right: 5, top: 2, bottom: 2),
          child: ListTile(
            leading: SizedBox(
              height: 40,
              width: 40,
              child: TextButton(
                onPressed: () {
                  controller.toggleTrueSign();
                },
                child: Obx(() => Container(
                    height: 30,
                    width: 30,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5),
                      border: Border.all(
                          color: Get.isDarkMode
                              ? Colors.grey[400]!
                              : const Color.fromARGB(255, 54, 54, 54)),
                    ),
                    child: controller.showTrueSign.value
                        ? Center(
                            child: Icon(Icons.check,
                                color: Get.isDarkMode
                                    ? darkPrimaryColor
                                    : primaryColor),
                          )
                        : null)),
              ),
            ),
            title: Text(
              "${'Name'.tr}: ${reservation.name}",
              style: generalTextStyle(null),
            ),
            subtitle: Text(
              "${'Number of people'.tr}: ${reservation.number}",
              style: generalTextStyle(null),
            ),
          ),
        ),
        const Divider(),
      ],
    );
  }
}

class ReservationCardController extends GetxController {
  RxBool showTrueSign = false.obs;

  void toggleTrueSign() {
    showTrueSign.toggle();
  }
}

class Reservation {
  String name;
  int number;
  int eventId;
  Reservation({
    required this.name,
    required this.number,
    required this.eventId,
  });
}
