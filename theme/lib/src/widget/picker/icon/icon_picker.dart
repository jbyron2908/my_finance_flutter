import 'package:database_domain/domain.dart';
import 'package:flutter/material.dart';
import 'package:theme/src/widget/common/icon/circle_icon.dart';

class IconPicker extends StatelessWidget {
  static Future<IconData?> show(
    BuildContext context,
    List<IconData> colorList,
  ) async {
    return showDialog<IconData>(
      context: context,
      builder: (context) => IconPicker(colorList),
      barrierDismissible: true,
    );
  }

  const IconPicker(
    this.colorList, {
    Key? key,
  }) : super(key: key);

  final List<IconData> colorList;

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: const Text('Pick icon'),
      content: SingleChildScrollView(
        child: SizedBox(
          width: MediaQuery.of(context).size.width * .9,
          child: GridView.count(
            shrinkWrap: true,
            crossAxisCount: 5,
            children: colorList
                .map(
                  (icon) => IconItem(icon),
                )
                .toList(),
          ),
        ),
      ),
      actions: [
        TextButton(
          onPressed: () => Navigator.pop(context),
          child: const Text('Cancel'),
        )
      ],
    );
  }
}

class IconItem extends StatelessWidget {
  const IconItem(
    this.icon, {
    Key? key,
  }) : super(key: key);

  final IconData icon;

  @override
  Widget build(BuildContext context) {
    var iconModel = IconModel(
      circleColorCode: Colors.blue.value,
      iconColorCode: Colors.white.value,
      iconCodePoint: icon.codePoint,
      iconFontPackage: icon.fontPackage,
      iconFontFamily: icon.fontFamily,
    );
    return InkWell(
      onTap: () => Navigator.pop(context, icon),
      child: Padding(
        padding: const EdgeInsets.all(4.0),
        child: CircleIcon(
          iconModel,
          circleSize: 60,
        ),
      ),
    );
  }
}