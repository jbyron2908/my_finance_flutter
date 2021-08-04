import 'package:my_finance_flutter_3/core/data_source/database/contract/database_contract.dart';
import 'package:my_finance_flutter_3/core/domain/model/template_operation/template_operation_model.dart';
import 'package:my_finance_flutter_3/core/domain/repository/base/base_repository.dart';

class TemplateOperationRepository
    extends BaseRepository<TemplateOperationModel> {
  TemplateOperationRepository(DatabaseClient databaseClient) {
    _databaseClient = databaseClient;
  }

  late DatabaseClient _databaseClient;

  @override
  Future<DatabaseDao<TemplateOperationModel>> getDao() =>
      _databaseClient.templateOperationDao();

  Future markDeleted(TemplateOperationModel model) async {
    var modelDeleted = model.copyWith.meta.call(deleted: true);

    var dao = await getDao();
    return dao.save(modelDeleted);
  }
}
