import 'package:flutter/material.dart';

extension Operations on SizedBox {
  List<SizedBox> multiplyBy(int factor) {
    List<SizedBox> _emptyBoxes = [];
    for (int i = 0; i < factor; i++) {
      _emptyBoxes.add(this);
    }
    return _emptyBoxes;
  }
}
