import 'package:database_domain/src/model/icon/icon_model.dart';
import 'package:database_domain/src/model/meta/meta_model.dart';
import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'category_model.freezed.dart';
part 'category_model.g.dart';

@freezed
class CategoryModel with _$CategoryModel, DiagnosticableTreeMixin {
  const CategoryModel._();

  const factory CategoryModel({
    @JsonKey() @Default(MetaModel()) MetaModel meta,
    required String name,
    required IconModel icon,
    CategoryModel? parent,
  }) = _CategoryModel;

  factory CategoryModel.fromJson(Map<String, dynamic> json) =>
      _$CategoryModelFromJson(json);
}
