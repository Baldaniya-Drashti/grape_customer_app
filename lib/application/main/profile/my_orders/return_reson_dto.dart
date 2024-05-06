import 'package:freezed_annotation/freezed_annotation.dart';

part 'return_reson_dto.freezed.dart';
part 'return_reson_dto.g.dart';

@freezed
class ReturnReasonModel with _$ReturnReasonModel {
  const factory ReturnReasonModel({
    int? id,
    String? reason,
  }) = _ReturnReasonModel;

  factory ReturnReasonModel.fromJson(Map<String, dynamic> json) =>
      _$ReturnReasonModelFromJson(json);
}
