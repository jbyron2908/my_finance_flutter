import 'package:flutter/material.dart';
import 'package:my_finance_flutter/core/provider/repository/category/category_repository.dart';
import 'package:my_finance_flutter/ui/common/base/bloc/base_bloc.dart';
import 'package:provider/single_child_widget.dart';
import 'package:provider/src/provider.dart';

class CategorySelectionBloc extends BaseBloc {
  static CategorySelectionBloc of(BuildContext context) =>
      Provider.of<CategorySelectionBloc>(context, listen: false);

  final CategoryRepository categoryRepository;

  CategorySelectionBloc({
    this.categoryRepository,
  });

  @override
  List<SingleChildWidget> get dependencies => [];
}
