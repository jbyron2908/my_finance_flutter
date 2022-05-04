import 'package:my_finance_flutter_3/core/data_source/database/contract/database_contract.dart';
import 'package:my_finance_flutter_3/core/domain/model/operation/operation_model.dart';
import 'package:rxdart/subjects.dart';

class MemoryOperationDao implements OperationDao {
  var table = BehaviorSubject<List<OperationModel>>.seeded([]);
  List<OperationModel> get currentList => [...table.value];

  int autoId = 0;

  @override
  Future clearAll() async {
    table.add([]);
  }

  @override
  Future delete(OperationModel model) async {
    deleteById(model.meta.id);
  }

  void deleteById(int? id) async {
    var list = currentList;
    list.removeWhere(
      (element) => element.meta.id == id,
    );
    table.add(list);
  }

  @override
  Future save(OperationModel model) async {
    if (model.meta.id == null) {
      var newModel = addAutoId(model);
      var list = currentList;
      list.add(newModel);
      table.add(list);
    } else {
      deleteById(model.meta.id);
      var list = currentList;
      list.add(model);
      table.add(list);
    }
  }

  OperationModel addAutoId(OperationModel model) {
    var newModel = model.copyWith.meta(
      id: autoId,
    );
    autoId++;
    return newModel;
  }

  @override
  Future saveAll(List<OperationModel> modelList) async {
    var list = currentList;
    list.addAll(modelList);
    table.add(list);
  }

  @override
  Future setup() async {
    table.add([]);
  }

  @override
  Stream<List<OperationModel>> watchAll() {
    return table.stream;
  }
}
