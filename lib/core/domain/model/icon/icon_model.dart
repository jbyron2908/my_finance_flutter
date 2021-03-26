import 'dart:ui';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'icon_model.freezed.dart';
part 'icon_model.g.dart';

@freezed
class IconModel with _$IconModel, DiagnosticableTreeMixin {
  const IconModel._();

  const factory IconModel({
    required int circleColorCode,
    required int iconColorCode,
    required int iconCodePoint,
    String? iconFontFamily,
    String? iconFontPackage,
  }) = _IconModel;

  factory IconModel.fromJson(Map<String, dynamic> json) =>
      _$IconModelFromJson(json);

  Color get circleColor => Color(circleColorCode);

  Color get iconColor => Color(iconColorCode);

  IconData get iconData => IconData(
        iconCodePoint,
        fontFamily: iconFontFamily,
        fontPackage: iconFontPackage,
      );

  static IconModel get iconDefault {
    var circleColor = Colors.blue;
    var iconColor = Colors.white;
    var iconData = FontAwesomeIcons.user;

    return IconModel(
      circleColorCode: circleColor.value,
      iconColorCode: iconColor.value,
      iconCodePoint: iconData.codePoint,
      iconFontFamily: iconData.fontFamily,
      iconFontPackage: iconData.fontPackage,
    );
  }
}
