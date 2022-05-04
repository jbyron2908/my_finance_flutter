import 'package:my_finance_flutter_3/core/domain/model/category/category_model.dart';
import 'package:my_finance_flutter_3/core/domain/repository/category/category_repository.dart';

class CategoryListController {
  CategoryListController(this.categoryRepository);

  final CategoryRepository categoryRepository;

  Future deleteCategory(CategoryModel category) {
    return categoryRepository.delete(category);
  }
}
