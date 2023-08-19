import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../constant/font.dart';
import '../../../constant/sizes.dart';
import '../../../constant/theme.dart';
import '../../widget/event_card.dart';
import '../../widget/general_text_style.dart';
import '../make_reservation_dialog/make_reservation_dialog_view.dart';
import 'event_info_controller.dart';

// ignore: must_be_immutable
class EventInfo extends StatelessWidget {
  EventInfo({super.key});
  //final EventModel event = Get.arguments;
  final EventCardController controller = Get.find();
  final PageController pageController = PageController();
  EventInfoController dataController = Get.find();
  @override
  Widget build(BuildContext context) {
    Sizes size = Sizes(context);
    return GetBuilder<EventInfoController>(builder: (mcontext) {
      return Scaffold(
        body: SafeArea(child: cardBody(size)),
        floatingActionButton: FloatingActionButton.extended(
            onPressed: () {},
            label: TextButton(
                onPressed: () {
                  showMakeResrvationDialog(context);
                },
                child: Text('Make a reservation'.tr,
                    style: generalTextStyle(16)))),
      );
    });
  }

  Widget cardBody(Sizes size) {
    return SizedBox(
        width: double.infinity,
        height: double.infinity,
        child: SingleChildScrollView(
            child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            SizedBox(
              height: 250,
              child: GestureDetector(
                  onHorizontalDragEnd: (details) {
                    const velocityThreshold = 2.0;
                    if (details.velocity.pixelsPerSecond.dx.abs() >
                        velocityThreshold) {
                      final direction =
                          details.velocity.pixelsPerSecond.dx.isNegative
                              ? -1
                              : 1;
                      controller.onSlide(direction);
                    }
                  },
                  onTap: () {},
                  child: buildImagesList(size)),
            ),
            const SizedBox(height: 3),
            buildDots(),
            eventInfo(),
          ],
        )));
  }

  Widget eventInfo() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // const SizedBox(height: 5),
          const Divider(
            height: 10,
          ),
          Text(
            dataController.model.title,
            style: TextStyle(
                color: Get.isDarkMode ? skinColorWhite : backGroundDarkColor,
                fontSize: 23,
                fontFamily: jostFontFamily,
                fontWeight: FontWeight.bold),
          ),
          const Divider(
            height: 10,
          ),
          setEventINfo(
              'Artists: ${dataController.model.artist.map((artist) => artist.artistName).join(', ')}'),
          elementDivider(),
          const SizedBox(height: 3),
          setEventINfo(
            '${'Date: '.tr}${dataController.model.beginDate.day}/${dataController.model.beginDate.month}/${dataController.model.beginDate.year}',
          ),
          elementDivider(),
          const SizedBox(height: 3),
          setEventINfo(
            'Available Places: '.tr +
                dataController.model.availablePlaces.toString(),
          ),
          elementDivider(),
          const SizedBox(height: 3),
          setEventINfo(
            '${'Ticket Price: '.tr}${dataController.model.ticketPrice} ${'S.P'.tr}',
          ),
          elementDivider(),
          const SizedBox(height: 3),
          setEventINfo('Description: '.tr + dataController.model.description),
        ],
      ),
    );
  }

  Widget elementDivider() {
    return const Divider(endIndent: 200);
  }

  Widget buildImagesList(Sizes size) {
    return AnimatedBuilder(
      animation: pageController, //controller.pageController,
      builder: (context, child) {
        return PageView.builder(
          onPageChanged: controller.setPageIndex,
          controller: pageController, //controller.pageController,
          itemCount: dataController.model.images.length,
          itemBuilder: (context, index) {
            return ClipRRect(
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(size.buttonRadius),
                topRight: Radius.circular(size.buttonRadius),
              ),
              child: Image.network(
                dataController.model.images[index].picture,
                fit: BoxFit.fill,
              ),
            );
          },
        );
      },
    );
  }

  Widget buildDots() {
    return Obx(() {
      return Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: List.generate(
          dataController.model.images.length,
          (index) =>
              buildDot(index: index, currentIndex: controller.pageIndex.value),
        ),
      );
    });
  }

  Widget setEventINfo(String title) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 7),
      child: AutoSizeText(title, style: generalTextStyle(15)),
    );
  }

  Widget buildDot({required int index, required int currentIndex}) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 300),
      margin: const EdgeInsets.all(5),
      height: 6,
      width: index == currentIndex ? 20 : 6,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(5),
        color: index == currentIndex
            ? (Get.isDarkMode ? darkPrimaryColor : primaryColor)
            : const Color(0xFFD8D8D8),
      ),
    );
  }

  void showMakeResrvationDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return Dialog(
          clipBehavior: Clip.antiAlias,
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
          child: MakeReservation(),
        );
      },
    );
  }
}
