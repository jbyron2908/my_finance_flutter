import 'package:my_finance_flutter_3/core/data_source/database/contract/database_contract.dart';
import 'package:my_finance_flutter_3/core/domain/model/label/label_model.dart';
import 'package:my_finance_flutter_3/core/domain/repository/base/base_repository.dart';

class LabelRepository extends BaseRepository<LabelModel> {
  LabelRepository(DatabaseClient databaseClient) {
    _databaseClient = databaseClient;
  }

  late DatabaseClient _databaseClient;

  @override
  Future<DatabaseDao<LabelModel>> getDao() => _databaseClient.labelDao();

  Future markDeleted(LabelModel model) async {
    var modelDeleted = model.copyWith.meta.call(deleted: true);

    var dao = await getDao();
    return dao.save(modelDeleted);
  }
}
