import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class DebugToolsPage extends StatelessWidget {
  const DebugToolsPage({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: EdgeInsets.zero,
      children: const [
        ListTile(
          title: Text('Populate Demo'),
          leading: FaIcon(FontAwesomeIcons.empire),
          // onTap: () => context.router.push(CounterRote()),
        ),
      ],
    );
  }
}
