import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:my_finance_flutter_3/ui/pages/tab_playground/selectable_list/selectable_list_bloc.dart';

class SelectableListPage extends StatelessWidget {
  const SelectableListPage({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Selectable List'),
      ),
      body: ListWidget(),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          print('Add item');
          context.read(listProvider).add();
        },
        child: Icon(Icons.add),
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
    return Consumer(
      builder: (context, watch, child) {
        var list = watch(listProvider).list;
        return ListView.builder(
          itemCount: list.length,
          itemBuilder: (context, index) {
            return Consumer(
              builder: (context, watch, child) {
                var item = watch(itemProvider(index));
                return ListTile(
                  title: Text('Item ${item.index}'),
                  selected: item.selected,
                  onTap: () {
                    item.toogle();
                  },
                );
              },
            );
          },
        );
      },
    );
  }
}
