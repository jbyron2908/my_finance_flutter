import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:my_finance_flutter_3/core/domain/model/account/account_model.dart';
import 'package:my_finance_flutter_3/core/domain/model/category/category_model.dart';
import 'package:my_finance_flutter_3/core/domain/model/meta/meta_model.dart';
import 'package:my_finance_flutter_3/core/domain/model/operation_state/operation_state_model.dart';
import 'package:my_finance_flutter_3/core/domain/model/operation_type/operation_type_model.dart';
import 'package:my_finance_flutter_3/core/domain/model/payee/payee_model.dart';
import 'package:my_finance_flutter_3/core/domain/model/profile/profile_model.dart';

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
