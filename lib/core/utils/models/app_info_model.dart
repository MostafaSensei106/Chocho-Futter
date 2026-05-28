import 'package:freezed_annotation/freezed_annotation.dart';

part 'app_info_model.freezed.dart';

@freezed
abstract class AppInfoModel with _$AppInfoModel {
  const factory AppInfoModel({
    required String appName,
    required String packageName,
    required String version,
    required String buildNumber,
    required String operatingSystemName,
    required String operatingSystemVersion,
    required String? dartChanal,
    required String dartVersion,
    required String? flutterChanal,
    required String? flutterVersion,
    required DateTime? installDate,
    required DateTime? updateTime,
    required String? installerStore,
    required bool isDebug,
  }) = _AppInfoModel;
}
