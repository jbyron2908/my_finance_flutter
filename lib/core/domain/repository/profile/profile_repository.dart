import 'package:my_finance_flutter_3/core/domain/model/profile/profile_model.dart';
import 'package:my_finance_flutter_3/core/domain/repository/base/base_repository.dart';
import 'package:my_finance_flutter_3/core/data_source/database/contract/database_contract.dart';

class ProfileRepository extends BaseRepository<ProfileModel> {
  ProfileRepository(DatabaseClient databaseClient) {
    _databaseClient = databaseClient;
  }

  late DatabaseClient _databaseClient;

  @override
  DatabaseDao<ProfileModel> get dao => _databaseClient.profileDao;

  Future markDeleted(ProfileModel model) async {
    var modelDeleted = model.copyWith.meta.call(deleted: true);
    return dao.save(modelDeleted);
  }
}
