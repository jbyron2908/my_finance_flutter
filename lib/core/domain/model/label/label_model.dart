import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:my_finance_flutter_3/core/domain/model/meta/meta_model.dart';

part 'label_model.freezed.dart';
part 'label_model.g.dart';

@freezed
class LabelModel with _$LabelModel, DiagnosticableTreeMixin {
  const LabelModel._();

  const factory LabelModel({
    @JsonKey() @Default(MetaModel()) MetaModel meta,
    required String name,
  }) = _LabelModel;

  factory LabelModel.fromJson(Map<String, dynamic> json) =>
      _$LabelModelFromJson(json);
}
