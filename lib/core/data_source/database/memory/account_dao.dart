import 'package:my_finance_flutter_3/core/domain/model/account/account_model.dart';
import 'package:my_finance_flutter_3/core/data_source/database/contract/database_contract.dart';
import 'package:rxdart/subjects.dart';

class MemoryAccountDao implements AccountDao {
  var table = BehaviorSubject<List<AccountModel>>();
  int autoId = 0;

  @override
  Future clearAll() async {
    table.add([]);
  }

  @override
  Future delete(AccountModel model) async {
    deleteById(model.meta.id);
  }

  void deleteById(int? id) async {
    var list = await table.first;
    list.removeWhere(
      (element) => element.meta.id == id,
    );
    table.add(list);
  }

  @override
  Future save(AccountModel model) async {
    if (model.meta.id == null) {
      var newModel = addAutoId(model);
      var list = await table.first;
      list.add(newModel);
      table.add(list);
    } else {
      deleteById(model.meta.id);
      var list = await table.first;
      list.add(model);
      table.add(list);
    }
  }

  AccountModel addAutoId(AccountModel model) {
    var newModel = model.copyWith.meta(
      id: autoId,
    );
    autoId++;
    return newModel;
  }

  @override
  Future saveAll(List<AccountModel> modelList) async {
    var list = await table.first;
    list.addAll(modelList);
    table.add(list);
  }

  @override
  Future setup() async {
    table.add([]);
  }

  @override
  Stream<List<AccountModel>> watchAll() {
    return table.stream;
  }
}
