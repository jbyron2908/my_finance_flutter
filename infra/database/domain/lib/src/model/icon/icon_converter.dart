import 'dart:convert';

import 'package:database_domain/src/model/icon/icon_model.dart';
import 'package:flutter/material.dart';

class IconConverter {
  static String toEntity(IconModel model) {
    var map = model.toJson();
    return jsonEncode(map);
  }

  static IconModel toModel(String entity) {
    Map<String, dynamic> map = jsonDecode(entity);
    return IconModel.fromJson(map);
  }

  static IconModel fromIconAndColor({
    required IconData icon,
    required Color iconColor,
    required Color circleColor,
  }) {
    return IconModel(
      iconCodePoint: icon.codePoint,
      iconFontFamily: icon.fontFamily,
      iconFontPackage: icon.fontPackage,
      iconColorCode: iconColor.value,
      circleColorCode: circleColor.value,
    );
  }
}
