import 'package:hive/hive.dart';

class {{pascalCase name}}Dao {
  final Box box;

  {{pascalCase name}}Dao(this.box);

  {{pascalCase name}}Model getLastUsed() {
    return {{pascalCase name}}Model.fromJson(
      box.get(
        'default{{pascalCase name}}',
        defaultValue: {{pascalCase name}}Constants.getDefault().toJson(),
      ),
    );
  }

  Future<void> updateLastUsed({{pascalCase name}}Model model) async {
    await box.put('default{{pascalCase name}}', model.toJson());
  }
}
