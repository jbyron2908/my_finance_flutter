import 'package:database_domain/src/model/account/account_model.dart';
import 'package:database_domain/src/model/category/category_model.dart';
import 'package:database_domain/src/model/meta/meta_model.dart';
import 'package:database_domain/src/model/operation_state/operation_state_model.dart';
import 'package:database_domain/src/model/operation_type/operation_type_model.dart';
import 'package:database_domain/src/model/payee/payee_model.dart';
import 'package:database_domain/src/model/profile/profile_model.dart';
import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'operation_model.freezed.dart';
part 'operation_model.g.dart';

@freezed
class OperationModel with _$OperationModel, DiagnosticableTreeMixin {
  const OperationModel._();

  const factory OperationModel({
    @JsonKey() @Default(MetaModel()) MetaModel meta,
    required String title,
    @Default(0) double value,
    required OperationTypeModel type,
    required DateTime date,
    required OperationStateModel state,
    @Default('') String description,
    required PayeeModel payee,
    required CategoryModel category,
    required AccountModel account,
    required ProfileModel profile,
  }) = _OperationModel;

  factory OperationModel.fromJson(Map<String, dynamic> json) =>
      _$OperationModelFromJson(json);
}
