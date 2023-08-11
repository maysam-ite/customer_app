import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../widget/event_card.dart';
import 'event_controller.dart';

final List<EventCard> events = [
  EventCard(
    event: Event(
      artistsNames: ['artist one', 'artist two', 'artist three'],
      availablePlaces: 80,
      beginDate: 'sometime',
      description: 'very good',
      eventName: 'Event one',
      imagesNames: [
        'assets/images/concert.png',
        'assets/images/medium page background image.jpg',
        'assets/images/tickets.png'
      ],
      ticketsPrice: 50,
    ),
  ),
  EventCard(
    event: Event(
      artistsNames: ['artist one', 'artist two', 'artist three'],
      availablePlaces: 80,
      beginDate: 'sometime',
      description: 'very good',
      eventName: 'Event two',
      imagesNames: [
        'assets/images/concert.png',
        'assets/images/medium page background image.jpg',
        'assets/images/tickets.png'
      ],
      ticketsPrice: 50,
    ),
  ),
  EventCard(
      event: Event(
    artistsNames: ['artist one', 'artist two', 'artist three'],
    availablePlaces: 80,
    beginDate: 'sometime',
    description: 'very good',
    eventName: 'Event three',
    imagesNames: [
      'assets/images/concert.png',
      'assets/images/medium page background image.jpg',
      'assets/images/tickets.png'
    ],
    ticketsPrice: 50,
  )),
  EventCard(
      event: Event(
    artistsNames: ['artist one', 'artist two', 'artist three'],
    availablePlaces: 80,
    beginDate: 'sometime',
    description: 'very good',
    eventName: 'Event four',
    imagesNames: [
      'assets/images/concert.png',
      'assets/images/medium page background image.jpg',
      'assets/images/tickets.png'
    ],
    ticketsPrice: 50,
  )),
  EventCard(
      event: Event(
    artistsNames: ['artist one', 'artist two', 'artist three'],
    availablePlaces: 80,
    beginDate: 'sometime',
    description: 'very good',
    eventName: 'Event five',
    imagesNames: [
      'assets/images/concert.png',
      'assets/images/medium page background image.jpg',
      'assets/images/tickets.png'
    ],
    ticketsPrice: 50,
  )),
  EventCard(
      event: Event(
    artistsNames: ['artist one', 'artist two', 'artist three'],
    availablePlaces: 80,
    beginDate: 'sometime',
    description: 'very good',
    eventName: 'Event six',
    imagesNames: [
      'assets/images/concert.png',
      'assets/images/medium page background image.jpg',
      'assets/images/tickets.png'
    ],
    ticketsPrice: 50,
  )),
];
Widget buildEventGridView() {
  EventController controller=Get.put(EventController());
  return ListView.builder(
    itemCount:controller.finalListData.length,
    itemBuilder: (context, index) {
      return Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 15),
        child:EventCard(event:  Event(
    artistsNames: ['artist one', 'artist two', 'artist three'],
    availablePlaces: 80,
    beginDate: 'sometime',
    description: 'very good',
    eventName: controller.finalListData[index].title,
    imagesNames: [
      'assets/images/concert.png',
      'assets/images/medium page background image.jpg',
      'assets/images/tickets.png'
    ],
    ticketsPrice: 50,
  ),)
        ,
      );
    },
  );
}
