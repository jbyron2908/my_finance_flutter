import 'package:moor/moor.dart';

@DataClassName("{{pascalCase name}}Entity")
class {{pascalCase name}}Table extends Table {
  IntColumn get id => integer().autoIncrement()();
  IntColumn get remoteId => integer().nullable()();
  BoolColumn get deleted => boolean().withDefault(const Constant(false))();
  TextColumn get name => text()();
}
