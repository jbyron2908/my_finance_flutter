import 'package:my_finance_flutter_3/core/domain/model/operation/operation_model.dart';
import 'package:my_finance_flutter_3/core/domain/repository/base/base_repository.dart';
import 'package:my_finance_flutter_3/core/data_source/database/contract/database_contract.dart';

class OperationRepository extends BaseRepository<OperationModel> {
  OperationRepository(DatabaseClient databaseClient) {
    _databaseClient = databaseClient;
  }

  late DatabaseClient _databaseClient;

  @override
  DatabaseDao<OperationModel> get dao => _databaseClient.operationDao;

  Future markDeleted(OperationModel model) async {
    var modelDeleted = model.copyWith.meta.call(deleted: true);
    return dao.save(modelDeleted);
  }
}
