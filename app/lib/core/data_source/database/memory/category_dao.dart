import 'package:database_domain/domain.dart';
import 'package:my_finance_flutter/core/data_source/database/contract/database_contract.dart';
import 'package:rxdart/subjects.dart';

class MemoryCategoryDao implements CategoryDao {
  var table = BehaviorSubject<List<CategoryModel>>.seeded([]);
  List<CategoryModel> get currentList => [...table.value];

  int autoId = 0;

  @override
  Future clearAll() async {
    table.add([]);
  }

  @override
  Future delete(CategoryModel model) async {
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
  Future save(CategoryModel model) async {
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

  CategoryModel addAutoId(CategoryModel model) {
    var newModel = model.copyWith.meta(
      id: autoId,
    );
    autoId++;
    return newModel;
  }

  @override
  Future saveAll(List<CategoryModel> modelList) async {
    var list = currentList;
    list.addAll(modelList);
    table.add(list);
  }

  @override
  Future setup() async {
    table.add([]);
  }

  @override
  Stream<List<CategoryModel>> watchAll() {
    return table.stream;
  }
}
