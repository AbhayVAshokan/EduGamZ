import 'package:flutter/material.dart';

class Avatar {
  final String name;
  final Color color;
  final String imageUrl;

  Avatar({
    @required this.name,
    @required this.color,
    @required this.imageUrl,
  });
}

// Available avatars
final List<Avatar> avatars = [
  Avatar(
    name: 'Caesar',
    color: Colors.brown[200],
    imageUrl: 'assets/images/avatars/dog.png',
  ),
  Avatar(
    name: 'Fluffy',
    color: Colors.pinkAccent[200],
    imageUrl: 'assets/images/avatars/sheep.png',
  ),
  Avatar(
    name: 'Chocolate',
    color: Colors.brown,
    imageUrl: 'assets/images/avatars/cat.png',
  ),
  Avatar(
    name: 'Blaze',
    color: Colors.amber,
    imageUrl: 'assets/images/avatars/chick.png',
  ),
  Avatar(
    name: 'Moon',
    color: Colors.blueGrey,
    imageUrl: 'assets/images/avatars/cow.png',
  ),
  Avatar(
    name: 'Snowy',
    color: Colors.pinkAccent[100],
    imageUrl: 'assets/images/avatars/rabbit.png',
  ),
  Avatar(
    name: 'Puff',
    color: Colors.red,
    imageUrl: 'assets/images/avatars/hen.png',
  ),
  Avatar(
    name: 'Buzz',
    color: Colors.pinkAccent,
    imageUrl: 'assets/images/avatars/pig.png',
  ),
];
