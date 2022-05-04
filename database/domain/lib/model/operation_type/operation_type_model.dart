import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'operation_type_model.freezed.dart';
part 'operation_type_model.g.dart';

@freezed
class OperationTypeModel with _$OperationTypeModel, DiagnosticableTreeMixin {
  const OperationTypeModel._();

  const factory OperationTypeModel({
    required String id,
    required String title,
  }) = _OperationTypeModel;

  factory OperationTypeModel.fromJson(Map<String, dynamic> json) =>
      _$OperationTypeModelFromJson(json);
}
