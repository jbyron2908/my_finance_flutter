import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class DebugToolsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Debug tools'),
      ),
      body: ListView(
        children: [
          ListTile(
            title: Text('Populate Demo'),
            leading: FaIcon(FontAwesomeIcons.empire),
            // onTap: () => context.router.push(CounterRote()),
          ),
        ],
      ),
    );
  }
}
