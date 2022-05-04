import 'package:flutter/material.dart';
import 'package:my_finance_flutter/core/data_source/database/client/database_client.dart';
import 'package:provider/provider.dart';
import 'package:provider/single_child_widget.dart';

class {{pascalCase name}}Repository {
  static SingleChildWidget buildProvider() =>
      ProxyProvider<DatabaseClient, {{pascalCase name}}Repository>(
        update: (context, databaseClient, repository) =>
            {{pascalCase name}}Repository(databaseClient),
      );

  static {{pascalCase name}}Repository of(BuildContext context) =>
      Provider.of<{{pascalCase name}}Repository>(context, listen: false);

  DatabaseClient _databaseClient;

  {{pascalCase name}}Repository(this._databaseClient) {
    _{{camelCase name}}ListStream = _databaseClient.{{camelCase name}}Dao.watchAll();
  }

  Stream<List<{{pascalCase name}}Model>> _{{camelCase name}}ListStream;
  Stream<List<{{pascalCase name}}Model>> get {{camelCase name}}ListStream => _{{camelCase name}}ListStream;

  Future<int> save({{pascalCase name}}Model {{camelCase name}}) async {
    return _databaseClient.{{camelCase name}}Dao.insert(
      {{pascalCase name}}Converter.toEntity({{camelCase name}}),
    );
  }
}
