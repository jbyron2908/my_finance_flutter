import 'package:flutter/material.dart';

class BottomActionItem {
  BottomActionItem({
    required this.icon,
    required this.onTap,
  });

  final IconData icon;
  final void Function() onTap;
}

class BottomActionBar extends StatelessWidget {
  const BottomActionBar({
    Key? key,
    required this.child,
    required this.actionList,
    this.height = 48,
    this.color = Colors.blue,
  }) : super(key: key);

  final Widget child;
  final List<BottomActionItem> actionList;
  final double height;
  final Color color;

  @override
  Widget build(BuildContext context) {
    var items = actionList
        .asMap()
        .entries
        .map(
          (entry) => buildItem(context, entry.key),
        )
        .expand((item) => item)
        .toList();

    return Column(
      children: <Widget>[
        Expanded(
          child: child,
        ),
        Container(
          height: height,
          color: color,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              ...items,
            ],
          ),
        )
      ],
    );
  }

  List<Widget> buildItem(BuildContext context, int index) {
    var actionItem = actionList[index];
    return [
      if (index > 0)
        const VerticalDivider(
          color: Colors.white,
          width: 0,
        ),
      Expanded(
        child: TextButton(
          onPressed: actionItem.onTap,
          child: Icon(
            actionItem.icon,
            color: Colors.white,
          ),
        ),
      ),
    ];
  }
}
