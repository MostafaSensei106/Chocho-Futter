// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format width=80

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:connectivity_plus/connectivity_plus.dart' as _i895;
import 'package:dio/dio.dart' as _i361;
import 'package:flutter_secure_storage/flutter_secure_storage.dart' as _i558;
import 'package:get_it/get_it.dart' as _i174;
import 'package:injectable/injectable.dart' as _i526;
import 'package:package_info_plus/package_info_plus.dart' as _i655;
import 'package:share_plus/share_plus.dart' as _i998;
import 'package:shared_preferences/shared_preferences.dart' as _i460;
import 'package:temp/core/di/injection_module.dart' as _i380;
import 'package:temp/core/networking/api_service/api_service.dart' as _i882;
import 'package:temp/core/networking/network_info/interface/base_network_info.dart'
    as _i373;
import 'package:temp/core/networking/network_info/network_info.dart' as _i566;
import 'package:temp/core/services/app_info/app_info_service.dart' as _i1041;
import 'package:temp/core/services/app_info/interface/base_app_info_service.dart'
    as _i918;
import 'package:temp/core/services/app_info/interface/base_package_info_adapter.dart'
    as _i469;
import 'package:temp/core/services/app_info/package_info_plus_adapter.dart'
    as _i39;
import 'package:temp/core/services/share/base_share_service.dart' as _i567;
import 'package:temp/core/services/share/share_plus_service.dart' as _i391;
import 'package:temp/core/services/shared_prefs/base_pref_storage_service.dart'
    as _i1014;
import 'package:temp/core/services/shared_prefs/secure_storage_service.dart'
    as _i360;
import 'package:temp/core/services/shared_prefs/shared_prefs_service.dart'
    as _i657;
import 'package:temp/core/services/shared_prefs/storage_facade.dart' as _i185;
import 'package:temp/core/services/theme/theme_service.dart' as _i820;
import 'package:temp/core/utils/network/logic/cubit/network_cubit.dart'
    as _i125;
import 'package:temp/core/utils/theme/data/base_theme_repository.dart' as _i968;
import 'package:temp/core/utils/theme/data/theme_repository.dart' as _i941;
import 'package:temp/core/utils/theme/logic/cubit/theme_cubit.dart' as _i512;

extension GetItInjectableX on _i174.GetIt {
  // initializes the registration of main-scope dependencies inside of GetIt
  Future<_i174.GetIt> init({
    String? environment,
    _i526.EnvironmentFilter? environmentFilter,
  }) async {
    final gh = _i526.GetItHelper(this, environment, environmentFilter);
    final injectionModule = _$InjectionModule();
    await gh.factoryAsync<_i460.SharedPreferences>(
      () => injectionModule.prefs,
      preResolve: true,
    );
    await gh.factoryAsync<_i655.PackageInfo>(
      () => injectionModule.packageInfo,
      preResolve: true,
    );
    gh.lazySingleton<_i558.FlutterSecureStorage>(
      () => injectionModule.secureStorage,
    );
    gh.lazySingleton<_i998.SharePlus>(() => injectionModule.sharePlus);
    gh.lazySingleton<_i895.Connectivity>(() => injectionModule.connectivity);
    gh.lazySingleton<_i820.ThemeService>(() => _i820.ThemeService());
    gh.lazySingleton<_i567.BaseShareService>(
      () => _i391.SharePlusService(gh<_i998.SharePlus>()),
    );
    gh.lazySingleton<_i469.BasePackageInfoAdapter>(
      () => _i39.PackageInfoPlusAdapter(gh<_i655.PackageInfo>()),
    );
    gh.lazySingleton<_i373.BaseNetworkInfo>(
      () => _i566.NetworkInfo(gh<_i895.Connectivity>()),
    );
    gh.lazySingleton<_i360.SecureStorageService>(
      () => _i360.SecureStorageService(gh<_i558.FlutterSecureStorage>()),
    );
    gh.lazySingleton<_i657.SharedPrefsService>(
      () => _i657.SharedPrefsService(gh<_i460.SharedPreferences>()),
    );
    gh.lazySingleton<_i125.NetworkCubit>(
      () => _i125.NetworkCubit(gh<_i373.BaseNetworkInfo>()),
    );
    gh.lazySingleton<_i918.BaseAppInfoService>(
      () => _i1041.AppInfoService(gh<_i469.BasePackageInfoAdapter>()),
    );
    gh.lazySingleton<_i1014.BasePrefStorageService>(
      () => _i185.StorageFacade(
        sharedPrefsService: gh<_i657.SharedPrefsService>(),
        secureStorageService: gh<_i360.SecureStorageService>(),
      ),
    );
    gh.lazySingleton<_i968.BaseThemeRepository>(
      () => _i941.ThemeRepository(gh<_i1014.BasePrefStorageService>()),
    );
    await gh.factoryAsync<_i361.Dio>(
      () => injectionModule.dio(
        gh<_i1014.BasePrefStorageService>(),
        gh<_i373.BaseNetworkInfo>(),
        gh<_i125.NetworkCubit>(),
      ),
      preResolve: true,
    );
    gh.lazySingleton<_i512.ThemeCubit>(
      () => _i512.ThemeCubit(gh<_i968.BaseThemeRepository>()),
    );
    gh.lazySingleton<_i882.ApiService>(
      () => injectionModule.apiService(gh<_i361.Dio>()),
    );
    return this;
  }

  _i820.ThemeService get themeService => get<_i820.ThemeService>();

  _i391.SharePlusService get sharePlusService => get<_i391.SharePlusService>();

  _i39.PackageInfoPlusAdapter get packageInfoPlusAdapter =>
      get<_i39.PackageInfoPlusAdapter>();

  _i566.NetworkInfo get networkInfo => get<_i566.NetworkInfo>();

  _i360.SecureStorageService get secureStorageService =>
      get<_i360.SecureStorageService>();

  _i657.SharedPrefsService get sharedPrefsService =>
      get<_i657.SharedPrefsService>();

  _i125.NetworkCubit get networkCubit => get<_i125.NetworkCubit>();

  _i1041.AppInfoService get appInfoService => get<_i1041.AppInfoService>();

  _i185.StorageFacade get storageFacade => get<_i185.StorageFacade>();

  _i941.ThemeRepository get themeRepository => get<_i941.ThemeRepository>();

  _i512.ThemeCubit get themeCubit => get<_i512.ThemeCubit>();
}

class _$InjectionModule extends _i380.InjectionModule {}
