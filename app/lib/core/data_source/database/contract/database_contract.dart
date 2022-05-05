import 'package:database_domain/domain.dart';

abstract class DatabaseClient {
  Future<ProfileDao> profileDao();
  Future<AccountDao> accountDao();
  Future<CategoryDao> categoryDao();
  Future<PayeeDao> payeeDao();
  Future<OperationDao> operationDao();
  Future<LabelDao> labelDao();
  Future<TemplateOperationDao> templateOperationDao();
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
