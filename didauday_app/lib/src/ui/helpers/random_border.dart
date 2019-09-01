import 'dart:math';

import 'package:flutter/material.dart';

class RandomBorder {
  static BorderRadius randomBorderRadius(bool right) {
    final index = Random().nextInt(4);
    // 4 -> 10
    if (index == 0) {
      return BorderRadius.only(
        topLeft: Radius.circular(10),
        topRight: Radius.circular(10),
        bottomLeft: Radius.circular(10),
        bottomRight: Radius.circular(10),
      );
    }
    // 2 -> 10, 2 -> 0
    if (index == 1) {
      if (!right) {
        return BorderRadius.only(
          topLeft: Radius.circular(2),
          bottomLeft: Radius.circular(2),
          bottomRight: Radius.circular(10),
          topRight: Radius.circular(10),
        );
      } else {
        return BorderRadius.only(
          topLeft: Radius.circular(10),
          bottomLeft: Radius.circular(10),
          bottomRight: Radius.circular(2),
          topRight: Radius.circular(2),
        );
      }
    }
    // top 10
    if (index == 2) {
      if (right) {
        return BorderRadius.only(
          topLeft: Radius.circular(10),
          bottomLeft: Radius.circular(10),
          bottomRight: Radius.circular(10),
          topRight: Radius.circular(2),
        );
      } else {
        return BorderRadius.only(
          topLeft: Radius.circular(10),
          bottomLeft: Radius.circular(2),
          bottomRight: Radius.circular(10),
          topRight: Radius.circular(10),
        );
      }
    }
    if (index == 3) {
      if (right) {
        return BorderRadius.only(
          topLeft: Radius.circular(10),
          bottomLeft: Radius.circular(10),
          bottomRight: Radius.circular(2),
          topRight: Radius.circular(10),
        );
      } else {
        return BorderRadius.only(
          topLeft: Radius.circular(2),
          bottomLeft: Radius.circular(10),
          bottomRight: Radius.circular(10),
          topRight: Radius.circular(10),
        );
      }
    }
    return null;
  }
}