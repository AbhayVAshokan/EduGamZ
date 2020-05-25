// Class representing an individual user.

import 'package:flutter/foundation.dart';

import './avatar.dart';

class Profile {
  final Avatar avatar;
  final String name;

  Profile({
    @required this.name,
    @required this.avatar,
  });
}
