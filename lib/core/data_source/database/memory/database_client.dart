import 'package:my_finance_flutter_3/core/data_source/database/contract/database_contract.dart';
import 'package:my_finance_flutter_3/core/data_source/database/memory/account_dao.dart';
import 'package:my_finance_flutter_3/core/data_source/database/memory/category_dao.dart';
import 'package:my_finance_flutter_3/core/data_source/database/memory/label_dao.dart';
import 'package:my_finance_flutter_3/core/data_source/database/memory/operation_dao.dart';
import 'package:my_finance_flutter_3/core/data_source/database/memory/payee_dao.dart';
import 'package:my_finance_flutter_3/core/data_source/database/memory/profile_dao.dart';
import 'package:my_finance_flutter_3/core/data_source/database/memory/template_operation_dao.dart';

class MemoryDatabaseClient implements DatabaseClient {
  @override
  Future<AccountDao> accountDao() async {
    return MemoryAccountDao();
  }

  @override
  Future<CategoryDao> categoryDao() async {
    return MemoryCategoryDao();
  }

  @override
  Future<LabelDao> labelDao() async {
    return MemoryLabelDao();
  }

  @override
  Future<OperationDao> operationDao() async {
    return MemoryOperationDao();
  }

  @override
  Future<PayeeDao> payeeDao() async {
    return MemoryPayeeDao();
  }

  @override
  Future<ProfileDao> profileDao() async {
    return MemoryProfileDao();
  }

  @override
  Future<TemplateOperationDao> templateOperationDao() async {
    return MemoryTemplateOperationDao();
  }

  Future setup() async {}
}
