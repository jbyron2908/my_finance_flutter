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
  AccountDao accountDao = MemoryAccountDao();

  @override
  CategoryDao categoryDao = MemoryCategoryDao();

  @override
  LabelDao labelDao = MemoryLabelDao();

  @override
  OperationDao operationDao = MemoryOperationDao();

  @override
  PayeeDao payeeDao = MemoryPayeeDao();

  @override
  ProfileDao profileDao = MemoryProfileDao();

  @override
  TemplateOperationDao templateOperationDao = MemoryTemplateOperationDao();

  @override
  Future setup() async {}
}
