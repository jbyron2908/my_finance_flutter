import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:my_finance_flutter_3/core/domain/model/icon/icon_model.dart';

class CircleIcon extends StatelessWidget {
  const CircleIcon(
    this.iconModel, {
    Key? key,
    this.circleSize = 40,
  }) : super(key: key);

  final IconModel iconModel;
  final double circleSize;

  @override
  Widget build(BuildContext context) {
    var iconData = iconModel.iconData;
    return Container(
      width: circleSize,
      height: circleSize,
      decoration: BoxDecoration(
        color: iconModel.circleColor,
        shape: BoxShape.circle,
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.5),
            spreadRadius: 3,
            blurRadius: 5,
          ),
        ],
      ),
      child: FittedBox(
        child: Padding(
          padding: const EdgeInsets.all(12),
          child: FaIcon(
            iconData,
            color: iconModel.iconColor,
          ),
        ),
      ),
    );
  }
}
