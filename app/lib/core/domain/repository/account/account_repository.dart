import 'package:my_finance_flutter_3/core/data_source/database/contract/database_contract.dart';
import 'package:my_finance_flutter_3/core/domain/model/account/account_model.dart';
import 'package:my_finance_flutter_3/core/domain/repository/base/base_repository.dart';

class AccountRepository extends BaseRepository<AccountModel> {
  AccountRepository(DatabaseClient databaseClient) {
    _databaseClient = databaseClient;
  }

  late DatabaseClient _databaseClient;

  @override
  Future<DatabaseDao<AccountModel>> getDao() => _databaseClient.accountDao();

  Future markDeleted(AccountModel model) async {
    var modelDeleted = model.copyWith.meta.call(deleted: true);

    var dao = await getDao();
    return dao.save(modelDeleted);
  }
}
