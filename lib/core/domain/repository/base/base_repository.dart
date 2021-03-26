import 'package:my_finance_flutter_3/core/domain/model/meta/meta_model.dart';
import 'package:my_finance_flutter_3/core/data_source/database/contract/database_contract.dart';

abstract class BaseRepository<T> {
  DatabaseDao<T> get dao;

  Future save(T model) async {
    return dao.save(model);
  }

  Future saveAll(List<T> modelList) async {
    return dao.saveAll(modelList);
  }

  Future delete(T model) async {
    return dao.delete(model);
  }

  MetaModel markMetaDeleted(MetaModel meta) {
    return meta.copyWith.call(
      deleted: true,
    );
  }

  Future clearAll() async {
    return dao.clearAll();
  }

  Stream<List<T>> watchAll() {
    return dao.watchAll();
  }
}
