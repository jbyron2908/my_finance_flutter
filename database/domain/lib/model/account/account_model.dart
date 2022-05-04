import 'package:domain/model/meta/meta_model.dart';
import 'package:domain/model/profile/profile_model.dart';
import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'account_model.freezed.dart';
part 'account_model.g.dart';

@freezed
class AccountModel with _$AccountModel, DiagnosticableTreeMixin {
  const AccountModel._();

  const factory AccountModel({
    @JsonKey() @Default(MetaModel()) MetaModel meta,
    required String name,
    required String type,
    required ProfileModel profile,
  }) = _AccountModel;

  factory AccountModel.fromJson(Map<String, dynamic> json) =>
      _$AccountModelFromJson(json);
}
