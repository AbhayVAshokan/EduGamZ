// Drag and drop the ingredients into the container in the given order.

import 'package:flutter/foundation.dart';

class DragAndDrop {
  final String question;
  final String container;
  final List<Map<String, dynamic>> data;

  DragAndDrop({
    @required this.question,
    @required this.data,
    @required this.container,
  });
}
