import 'package:flutter/material.dart';
import 'package:my_finance_flutter_3/core/config/log/logger.dart';
import 'package:my_finance_flutter_3/ui/pages/tab_playground/selectable_list/selectable_list_bloc.dart';
import 'package:provider/provider.dart';

class SelectableListPage extends StatelessWidget {
  const SelectableListPage({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => SelectableList(),
      builder: (context, _) => Column(
        children: [
          const ListWidget(),
          ElevatedButton(
            onPressed: () {
              Log.i('Add item');
              context.read<SelectableList>().add();
            },
            child: const Icon(Icons.add),
          )
        ],
      ),
    );
  }
}

class ListWidget extends StatelessWidget {
  const ListWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var list = context.select<SelectableList, List<ListItem>>(
      (value) => value.list,
    );
    return ListView.builder(
      shrinkWrap: true,
      itemCount: list.length,
      itemBuilder: (context, index) {
        return ChangeNotifierProvider(
          create: (context) => list[index],
          builder: (context, _) => const ListItemWidget(),
        );
      },
    );
  }
}

class ListItemWidget extends StatelessWidget {
  const ListItemWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var item = context.watch<ListItem>();
    return ListTile(
      title: Text('Item ${item.index}'),
      selected: item.selected,
      onTap: () {
        item.toogle();
      },
    );
  }
}
