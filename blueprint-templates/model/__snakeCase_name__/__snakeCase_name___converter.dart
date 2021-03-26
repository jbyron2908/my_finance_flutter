import 'package:my_finance_flutter/core/data_source/database/client/database_client.dart';

class {{pascalCase name}}Converter {
  static {{pascalCase name}}Entity toEntity({{pascalCase name}}Model model) {
    return {{pascalCase name}}Entity(
      id: model.id,
      remoteId: model.remoteId,
      name: model.name,
    );
  }

  static {{pascalCase name}}Model toModel({{pascalCase name}}Entity entity) {
    return {{pascalCase name}}Model(
      id: entity.id,
      remoteId: entity.remoteId,
      name: entity.name,
    );
  }
}
