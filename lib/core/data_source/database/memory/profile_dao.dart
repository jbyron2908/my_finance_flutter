import 'package:my_finance_flutter_3/core/domain/model/profile/profile_model.dart';
import 'package:my_finance_flutter_3/core/data_source/database/contract/database_contract.dart';
import 'package:rxdart/subjects.dart';

class MemoryProfileDao implements ProfileDao {
  var table = BehaviorSubject<List<ProfileModel>>();
  int autoId = 0;

  @override
  Future clearAll() async {
    table.add([]);
  }

  @override
  Future delete(ProfileModel model) async {
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
  Future save(ProfileModel model) async {
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

  ProfileModel addAutoId(ProfileModel model) {
    var newModel = model.copyWith.meta(
      id: autoId,
    );
    autoId++;
    return newModel;
  }

  @override
  Future saveAll(List<ProfileModel> modelList) async {
    var list = await table.first;
    list.addAll(modelList);
    table.add(list);
  }

  @override
  Future setup() async {
    table.add([]);
  }

  @override
  Stream<List<ProfileModel>> watchAll() {
    return table.stream;
  }
}
