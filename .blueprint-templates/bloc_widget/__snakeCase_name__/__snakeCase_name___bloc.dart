import 'package:flutter/material.dart';
import 'package:my_finance_flutter/ui/common/base/bloc/base_bloc.dart';
import 'package:provider/src/provider.dart';
import 'package:provider/single_child_widget.dart';

class {{pascalCase name}}Bloc extends BaseBloc {
  static {{pascalCase name}}Bloc of(BuildContext context) =>
      Provider.of<{{pascalCase name}}Bloc>(context, listen: false);

  final BuildContext context;

  {{pascalCase name}}Bloc({
    required this.context,
  });

  @override
  List<SingleChildWidget> get dependencies => [];

}
