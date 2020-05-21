import 'package:flutter/material.dart';

class Themes {
  final String name;
  final Color color;
  final String image;

  Themes({
    @required this.name,
    @required this.color,
    @required this.image,
  });
}

final List<Themes> themes = [
  Themes(
    name: 'Day at School',
    color: const Color(0xfff3b4b6),
    image: 'assets/images/themes/school.png',
  ),
  Themes(
    name: 'Visit to the Zoo',
    color: const Color(0xffa9ada7),
    image: 'assets/images/themes/zoo.png',
  ),
  Themes(
    name: 'Treasure Hunt',
    color: const Color(0xfff0bd8f),
    image: 'assets/images/themes/treasure.png',
  ),
  Themes(
    name: 'Making Mac n Cheese',
    color: const Color(0xfffaf8b4),
    image: 'assets/images/themes/chef.png',
  ),
  Themes(
    name: 'Project Day',
    color: const Color(0xffc1f3d7),
    image: 'assets/images/themes/project.png',
  ),
  Themes(
    name: 'Bedtime Story',
    color: const Color(0xffe28ef0),
    image: 'assets/images/themes/story.png',
  ),
];
