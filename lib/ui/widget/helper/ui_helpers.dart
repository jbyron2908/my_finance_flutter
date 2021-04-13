import 'package:flutter/material.dart';

class UIHelper {
  static const double _spaceTiny = 4.0;
  static const double _spaceSmall = 8.0;
  static const double _spaceMedium = 16.0;
  static const double _spaceLarge = 32.0;

  static const verticalSpaceTiny = SizedBox(
    height: _spaceTiny,
  );
  static const verticalSpaceSmall = SizedBox(
    height: _spaceSmall,
  );
  static const verticalSpaceMedium = SizedBox(
    height: _spaceMedium,
  );
  static const verticalSpaceLarge = SizedBox(
    height: _spaceLarge,
  );
  static const verticalDivider = VerticalDivider(
    color: Colors.white,
  );

  static const horizontalSpaceTiny = SizedBox(
    width: _spaceTiny,
  );
  static const horizontalSpaceSmall = SizedBox(
    width: _spaceSmall,
  );
  static const horizontalSpaceMedium = SizedBox(
    width: _spaceMedium,
  );
  static const horizontalSpaceLarge = SizedBox(
    width: _spaceLarge,
  );
  static const horizontalDivider = Divider(
    color: Colors.grey,
  );
}
