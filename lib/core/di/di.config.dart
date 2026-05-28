// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format width=80

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:cocho/core/di/injection_module.dart' as _i360;
import 'package:cocho/core/networking/api_service/api_service.dart' as _i923;
import 'package:cocho/core/networking/network_info/interface/base_network_info.dart'
    as _i198;
import 'package:cocho/core/networking/network_info/network_info.dart' as _i158;
import 'package:cocho/core/services/app_info/app_info_service.dart' as _i67;
import 'package:cocho/core/services/app_info/interface/base_app_info_service.dart'
    as _i855;
import 'package:cocho/core/services/app_info/interface/base_package_info_adapter.dart'
    as _i893;
import 'package:cocho/core/services/app_info/package_info_plus_adapter.dart'
    as _i460;
import 'package:cocho/core/services/device/device_id_service.dart' as _i304;
import 'package:cocho/core/services/device/interface/base_device_id_service.dart'
    as _i37;
import 'package:cocho/core/services/l10n/l10n_service.dart' as _i607;
import 'package:cocho/core/services/share/base_share_service.dart' as _i325;
import 'package:cocho/core/services/share/share_plus_service.dart' as _i262;
import 'package:cocho/core/services/shared_prefs/base_pref_storage_service.dart'
    as _i499;
import 'package:cocho/core/services/shared_prefs/secure_storage_service.dart'
    as _i640;
import 'package:cocho/core/services/shared_prefs/shared_prefs_service.dart'
    as _i371;
import 'package:cocho/core/services/shared_prefs/storage_facade.dart' as _i458;
import 'package:cocho/core/services/theme/theme_service.dart' as _i230;
import 'package:cocho/core/utils/localization/logic/cubit/localization_cubit.dart'
    as _i559;
import 'package:cocho/core/utils/network/logic/cubit/network_cubit.dart'
    as _i815;
import 'package:cocho/core/utils/theme/data/base_theme_repository.dart'
    as _i770;
import 'package:cocho/core/utils/theme/data/theme_repository.dart' as _i976;
import 'package:cocho/core/utils/theme/logic/cubit/theme_cubit.dart' as _i851;
import 'package:cocho/modules/login/logic/cubit/login_cubit.dart' as _i115;
import 'package:cocho/modules/register/data/repository/register_repository.dart'
    as _i854;
import 'package:cocho/modules/register/logic/cubit/register_cubit.dart'
    as _i333;
import 'package:cocho/modules/register/logic/usecase/register_usecase.dart'
    as _i56;
import 'package:connectivity_plus/connectivity_plus.dart' as _i895;
import 'package:dio/dio.dart' as _i361;
import 'package:flutter_secure_storage/flutter_secure_storage.dart' as _i558;
import 'package:get_it/get_it.dart' as _i174;
import 'package:injectable/injectable.dart' as _i526;
import 'package:package_info_plus/package_info_plus.dart' as _i655;
import 'package:share_plus/share_plus.dart' as _i998;
import 'package:shared_preferences/shared_preferences.dart' as _i460;

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
    gh.lazySingleton<_i607.L10nService>(() => _i607.L10nService());
    gh.lazySingleton<_i230.ThemeService>(() => _i230.ThemeService());
    gh.lazySingleton<_i325.BaseShareService>(
      () => _i262.SharePlusService(gh<_i998.SharePlus>()),
    );
    gh.lazySingleton<_i198.BaseNetworkInfo>(
      () => _i158.NetworkInfo(gh<_i895.Connectivity>()),
    );
    gh.lazySingleton<_i893.BasePackageInfoAdapter>(
      () => _i460.PackageInfoPlusAdapter(gh<_i655.PackageInfo>()),
    );
    gh.lazySingleton<_i559.LocalizationCubit>(
      () => _i559.LocalizationCubit(l10nService: gh<_i607.L10nService>()),
    );
    gh.lazySingleton<_i640.SecureStorageService>(
      () => _i640.SecureStorageService(gh<_i558.FlutterSecureStorage>()),
    );
    gh.lazySingleton<_i371.SharedPrefsService>(
      () => _i371.SharedPrefsService(gh<_i460.SharedPreferences>()),
    );
    gh.lazySingleton<_i855.BaseAppInfoService>(
      () => _i67.AppInfoService(gh<_i893.BasePackageInfoAdapter>()),
    );
    gh.lazySingleton<_i499.BasePrefStorageService>(
      () => _i458.StorageFacade(
        sharedPrefsService: gh<_i371.SharedPrefsService>(),
        secureStorageService: gh<_i640.SecureStorageService>(),
      ),
    );
    gh.lazySingleton<_i37.BaseDeviceIdService>(
      () => _i304.DeviceIdService(gh<_i640.SecureStorageService>()),
    );
    gh.lazySingleton<_i815.NetworkCubit>(
      () => _i815.NetworkCubit(gh<_i198.BaseNetworkInfo>()),
    );
    gh.lazySingleton<_i770.BaseThemeRepository>(
      () => _i976.ThemeRepository(gh<_i499.BasePrefStorageService>()),
    );
    await gh.factoryAsync<_i361.Dio>(
      () => injectionModule.dio(
        gh<_i499.BasePrefStorageService>(),
        gh<_i198.BaseNetworkInfo>(),
        gh<_i815.NetworkCubit>(),
      ),
      preResolve: true,
    );
    gh.factory<_i115.LoginCubit>(
      () => _i115.LoginCubit(gh<_i37.BaseDeviceIdService>()),
    );
    gh.lazySingleton<_i851.ThemeCubit>(
      () => _i851.ThemeCubit(gh<_i770.BaseThemeRepository>()),
    );
    gh.lazySingleton<_i923.ApiService>(
      () => injectionModule.apiService(gh<_i361.Dio>()),
    );
    gh.lazySingleton<_i854.RegisterRepository>(
      () => _i854.RegisterRepositoryImpl(api: gh<_i923.ApiService>()),
    );
    gh.factory<_i56.RegisterUsecase>(
      () => _i56.RegisterUsecase(repo: gh<_i854.RegisterRepository>()),
    );
    gh.factory<_i333.RegisterCubit>(
      () => _i333.RegisterCubit(
        registerUsecase: gh<_i56.RegisterUsecase>(),
        prefStorageService: gh<_i499.BasePrefStorageService>(),
        deviceIdService: gh<_i37.BaseDeviceIdService>(),
      ),
    );
    return this;
  }

  _i607.L10nService get l10nService => get<_i607.L10nService>();

  _i230.ThemeService get themeService => get<_i230.ThemeService>();

  _i262.SharePlusService get sharePlusService => get<_i262.SharePlusService>();

  _i158.NetworkInfo get networkInfo => get<_i158.NetworkInfo>();

  _i460.PackageInfoPlusAdapter get packageInfoPlusAdapter =>
      get<_i460.PackageInfoPlusAdapter>();

  _i559.LocalizationCubit get localizationCubit =>
      get<_i559.LocalizationCubit>();

  _i640.SecureStorageService get secureStorageService =>
      get<_i640.SecureStorageService>();

  _i371.SharedPrefsService get sharedPrefsService =>
      get<_i371.SharedPrefsService>();

  _i67.AppInfoService get appInfoService => get<_i67.AppInfoService>();

  _i458.StorageFacade get storageFacade => get<_i458.StorageFacade>();

  _i304.DeviceIdService get deviceIdService => get<_i304.DeviceIdService>();

  _i815.NetworkCubit get networkCubit => get<_i815.NetworkCubit>();

  _i976.ThemeRepository get themeRepository => get<_i976.ThemeRepository>();

  _i115.LoginCubit get loginCubit => get<_i115.LoginCubit>();

  _i851.ThemeCubit get themeCubit => get<_i851.ThemeCubit>();

  _i854.RegisterRepositoryImpl get registerRepositoryImpl =>
      get<_i854.RegisterRepositoryImpl>();

  _i56.RegisterUsecase get registerUsecase => get<_i56.RegisterUsecase>();

  _i333.RegisterCubit get registerCubit => get<_i333.RegisterCubit>();
}

class _$InjectionModule extends _i360.InjectionModule {}
