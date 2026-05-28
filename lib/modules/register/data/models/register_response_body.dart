import 'package:json_annotation/json_annotation.dart';
import '../../../../core/networking/api_model/api_model/api_model.dart';

part 'register_response_body.g.dart';

@JsonSerializable()
class RegisterResponseBody extends ApiModel<RegisterResponseData> {
  RegisterResponseBody({required super.data, required super.success});

  factory RegisterResponseBody.fromJson(Map<String, dynamic> json) =>
      _$RegisterResponseBodyFromJson(json);
}

@JsonSerializable()
class RegisterResponseData {
  RegisterResponseData({required this.user, required this.token});

  factory RegisterResponseData.fromJson(Map<String, dynamic> json) =>
      _$RegisterResponseDataFromJson(json);
  final User user;
  final String token;
}

@JsonSerializable()
class User {
  User({required this.id, required this.username, required this.stats});

  factory User.fromJson(Map<String, dynamic> json) => _$UserFromJson(json);
  final String id;
  @JsonKey(name: 'username')
  final String username;
  @JsonKey(name: 'stats')
  final UserStats stats;
}

@JsonSerializable()
class UserStats {
  UserStats({
    required this.level,
    required this.experience,
    required this.coins,
    required this.trustScore,
    required this.currentStreak,
    required this.totalTips,
    required this.lastPlayedAt,
  });

  factory UserStats.fromJson(Map<String, dynamic> json) =>
      _$UserStatsFromJson(json);
  final int level;
  final int experience;
  final int coins;
  @JsonKey(name: 'trust_score')
  final int trustScore;
  @JsonKey(name: 'current_streak')
  final int currentStreak;
  @JsonKey(name: 'total_tips')
  final int totalTips;
  @JsonKey(name: 'last_played_at')
  final String lastPlayedAt;
}
