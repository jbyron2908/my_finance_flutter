import 'package:my_finance_flutter_3/core/data_source/database/contract/database_contract.dart';
import 'package:my_finance_flutter_3/core/data_source/database/memory/account_dao.dart';
import 'package:my_finance_flutter_3/core/data_source/database/memory/category_dao.dart';
import 'package:my_finance_flutter_3/core/data_source/database/memory/label_dao.dart';
import 'package:my_finance_flutter_3/core/data_source/database/memory/operation_dao.dart';
import 'package:my_finance_flutter_3/core/data_source/database/memory/payee_dao.dart';
import 'package:my_finance_flutter_3/core/data_source/database/memory/profile_dao.dart';
import 'package:my_finance_flutter_3/core/data_source/database/memory/template_operation_dao.dart';

class MemoryDatabaseClient implements DatabaseClient {
  final _accountDao = MemoryAccountDao();
  final _categoryDao = MemoryCategoryDao();
  final _labelDao = MemoryLabelDao();
  final _operationDao = MemoryOperationDao();
  final _payeeDao = MemoryPayeeDao();
  final _profileDao = MemoryProfileDao();
  final _templateOperationDao = MemoryTemplateOperationDao();

  @override
  Future<AccountDao> accountDao() async {
    return _accountDao;
  }

  @override
  Future<CategoryDao> categoryDao() async {
    return _categoryDao;
  }

  @override
  Future<LabelDao> labelDao() async {
    return _labelDao;
  }

  @override
  Future<OperationDao> operationDao() async {
    return _operationDao;
  }

  @override
  Future<PayeeDao> payeeDao() async {
    return _payeeDao;
  }

  @override
  Future<ProfileDao> profileDao() async {
    return _profileDao;
  }

  @override
  Future<TemplateOperationDao> templateOperationDao() async {
    return _templateOperationDao;
  }

  Future setup() async {}
}
