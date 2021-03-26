import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:my_finance_flutter_3/ui/app/app_router.gr.dart';

class PlaygroundPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Playground'),
      ),
      body: ListView(
        children: [
          ListTile(
            title: Text('Counter'),
            leading: FaIcon(Icons.add),
            onTap: () => context.router.push(CounterRoute()),
          ),
        ],
      ),
    );
  }
}
