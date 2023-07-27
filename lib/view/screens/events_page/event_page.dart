import 'package:flutter/material.dart';

import '../../widget/new_event_card.dart';

final List<NewEventCard> events = [
  NewEventCard(
      event: Event(
    artistsNames: ['artist one', 'artist two', 'artist three'],
    availablePlaces: 80,
    beginDate: Date(
        dayName: 'sunday',
        dayNumber: '9',
        month: 'july',
        time: '6:30',
        year: '2203'),
    description: 'very good',
    eventName: 'Event one',
    imagesNames: [
      'assets/images/concert.png',
      'assets/images/medium page background image.jpg',
      'assets/images/tickets.png'
    ],
    ticketsPrice: 50,
  )),
  NewEventCard(
      event: Event(
    artistsNames: ['artist one', 'artist two', 'artist three'],
    availablePlaces: 80,
    beginDate: Date(
        dayName: 'sunday',
        dayNumber: '9',
        month: 'july',
        time: '6:30',
        year: '2203'),
    description: 'very good',
    eventName: 'Event one',
    imagesNames: [
      'assets/images/concert.png',
      'assets/images/medium page background image.jpg',
      'assets/images/tickets.png'
    ],
    ticketsPrice: 50,
  )),
  NewEventCard(
      event: Event(
    artistsNames: ['artist one', 'artist two', 'artist three'],
    availablePlaces: 80,
    beginDate: Date(
        dayName: 'sunday',
        dayNumber: '9',
        month: 'july',
        time: '6:30',
        year: '2203'),
    description: 'very good',
    eventName: 'Event one',
    imagesNames: [
      'assets/images/concert.png',
      'assets/images/medium page background image.jpg',
      'assets/images/tickets.png'
    ],
    ticketsPrice: 50,
  )),
  NewEventCard(
      event: Event(
    artistsNames: ['artist one', 'artist two', 'artist three'],
    availablePlaces: 80,
    beginDate: Date(
        dayName: 'sunday',
        dayNumber: '9',
        month: 'july',
        time: '6:30',
        year: '2203'),
    description: 'very good',
    eventName: 'Event one',
    imagesNames: [
      'assets/images/concert.png',
      'assets/images/medium page background image.jpg',
      'assets/images/tickets.png'
    ],
    ticketsPrice: 50,
  )),
  NewEventCard(
      event: Event(
    artistsNames: ['artist one', 'artist two', 'artist three'],
    availablePlaces: 80,
    beginDate: Date(
        dayName: 'sunday',
        dayNumber: '9',
        month: 'july',
        time: '6:30',
        year: '2203'),
    description: 'very good',
    eventName: 'Event one',
    imagesNames: [
      'assets/images/concert.png',
      'assets/images/medium page background image.jpg',
      'assets/images/tickets.png'
    ],
    ticketsPrice: 50,
  )),
  NewEventCard(
      event: Event(
    artistsNames: ['artist one', 'artist two', 'artist three'],
    availablePlaces: 80,
    beginDate: Date(
        dayName: 'sunday',
        dayNumber: '9',
        month: 'july',
        time: '6:30',
        year: '2203'),
    description: 'very good',
    eventName: 'Event one',
    imagesNames: [
      'assets/images/concert.png',
      'assets/images/medium page background image.jpg',
      'assets/images/tickets.png'
    ],
    ticketsPrice: 50,
  )),
  NewEventCard(
      event: Event(
    artistsNames: ['artist one', 'artist two', 'artist three'],
    availablePlaces: 80,
    beginDate: Date(
        dayName: 'someday',
        dayNumber: '33',
        month: 'july',
        time: '6:30',
        year: '2203'),
    description: 'very good',
    eventName: 'Event one',
    imagesNames: [
      'assets/images/medium page background image.jpg',
      'assets/images/concert.png',
      'assets/images/tickets.png'
    ],
    ticketsPrice: 50,
  )),
  NewEventCard(
      event: Event(
    artistsNames: ['artist one', 'artist two', 'artist three'],
    availablePlaces: 80,
    beginDate: Date(
        dayName: 'someday',
        dayNumber: '33',
        month: 'july',
        time: '6:30',
        year: '2203'),
    description: 'very good',
    eventName: 'Event one',
    imagesNames: [
      'assets/images/medium page background image.jpg',
      'assets/images/concert.png',
      'assets/images/tickets.png'
    ],
    ticketsPrice: 50,
  )),
  NewEventCard(
      event: Event(
    artistsNames: ['artist one', 'artist two', 'artist three'],
    availablePlaces: 80,
    beginDate: Date(
        dayName: 'someday',
        dayNumber: '33',
        month: 'july',
        time: '6:30',
        year: '2203'),
    description: 'very good',
    eventName: 'Event one',
    imagesNames: [
      'assets/images/medium page background image.jpg',
      'assets/images/concert.png',
      'assets/images/tickets.png'
    ],
    ticketsPrice: 50,
  )),
  NewEventCard(
      event: Event(
    artistsNames: ['artist one', 'artist two', 'artist three'],
    availablePlaces: 80,
    beginDate: Date(
        dayName: 'someday',
        dayNumber: '33',
        month: 'july',
        time: '6:30',
        year: '2203'),
    description: 'very good',
    eventName: 'Event one',
    imagesNames: [
      'assets/images/medium page background image.jpg',
      'assets/images/concert.png',
      'assets/images/tickets.png'
    ],
    ticketsPrice: 50,
  )),
  NewEventCard(
      event: Event(
    artistsNames: ['artist one', 'artist two', 'artist three'],
    availablePlaces: 80,
    beginDate: Date(
        dayName: 'monday',
        dayNumber: '10',
        month: 'july',
        time: '6:30',
        year: '2023'),
    description: 'very good',
    eventName: 'Event one',
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
