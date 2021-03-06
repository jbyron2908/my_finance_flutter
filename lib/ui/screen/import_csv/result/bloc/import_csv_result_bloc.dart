import 'package:flutter/material.dart';
import 'package:my_finance_flutter/ui/common/base/bloc/base_bloc.dart';
import 'package:provider/single_child_widget.dart';
import 'package:provider/src/provider.dart';

class ImportCsvResultBloc extends BaseBloc {
  static ImportCsvResultBloc of(BuildContext context) =>
      Provider.of<ImportCsvResultBloc>(context, listen: false);

  ImportCsvResultBloc();

  @override
  List<SingleChildWidget> get dependencies => [];
}
