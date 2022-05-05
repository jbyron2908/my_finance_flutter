import 'package:database_domain/domain.dart';
import 'package:my_finance_flutter/core/data_source/database/contract/database_contract.dart';
import 'package:my_finance_flutter/core/domain/repository/base/base_repository.dart';

class CategoryRepository extends BaseRepository<CategoryModel> {
  CategoryRepository(DatabaseClient databaseClient) {
    _databaseClient = databaseClient;
  }

  late DatabaseClient _databaseClient;

  @override
  Future<DatabaseDao<CategoryModel>> getDao() => _databaseClient.categoryDao();

  Future markDeleted(CategoryModel model) async {
    var modelDeleted = model.copyWith.meta.call(deleted: true);

    var dao = await getDao();
    return dao.save(modelDeleted);
  }
}
