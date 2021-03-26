import 'package:flutter/material.dart';
import 'package:my_finance_flutter/ui/common/base/widget/base_widget.dart';

class {{pascalCase name}}Widget extends BaseWidget<{{pascalCase name}}Bloc> {
  @override
  Widget build(BuildContext context) {
    return Text("New bloc widget");
  }

  @override
  {{pascalCase name}}Bloc buildBloc(BuildContext context) {
    return {{pascalCase name}}Bloc(
      context: context,
    );
  }
}
