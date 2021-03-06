import 'package:flutter/material.dart';
import 'package:my_finance_flutter/core/model/label/label_model.dart';
import 'package:my_finance_flutter/ui/screen/main_tabs/manager/label/form/screen/label_form_route.dart';
import 'package:my_finance_flutter/ui/screen/main_tabs/manager/label/widgets/label_item.dart';
import 'package:provider/provider.dart';

class LabelListView extends StatelessWidget {
  LabelListView({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Labels'),
      ),
      body: Container(
        child: _LabelList(),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () => _navigateToLabelForm(context),
      ),
    );
  }

  void _navigateToLabelForm(BuildContext context) {
    LabelFormRoute().navigateIntoTab(context);
  }
}

class _LabelList extends StatelessWidget {
  _LabelList({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<List<LabelModel>>(
      builder: (_, labelList, child) => ListView.builder(
        itemCount: labelList.length,
        itemBuilder: (context, index) => LabelItem(
          label: labelList[index],
        ),
      ),
    );
  }
}
