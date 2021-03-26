import 'package:my_finance_flutter_3/core/domain/model/account/account_model.dart';
import 'package:my_finance_flutter_3/core/domain/model/category/category_model.dart';
import 'package:my_finance_flutter_3/core/domain/model/label/label_model.dart';
import 'package:my_finance_flutter_3/core/domain/model/operation/operation_model.dart';
import 'package:my_finance_flutter_3/core/domain/model/payee/payee_model.dart';
import 'package:my_finance_flutter_3/core/domain/model/profile/profile_model.dart';
import 'package:my_finance_flutter_3/core/domain/model/template_operation/template_operation_model.dart';

abstract class DatabaseClient {
  late ProfileDao profileDao;
  late AccountDao accountDao;
  late CategoryDao categoryDao;
  late PayeeDao payeeDao;
  late OperationDao operationDao;
  late LabelDao labelDao;
  late TemplateOperationDao templateOperationDao;

  Future setup();
}

abstract class DatabaseDao<T> {
  Future setup();
  Future save(T model);
  Future saveAll(List<T> modelList);
  Future delete(T model);
  Future clearAll();
  Stream<List<T>> watchAll();
}

abstract class ProfileDao implements DatabaseDao<ProfileModel> {}

abstract class AccountDao implements DatabaseDao<AccountModel> {}

abstract class CategoryDao implements DatabaseDao<CategoryModel> {}

abstract class PayeeDao implements DatabaseDao<PayeeModel> {}

abstract class OperationDao implements DatabaseDao<OperationModel> {}

abstract class LabelDao implements DatabaseDao<LabelModel> {}

abstract class TemplateOperationDao
    implements DatabaseDao<TemplateOperationModel> {}
