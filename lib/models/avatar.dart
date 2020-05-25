// Class to represent player avatar

import 'package:flutter/material.dart';

class Avatar {
  final String name;
  final Color color;
  final String image;

  Avatar({
    @required this.name,
    @required this.color,
    @required this.image,
  });
}

// Available avatars
final List<Avatar> avatars = [
  Avatar(
    name: 'Caesar',
    color: Colors.brown[200],
    image: 'assets/images/avatars/dog.png',
  ),
  Avatar(
    name: 'Fluffy',
    color: Colors.pinkAccent[200],
    image: 'assets/images/avatars/sheep.png',
  ),
  Avatar(
    name: 'Chocolate',
    color: Colors.brown,
    image: 'assets/images/avatars/cat.png',
  ),
  Avatar(
    name: 'Blaze',
    color: Colors.amber,
    image: 'assets/images/avatars/chick.png',
  ),
  Avatar(
    name: 'Moon',
    color: Colors.blueGrey,
    image: 'assets/images/avatars/cow.png',
  ),
  Avatar(
    name: 'Snowy',
    color: Colors.pinkAccent[100],
    image: 'assets/images/avatars/rabbit.png',
  ),
  Avatar(
    name: 'Puff',
    color: Colors.red,
    image: 'assets/images/avatars/hen.png',
  ),
  Avatar(
    name: 'Buzz',
    color: Colors.pinkAccent,
    image: 'assets/images/avatars/pig.png',
  ),
];
