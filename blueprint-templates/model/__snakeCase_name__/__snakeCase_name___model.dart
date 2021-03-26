import 'package:freezed_annotation/freezed_annotation.dart';

part '{{snakeCase name}}_model.freezed.dart';
part '{{snakeCase name}}_model.g.dart';

@freezed
class {{pascalCase name}}Model implements _${{pascalCase name}}Model{
  const {{pascalCase name}}Model._();

  const factory {{pascalCase name}}Model({
    int id,
    int remoteId,
    bool deleted,
    String name,
  }) = _{{pascalCase name}}Model;

  factory {{pascalCase name}}Model.fromJson(Map<String, dynamic> json) =>
    _${{pascalCase name}}ModelFromJson(json);
}
