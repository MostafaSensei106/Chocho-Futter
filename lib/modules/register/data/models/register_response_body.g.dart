// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'register_response_body.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

RegisterResponseBody _$RegisterResponseBodyFromJson(
  Map<String, dynamic> json,
) => RegisterResponseBody(
  data: RegisterResponseData.fromJson(json['data'] as Map<String, dynamic>),
  success: json['success'] as bool,
);

Map<String, dynamic> _$RegisterResponseBodyToJson(
  RegisterResponseBody instance,
) => <String, dynamic>{'success': instance.success, 'data': instance.data};

RegisterResponseData _$RegisterResponseDataFromJson(
  Map<String, dynamic> json,
) => RegisterResponseData(
  user: User.fromJson(json['user'] as Map<String, dynamic>),
  token: json['token'] as String,
);

Map<String, dynamic> _$RegisterResponseDataToJson(
  RegisterResponseData instance,
) => <String, dynamic>{'user': instance.user, 'token': instance.token};

User _$UserFromJson(Map<String, dynamic> json) => User(
  id: json['id'] as String,
  username: json['username'] as String,
  stats: UserStats.fromJson(json['stats'] as Map<String, dynamic>),
);

Map<String, dynamic> _$UserToJson(User instance) => <String, dynamic>{
  'id': instance.id,
  'username': instance.username,
  'stats': instance.stats,
};

UserStats _$UserStatsFromJson(Map<String, dynamic> json) => UserStats(
  level: (json['level'] as num).toInt(),
  experience: (json['experience'] as num).toInt(),
  coins: (json['coins'] as num).toInt(),
  trustScore: (json['trust_score'] as num).toInt(),
  currentStreak: (json['current_streak'] as num).toInt(),
  totalTips: (json['total_tips'] as num).toInt(),
  lastPlayedAt: json['last_played_at'] as String,
);

Map<String, dynamic> _$UserStatsToJson(UserStats instance) => <String, dynamic>{
  'level': instance.level,
  'experience': instance.experience,
  'coins': instance.coins,
  'trust_score': instance.trustScore,
  'current_streak': instance.currentStreak,
  'total_tips': instance.totalTips,
  'last_played_at': instance.lastPlayedAt,
};
