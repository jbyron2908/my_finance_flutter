import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:my_finance_flutter_3/core/domain/model/meta/meta_model.dart';

part 'profile_model.freezed.dart';
part 'profile_model.g.dart';

@freezed
class ProfileModel with _$ProfileModel, DiagnosticableTreeMixin {
  const ProfileModel._();

  const factory ProfileModel({
    @JsonKey() @Default(MetaModel()) MetaModel meta,
    required String name,
    required String currency,
  }) = _ProfileModel;

  factory ProfileModel.fromJson(Map<String, dynamic> json) =>
      _$ProfileModelFromJson(json);
}
