import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:my_finance_flutter_3/core/domain/model/category/category_model.dart';
import 'package:my_finance_flutter_3/core/domain/model/meta/meta_model.dart';
import 'package:my_finance_flutter_3/core/domain/model/operation_state/operation_state_model.dart';
import 'package:my_finance_flutter_3/core/domain/model/operation_type/operation_type_model.dart';
import 'package:my_finance_flutter_3/core/domain/model/payee/payee_model.dart';

part 'template_operation_model.freezed.dart';
part 'template_operation_model.g.dart';

@freezed
class TemplateOperationModel
    with _$TemplateOperationModel, DiagnosticableTreeMixin {
  const TemplateOperationModel._();

  const factory TemplateOperationModel({
    @JsonKey() @Default(MetaModel()) MetaModel meta,
    required String title,
    @Default(0) double value,
    required OperationTypeModel type,
    required OperationStateModel state,
    @Default('') String description,
    required PayeeModel payee,
    required CategoryModel category,
  }) = _TemplateOperationModel;

  factory TemplateOperationModel.fromJson(Map<String, dynamic> json) =>
      _$TemplateOperationModelFromJson(json);
}
