// Class to represent available themes.

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

// List of all available themes
List<Themes> themes = [
  Themes(
    name: 'Day at School',
    color: const Color(0xfff8b2b2),
    image: 'assets/images/themes/school.png',
  ),
  Themes(
    name: 'Visit to the Zoo',
    color: const Color(0xffabaea5),
    image: 'assets/images/themes/zoo.png',
  ),
  Themes(
    name: 'Treasure Hunt',
    color: const Color(0xfff5bc86),
    image: 'assets/images/themes/treasure.png',
  ),
  Themes(
    name: 'Making Mac n Cheese',
    color: const Color(0xfffcf9ab),
    image: 'assets/images/themes/chef.png',
  ),
  Themes(
    name: 'Project Day',
    color: const Color(0xffbdf6d5),
    image: 'assets/images/themes/project.png',
  ),
  Themes(
    name: 'Bedtime Story',
    color: const Color(0xffe28ef0),
    image: 'assets/images/themes/story.png',
  ),
];
