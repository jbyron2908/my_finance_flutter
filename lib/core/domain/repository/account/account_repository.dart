import 'package:my_finance_flutter_3/core/domain/model/account/account_model.dart';
import 'package:my_finance_flutter_3/core/domain/repository/base/base_repository.dart';
import 'package:my_finance_flutter_3/core/data_source/database/contract/database_contract.dart';

class AccountRepository extends BaseRepository<AccountModel> {
  AccountRepository(DatabaseClient databaseClient) {
    _databaseClient = databaseClient;
  }

  late DatabaseClient _databaseClient;

  @override
  DatabaseDao<AccountModel> get dao => _databaseClient.accountDao;

  Future markDeleted(AccountModel model) async {
    var modelDeleted = model.copyWith.meta.call(deleted: true);
    return dao.save(modelDeleted);
  }
}
