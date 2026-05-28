import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../../constants/app_config.dart';

@immutable
class CosmosThemeExtension extends ThemeExtension<CosmosThemeExtension> {
  const CosmosThemeExtension({
    required this.glassBackgroundColor,
    required this.glassBorderColor,
    required this.glassTextColor,
    required this.skyGradientColors,
    required this.nebulaColors,
    required this.textFieldFillColor,
    required this.textFieldBorderColor,
    required this.textFieldFocusedBorderColor,
  });

  final Color glassBackgroundColor;
  final Color glassBorderColor;
  final Color glassTextColor;
  final List<Color> skyGradientColors;
  final List<Color> nebulaColors;
  final Color textFieldFillColor;
  final Color textFieldBorderColor;
  final Color textFieldFocusedBorderColor;

  @override
  CosmosThemeExtension copyWith({
    Color? glassBackgroundColor,
    Color? glassBorderColor,
    Color? glassTextColor,
    List<Color>? skyGradientColors,
    List<Color>? nebulaColors,
    Color? textFieldFillColor,
    Color? textFieldBorderColor,
    Color? textFieldFocusedBorderColor,
  }) {
    return CosmosThemeExtension(
      glassBackgroundColor: glassBackgroundColor ?? this.glassBackgroundColor,
      glassBorderColor: glassBorderColor ?? this.glassBorderColor,
      glassTextColor: glassTextColor ?? this.glassTextColor,
      skyGradientColors: skyGradientColors ?? this.skyGradientColors,
      nebulaColors: nebulaColors ?? this.nebulaColors,
      textFieldFillColor: textFieldFillColor ?? this.textFieldFillColor,
      textFieldBorderColor: textFieldBorderColor ?? this.textFieldBorderColor,
      textFieldFocusedBorderColor:
          textFieldFocusedBorderColor ?? this.textFieldFocusedBorderColor,
    );
  }

  @override
  CosmosThemeExtension lerp(
    ThemeExtension<CosmosThemeExtension>? other,
    double t,
  ) {
    final otherExtension = other as CosmosThemeExtension;
    return CosmosThemeExtension(
      glassBackgroundColor: Color.lerp(
        glassBackgroundColor,
        otherExtension.glassBackgroundColor,
        t,
      )!,
      glassBorderColor: Color.lerp(
        glassBorderColor,
        otherExtension.glassBorderColor,
        t,
      )!,
      glassTextColor: Color.lerp(
        glassTextColor,
        otherExtension.glassTextColor,
        t,
      )!,
      skyGradientColors: List.generate(
        skyGradientColors.length,
        (i) => Color.lerp(
          skyGradientColors[i],
          otherExtension.skyGradientColors[i],
          t,
        )!,
      ),
      nebulaColors: List.generate(
        nebulaColors.length,
        (i) => Color.lerp(nebulaColors[i], otherExtension.nebulaColors[i], t)!,
      ),
      textFieldFillColor: Color.lerp(
        textFieldFillColor,
        otherExtension.textFieldFillColor,
        t,
      )!,
      textFieldBorderColor: Color.lerp(
        textFieldBorderColor,
        otherExtension.textFieldBorderColor,
        t,
      )!,
      textFieldFocusedBorderColor: Color.lerp(
        textFieldFocusedBorderColor,
        otherExtension.textFieldFocusedBorderColor,
        t,
      )!,
    );
  }
}

final class AppTheme {
  static const _cosmosDark = CosmosThemeExtension(
    glassBackgroundColor: Color(0xFF0D0828),
    glassBorderColor: Color(0x33C8B4FF),
    glassTextColor: Color(0xFFC8B4FF),
    skyGradientColors: [
      Color(0xFF14093E),
      Color(0xFF08051E),
      Color(0xFF06060F),
    ],
    nebulaColors: [Color(0xFF5530CC), Color(0xFF2A1580), Color(0xFF7040DD)],
    textFieldFillColor: Color(0xFF0E0B28),
    textFieldBorderColor: Color(0xFF2A1F5A),
    textFieldFocusedBorderColor: Color(0xFFC8B4FF),
  );

  static ThemeData light = ThemeData(
    useMaterial3: true,
    fontFamily: 'Hadidi',
    extensions: const [
      _cosmosDark,
    ], // Defaulting to cosmos dark for now as it's the app style
    colorScheme: const ColorScheme(
      brightness: Brightness.light,
      primary: Color(0xff000454),
      surfaceTint: Color(0xff4f57a6),
      onPrimary: Color(0xffffffff),
      primaryContainer: Color(0xff161e6e),
      onPrimaryContainer: Color(0xff818add),
      secondary: Color(0xff595c7d),
      onSecondary: Color(0xffffffff),
      secondaryContainer: Color(0xffd5d7fe),
      onSecondaryContainer: Color(0xff5a5d7d),
      tertiary: Color(0xff290034),
      onTertiary: Color(0xffffffff),
      tertiaryContainer: Color(0xff460d53),
      onTertiaryContainer: Color(0xffb979c3),
      error: Color(0xffba1a1a),
      onError: Color(0xffffffff),
      errorContainer: Color(0xffffdad6),
      onErrorContainer: Color(0xff93000a),
      surface: Color(0xfffbf8ff),
      onSurface: Color(0xff1b1b20),
      onSurfaceVariant: Color(0xff464651),
      outline: Color(0xff767682),
      outlineVariant: Color(0xffc6c5d3),
      shadow: Color(0xff000000),
      scrim: Color(0xff000000),
      inverseSurface: Color(0xff303036),
      inversePrimary: Color(0xffbdc2ff),
      primaryFixed: Color(0xffe0e0ff),
      onPrimaryFixed: Color(0xff030b61),
      primaryFixedDim: Color(0xffbdc2ff),
      onPrimaryFixedVariant: Color(0xff373f8d),
      secondaryFixed: Color(0xffe0e0ff),
      onSecondaryFixed: Color(0xff161936),
      secondaryFixedDim: Color(0xffc2c4e9),
      onSecondaryFixedVariant: Color(0xff424464),
      tertiaryFixed: Color(0xfffed6ff),
      onTertiaryFixed: Color(0xff350041),
      tertiaryFixedDim: Color(0xfff4aefd),
      onTertiaryFixedVariant: Color(0xff682f73),
      surfaceDim: Color(0xffdbd9e0),
      surfaceBright: Color(0xfffbf8ff),
      surfaceContainerLowest: Color(0xffffffff),
      surfaceContainerLow: Color(0xfff5f2fa),
      surfaceContainer: Color(0xffefedf4),
      surfaceContainerHigh: Color(0xffeae7ee),
      surfaceContainerHighest: Color(0xffe4e1e9),
    ),
    appBarTheme: const AppBarTheme(
      elevation: 0,
      scrolledUnderElevation: 0,
      centerTitle: true,
    ),
    dialogTheme: DialogThemeData(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(AppConfig.outBorderRadius),
      ),
    ),
    floatingActionButtonTheme: const FloatingActionButtonThemeData(
      elevation: 0,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.all(
          Radius.circular(AppConfig.outBorderRadius),
        ),
      ),
    ),
    pageTransitionsTheme: const PageTransitionsTheme(
      builders: {
        TargetPlatform.android: CupertinoPageTransitionsBuilder(),
        TargetPlatform.iOS: CupertinoPageTransitionsBuilder(),
      },
    ),
  );

  static ThemeData dark = ThemeData(
    useMaterial3: true,
    fontFamily: 'Hadidi',
    extensions: const [_cosmosDark],
    colorScheme: const ColorScheme(
      brightness: Brightness.dark,
      primary: Color(0xffbdc2ff),
      surfaceTint: Color(0xffbdc2ff),
      onPrimary: Color(0xff1e2675),
      primaryContainer: Color(0xff161e6e),
      onPrimaryContainer: Color(0xff818add),
      secondary: Color(0xffc2c4e9),
      onSecondary: Color(0xff2b2e4c),
      secondaryContainer: Color(0xff424464),
      onSecondaryContainer: Color(0xffb0b2d7),
      tertiary: Color(0xfff4aefd),
      onTertiary: Color(0xff4e175b),
      tertiaryContainer: Color(0xff460d53),
      onTertiaryContainer: Color(0xffb979c3),
      error: Color(0xffffb4ab),
      onError: Color(0xff690005),
      errorContainer: Color(0xff93000a),
      onErrorContainer: Color(0xffffdad6),
      surface: Color(0xff131318),
      onSurface: Color(0xffe4e1e9),
      onSurfaceVariant: Color(0xffc6c5d3),
      outline: Color(0xff908f9c),
      outlineVariant: Color(0xff464651),
      shadow: Color(0xff000000),
      scrim: Color(0xff000000),
      inverseSurface: Color(0xffe4e1e9),
      inversePrimary: Color(0xff4f57a6),
      primaryFixed: Color(0xffe0e0ff),
      onPrimaryFixed: Color(0xff030b61),
      primaryFixedDim: Color(0xffbdc2ff),
      onPrimaryFixedVariant: Color(0xff373f8d),
      secondaryFixed: Color(0xffe0e0ff),
      onSecondaryFixed: Color(0xff161936),
      secondaryFixedDim: Color(0xffc2c4e9),
      onSecondaryFixedVariant: Color(0xff424464),
      tertiaryFixed: Color(0xfffed6ff),
      onTertiaryFixed: Color(0xff350041),
      tertiaryFixedDim: Color(0xfff4aefd),
      onTertiaryFixedVariant: Color(0xff682f73),
      surfaceDim: Color(0xff131318),
      surfaceBright: Color(0xff39393e),
      surfaceContainerLowest: Color(0xff0e0e13),
      surfaceContainerLow: Color(0xff1b1b20),
      surfaceContainer: Color(0xff1f1f24),
      surfaceContainerHigh: Color(0xff2a292f),
      surfaceContainerHighest: Color(0xff34343a),
    ),
    appBarTheme: const AppBarTheme(
      elevation: 0,
      scrolledUnderElevation: 0,
      centerTitle: true,
    ),
    dialogTheme: DialogThemeData(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(AppConfig.outBorderRadius),
      ),
    ),
    floatingActionButtonTheme: const FloatingActionButtonThemeData(
      elevation: 0,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.all(
          Radius.circular(AppConfig.outBorderRadius),
        ),
      ),
    ),
    pageTransitionsTheme: const PageTransitionsTheme(
      builders: {
        TargetPlatform.android: CupertinoPageTransitionsBuilder(),
        TargetPlatform.iOS: CupertinoPageTransitionsBuilder(),
      },
    ),
  );
}
