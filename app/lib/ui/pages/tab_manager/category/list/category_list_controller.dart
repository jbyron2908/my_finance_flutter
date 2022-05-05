import 'package:database_domain/domain.dart';
import 'package:my_finance_flutter/core/domain/repository/category/category_repository.dart';

class CategoryListController {
  CategoryListController(this.categoryRepository);

  final CategoryRepository categoryRepository;

  Future deleteCategory(CategoryModel category) {
    return categoryRepository.delete(category);
  }
}
