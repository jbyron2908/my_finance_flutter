import 'package:my_finance_flutter_3/core/data_source/database/contract/database_contract.dart';
import 'package:my_finance_flutter_3/core/domain/model/payee/payee_model.dart';
import 'package:my_finance_flutter_3/core/domain/repository/base/base_repository.dart';

class PayeeRepository extends BaseRepository<PayeeModel> {
  PayeeRepository(DatabaseClient databaseClient) {
    _databaseClient = databaseClient;
  }

  late DatabaseClient _databaseClient;

  @override
  Future<DatabaseDao<PayeeModel>> getDao() => _databaseClient.payeeDao();

  Future markDeleted(PayeeModel model) async {
    var modelDeleted = model.copyWith.meta.call(deleted: true);
    var dao = await getDao();
    return dao.save(modelDeleted);
  }
}
