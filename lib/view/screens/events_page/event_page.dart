import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../widget/new_event_card.dart';
import 'event_controller.dart';

Widget buildEventGridView() {
  EventController controller=Get.put(EventController());
  return GetBuilder<EventController>(
    builder: (context) {
      return ListView.builder(
        itemCount:controller.finalListData.length,
        itemBuilder: (context, index) {
          return NewEventCard(event: controller.finalListData[index]);
        },
      );
    }
  );
}
