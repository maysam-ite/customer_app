import 'package:flutter/material.dart';

import '../../widget/event_card.dart';

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
  return ListView.builder(
    itemCount: events.length - 1,
    itemBuilder: (context, index) {
      return Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 15),
        child: events[index],
      );
    },
  );
}
