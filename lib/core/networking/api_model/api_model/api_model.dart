import 'package:json_annotation/json_annotation.dart';

part 'api_model.g.dart';

@JsonSerializable(genericArgumentFactories: true)
class ApiModel<T> {
  ApiModel({required this.success, required this.data});
  final bool success;
  final T data;
}
