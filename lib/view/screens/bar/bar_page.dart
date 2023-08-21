import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sized_context/sized_context.dart';
import '../../../constant/sizes.dart';
import '../../../constant/theme.dart';
import '../../../main.dart';
import '../../widget/animation_title.dart';
import '../../widget/bottom_nav_bar.dart';
import '../../widget/drawer.dart';
import '../../widget/drink_card.dart';
import '../../widget/general_text_style.dart';
import '../events_page/event_page.dart';
import '../places/places_controller.dart';
import '../places/places_page.dart';
import 'bar_page_controller.dart';

class BarPage extends StatelessWidget {
  final DrinkCardController drinkCardContrller = Get.put(DrinkCardController());
  BarPage({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    Sizes size = Sizes(context);
    BarPageController controller = Get.find();
    return Scaffold(
      floatingActionButton: Obx(() => SizedBox(
            height: 100,
            child: AnimatedAlign(
              duration: const Duration(milliseconds: 500),
              alignment: controller.page.value == 2
                  ? sharedPreferences!.getString('lang') == 'en'
                      ? Alignment.topRight
                      : sharedPreferences!.getString('lang') == 'ar'
                          ? Alignment.topLeft
                          : Alignment.topRight
                  : sharedPreferences!.getString('lang') == 'en'
                      ? Alignment.bottomRight
                      : sharedPreferences!.getString('lang') == 'ar'
                          ? Alignment.bottomLeft
                          : Alignment.bottomRight,
              child: Obx(() => Visibility(
                    visible: controller.page.value != 0,
                    child: FloatingActionButton.extended(
                        onPressed: () {
                          onpressedDone(controller.page.value,
                              drinkCardContrller, controller);
                        },
                        label: Text('Done'.tr, style: generalTextStyle(null))),
                  )),
            ),
          )),
      extendBody: true,
      appBar: createAppBar(size, controller.page, controller),
      drawer: ProjectDrawer(),
      body: Builder(
        builder: (context) {
          return SafeArea(
            child: Stack(
              children: [
                Container(
                  color: Get.isDarkMode ? darkPrimaryColor : primaryColor,
                ),
                Container(
                  margin: const EdgeInsets.only(top: 30),
                  decoration: BoxDecoration(
                    color: Get.isDarkMode ? backGroundDarkColor : skinColorWhite,
                    borderRadius: const BorderRadius.only(
                      topLeft: Radius.circular(15),
                      topRight: Radius.circular(15),
                    ),
                  ),
                ),
                Obx(() {
                  return Positioned.fill(
                    child: TabBarView(
                      controller: controller.tabControllerBottomNavBar,
                      children: selectPage(controller, context, drinkCardContrller),
                    ),
                  );
                }),
              ],
            ),
          );
        }
      ),
      bottomNavigationBar: const BottomNavBar(),
    );
  }

  List<Widget> selectPage(BarPageController controller, BuildContext context,
      DrinkCardController drinkCardContrller) {
    List<Widget> list = [
      buildEventGridView(),
      controller.isReservationConfirmed
          ? places(controller)
          : buildEmptyListWithMessage('enter to the house'),
      controller.isPlaceSet
          ? buildBarGridView(Colors.blue, context, drinkCardContrller)
          : buildEmptyListWithMessage('set your place first'),
    ];
    return ([list[controller.page.value]]);
  }

  Widget buildEmptyListWithMessage(String message) {
    return Center(
      child: Text(message.tr, style: generalTextStyle(30)),
    );
  }

  Widget buildBarGridView(Color? color, BuildContext ccontext,
      DrinkCardController drinkCardContrller) {
    return GetBuilder(
        init: drinkCardContrller,
        builder: (context) {
          return GridView.builder(
            padding: const EdgeInsets.all(16),
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: ccontext.widthInches > 8.5
                  ? 4
                  : ccontext.widthInches > 5.5
                      ? 3
                      : 2,
              mainAxisExtent: 230,
              crossAxisSpacing: 10,
              mainAxisSpacing: 16,
            ),
            itemCount: drinkCardContrller.finalListData.length,
            itemBuilder: (context, index) {
              return DrinkCard(
                id: index,
                drink: drinkCardContrller.finalListData[index],
              );
            },
          );
        });
  }

  PreferredSizeWidget? createAppBar(
      Sizes size, RxInt pageNumber, BarPageController controller) {
    return PreferredSize(
      preferredSize: const Size.fromHeight(kToolbarHeight *
          1.5), //there is a problem here that I can't rebuild the size of the appbar.
      child: Obx(() => AppBar(
            iconTheme: IconThemeData(
                color: Get.isDarkMode ? skinColorWhite : backGroundDarkColor),
            bottom: pageNumber.value == 1
                ? TabBar(
                    indicatorColor:
                        Get.isDarkMode ? primaryColor : darkPrimaryColor,
                    controller: controller.tabControllerAppbarBottom,
                    tabs: [
                        Tab(
                          text: 'Section one'.tr,
                        ),
                        Tab(text: 'Section two'.tr),
                      ])
                : null,
            elevation: 0.4,
            backgroundColor: Get.isDarkMode ? darkPrimaryColor : primaryColor,
            title: AnimationAppBarTitle(title: 'Customer app'.tr),
            actions: [
              Visibility(
                visible: controller.page.value == 2,
                child: IconButton(
                  icon: Icon(
                    Icons.search,
                    color:
                        Get.isDarkMode ? skinColorWhite : backGroundDarkColor,
                    size: size.appBarIconSize,
                  ),
                  onPressed: () {
                    Get.toNamed('/SearchPage');
                  },
                ),
              ),
            ],
          )),
    );
  }

  void onpressedDone(int index, DrinkCardController drinkCardController,
      BarPageController barPageController) {
    if (index == 2 && barPageController.isPlaceSet) {
      Get.toNamed('/Cart', arguments: drinkCardController.order);
    } else if (index == 1 && barPageController.isReservationConfirmed) {
      PlacesController controller = Get.find();
      controller.onpressDone();
    }
  }
}
/*
        : null;*/