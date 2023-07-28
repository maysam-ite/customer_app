// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../constant/font.dart';
import '../../main.dart';
import 'general_text_style.dart';

class NewEventCard extends StatelessWidget {
  final Event event;
  const NewEventCard({super.key, required this.event});
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Get.toNamed('/EventInfo', arguments: event);
      },
      child: Container(
          height: Get.size.height * .12,
          width: Get.size.width * .95,
          decoration: BoxDecoration(
              border: Border.all(
                color: Colors.black54,
                width: 0.2,
              ),
              color: Get.isDarkMode
                  ? const Color.fromARGB(255, 54, 54, 54)
                  : Colors.grey[400],
              borderRadius: const BorderRadius.only(
                  topRight: Radius.circular(400),
                  bottomRight: Radius.circular(400))),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Visibility(
                visible: sharedPreferences!.getString('lang') != 'ar',
                replacement: eventImage(),
                child: dateBox(),
              ),
              Padding(
                padding: const EdgeInsets.only(right: 30),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(event.eventName, style: generalTextStyle(25)),
                    timeContainer(event.beginDate.time),
                  ],
                ),
              ),
              Visibility(
                visible: sharedPreferences!.getString('lang') != 'ar',
                replacement: dateBox(),
                child: eventImage(),
              ),
            ],
          )),
    );
  }

  Widget dateBox() {
    return Padding(
      padding: const EdgeInsets.all(5.0),
      child: dateContainer(event.beginDate.month.toUpperCase(),
          event.beginDate.dayNumber, event.beginDate.dayName.toUpperCase()),
    );
  }

  Widget eventImage() {
    return Padding(
      padding: const EdgeInsets.only(left: 15.6, top: 6, right: 6, bottom: 6),
      child: SizedBox(
        width: 100,
        height: 100,
        child: ClipRRect(
          borderRadius: BorderRadius.circular(900),
          child: Image.asset(
            event.imagesNames[1],
            fit: BoxFit.fill,
          ),
        ),
      ),
    );
  }

  Widget timeContainer(String time) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 5, vertical: 5),
      height: Get.size.height * .04,
      width: Get.size.width * .22,
      decoration: BoxDecoration(
          border: Border.all(
            color: Colors.black54,
            width: 0.2,
          ),
          color: const Color.fromARGB(255, 199, 214, 213),
          borderRadius: const BorderRadius.all(Radius.circular(100))),
      child: Center(
          child: Text(
        time,
        style: const TextStyle(color: Colors.black54),
      )),
    );
  }

  Widget dateContainer(String monthName, String dayNumber, String dayName) {
    return Center(
      child: Container(
        height: Get.size.height * .11,
        width: Get.size.height * .11,
        decoration: const BoxDecoration(
          color: Color.fromARGB(255, 184, 212, 210),
        ),
        child: Column(
          // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            // const Spacer(),
            Text(
              monthName,
              style:
                  TextStyle(color: Colors.black26, fontFamily: jostFontFamily),
            ),
            const SizedBox(
              height: 1,
            ),
            Text(dayNumber,
                style: TextStyle(fontSize: 31, fontFamily: jostFontFamily)),
            const SizedBox(
              height: 0,
            ),
            Text(dayName,
                style: TextStyle(
                    color: Colors.black26, fontFamily: jostFontFamily)),
            // const Spacer(),
          ],
        ),
      ),
    );
  }
}

class Event {
  final List<String> imagesNames;
  final String eventName;
  final List<String> artistsNames;
  final String description;
  final double ticketsPrice;
  final int availablePlaces;
  final Date beginDate;

  Event({
    required this.imagesNames,
    required this.eventName,
    required this.artistsNames,
    required this.description,
    required this.ticketsPrice,
    required this.availablePlaces,
    required this.beginDate,
  });
}

class Date {
  String dayName;
  String dayNumber;
  String month;
  String year;
  String time;
  Date({
    required this.dayName,
    required this.dayNumber,
    required this.month,
    required this.year,
    required this.time,
  });
}