import 'package:moor/moor.dart';
import 'package:my_finance_flutter/core/data_source/database/client/database_client.dart';

part '{{snakeCase name}}_dao.g.dart';

@UseDao(tables: [{{pascalCase name}}Table])
class {{pascalCase name}}Dao extends DatabaseAccessor<DatabaseClient>
    with _${{pascalCase name}}DaoMixin {
  {{pascalCase name}}Dao(DatabaseClient db) : super(db);

  Future<int> insert({{pascalCase name}}Entity entity) {
    return into({{camelCase name}}Table).insert(entity);
  }

  Stream<List<{{pascalCase name}}Model>> watchAll() {
    return select({{camelCase name}}Table).watch().map(
          (rows) => rows
              .map(
                (entity) => {{pascalCase name}}Converter.toModel(entity),
              )
              .toList(),
        );
  }
}
