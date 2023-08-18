import 'package:customer_app/view/screens/events_page/event_controller.dart';
import 'package:customer_app/view/widget/new_event_card.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

Widget buildEventGridView() {
  EventController controller = Get.put(EventController());
  return ListView.builder(
      itemCount: controller.finalListData.length,
      itemBuilder: (context, index) {
        return Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 15),
          child: NewEventCard(event: controller.finalListData[index]),
        );
      });
}
