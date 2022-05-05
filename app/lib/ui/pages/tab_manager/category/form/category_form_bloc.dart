import 'package:database_domain/domain.dart';
import 'package:my_finance_flutter/core/domain/repository/category/category_repository.dart';

class CategoryFormBloc {
  CategoryFormBloc(this.categoryRepository);

  final CategoryRepository categoryRepository;

  String name = '';
  IconModel icon = IconModel.iconDefault;
  CategoryModel? parent;

  Future<bool> save() async {
    var model = CategoryModel(
      name: name,
      parent: parent,
      icon: icon,
    );
    await categoryRepository.save(model);
    return true;
  }
}
