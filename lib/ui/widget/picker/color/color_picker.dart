import 'package:flutter/material.dart';
import 'package:my_finance_flutter_3/core/constants/color/color.dart';

class ColorPicker extends StatelessWidget {
  static Future<Color?> show(BuildContext context) async {
    return showDialog<Color>(
      context: context,
      builder: (context) => const ColorPicker(ColorConstants.colorList),
      barrierDismissible: true,
    );
  }

  const ColorPicker(
    this.colorList, {
    Key? key,
  }) : super(key: key);

  final List<Color> colorList;

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: const Text('Pick color'),
      content: SingleChildScrollView(
        child: SizedBox(
          width: MediaQuery.of(context).size.width * .9,
          child: GridView.count(
            shrinkWrap: true,
            crossAxisCount: 4,
            children: colorList
                .map(
                  (color) => ColorItem(color),
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

class ColorItem extends StatelessWidget {
  const ColorItem(
    this.color, {
    Key? key,
  }) : super(key: key);

  final Color color;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => Navigator.pop(context, color),
      child: Container(
        width: 60,
        height: 60,
        margin: const EdgeInsets.all(5),
        decoration: BoxDecoration(
          color: color,
          shape: BoxShape.circle,
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.5),
              spreadRadius: 3,
              blurRadius: 5,
            ),
          ],
        ),
      ),
    );
  }
}
