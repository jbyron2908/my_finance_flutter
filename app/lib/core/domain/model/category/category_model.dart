import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:my_finance_flutter_3/core/domain/model/icon/icon_model.dart';
import 'package:my_finance_flutter_3/core/domain/model/meta/meta_model.dart';

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
