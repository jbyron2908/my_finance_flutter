import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'operation_state_model.freezed.dart';
part 'operation_state_model.g.dart';

@freezed
class OperationStateModel with _$OperationStateModel, DiagnosticableTreeMixin {
  const OperationStateModel._();

  const factory OperationStateModel({
    required String id,
    required String title,
  }) = _OperationStateModel;

  factory OperationStateModel.fromJson(Map<String, dynamic> json) =>
      _$OperationStateModelFromJson(json);
}
