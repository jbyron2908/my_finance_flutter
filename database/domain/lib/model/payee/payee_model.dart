import 'package:domain/model/meta/meta_model.dart';
import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'payee_model.freezed.dart';
part 'payee_model.g.dart';

@freezed
class PayeeModel with _$PayeeModel, DiagnosticableTreeMixin {
  const PayeeModel._();

  const factory PayeeModel({
    @JsonKey() @Default(MetaModel()) MetaModel meta,
    required String name,
  }) = _PayeeModel;

  factory PayeeModel.fromJson(Map<String, dynamic> json) =>
      _$PayeeModelFromJson(json);
}
