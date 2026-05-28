import 'dart:math' as math;
import 'package:flutter/material.dart';
import '../../../../core/utils/theme/app_theme.dart';

class ButterflyPainter extends CustomPainter {
  ButterflyPainter({
    required this.clock,
    required this.flapT,
    required this.driftT,
    required this.hueT,
    required this.shootT,
    required this.cosmosTheme,
  });

  final double clock; // 0→1, loops  (twinkle, bg stars)
  final double flapT; // 0→1 eased   (wing flap scaleX)
  final double driftT; // 0→1, loops  (body wander)
  final double hueT; // 0→1, loops  (line color cycle)
  final double shootT; // 0→1 (shooting star progress)
  final CosmosThemeExtension cosmosTheme;

  // ── Helpers ──────────────────────────────────────────────────────────────

  double _tw(int seed, {double min = 0.4, double max = 1.0}) {
    final t = (clock + seed * 0.19) % 1.0;
    return min + (max - min) * (0.5 + 0.5 * math.sin(t * math.pi * 2));
  }

  /// Cycling color from hue 0–360 based on hueT, offset per segment.
  Color _lineColor(double hueOffset, double opacity) {
    final hue = ((hueT * 360) + hueOffset) % 360;
    return HSVColor.fromAHSV(1.0, hue, 0.6, 0.9).toColor().withValues(alpha: opacity);
  }

  void _drawStar(
    Canvas canvas,
    Offset pos,
    double r,
    Color color,
    int seed, {
    double extraGlow = 0,
  }) {
    final op = _tw(seed);
    // Glow halo
    canvas.drawCircle(
      pos,
      r + 2 + extraGlow,
      Paint()
        ..color = color.withValues(alpha: op * 0.25)
        ..maskFilter = const MaskFilter.blur(BlurStyle.normal, 3),
    );
    // Core
    canvas.drawCircle(pos, r, Paint()..color = color.withValues(alpha: op));
    // Bright center
    canvas.drawCircle(
      pos,
      r * 0.45,
      Paint()..color = Colors.white.withValues(alpha: op * 0.9),
    );
  }

  void _drawLine(Canvas canvas, Offset a, Offset b, Color color) {
    canvas.drawLine(
      a,
      b,
      Paint()
        ..color = color
        ..strokeWidth = 0.9
        ..strokeCap = StrokeCap.round,
    );
  }

  @override
  void paint(Canvas canvas, Size size) {
    // Body drift: slow lissajous wander
    final driftAngle = driftT * math.pi * 2;
    final driftX = math.sin(driftAngle) * 14;
    final driftY = math.sin(driftAngle * 2) * 8;

    final cx = size.width / 2 + driftX;
    final cy = size.height / 2 + 5 + driftY;

    // Wing flap: compress X by flapT (0 = fully open, 1 = folded ~50%)
    final wingScale = 1.0 - flapT * 0.55;

    // ── Background stars ──────────────────────────────────────────────────
    final bgStars = [
      [0.07, 0.05], [0.19, 0.09], [0.31, 0.04], [0.45, 0.07],
      [0.59, 0.03], [0.72, 0.08], [0.85, 0.05], [0.96, 0.10],
      [0.13, 0.16], [0.27, 0.14], [0.91, 0.17], [0.97, 0.26],
      [0.05, 0.32], [0.16, 0.38], [0.95, 0.41], [0.88, 0.50],
      [0.06, 0.59], [0.96, 0.62], [0.12, 0.74], [0.94, 0.77],
      [0.23, 0.85], [0.80, 0.87], [0.41, 0.90], [0.63, 0.91],
    ];
    for (var i = 0; i < bgStars.length; i++) {
      final op = _tw(i + 50, min: 0.15, max: 0.65);
      canvas.drawCircle(
        Offset(bgStars[i][0] * size.width, bgStars[i][1] * size.height),
        0.85,
        Paint()..color = cosmosTheme.glassTextColor.withValues(alpha: op),
      );
    }

    // ── Shooting star ─────────────────────────────────────────────────────
    if (shootT > 0 && shootT < 1) {
      final sx = size.width * 0.15 + shootT * size.width * 0.65;
      final sy = 40.0 + shootT * 80;
      final tailLen = 60.0 * math.sin(shootT * math.pi); // fade tail
      final trailPaint = Paint()
        ..shader = LinearGradient(
          colors: [
            Colors.transparent,
            cosmosTheme.glassTextColor.withValues(alpha: 0.7),
          ],
        ).createShader(
          Rect.fromPoints(Offset(sx - tailLen, sy), Offset(sx, sy)),
        );
      canvas.drawLine(
        Offset(sx - tailLen, sy - tailLen * 0.4),
        Offset(sx, sy),
        trailPaint
          ..strokeWidth = 1.5
          ..strokeCap = StrokeCap.round,
      );
      canvas.drawCircle(
        Offset(sx, sy),
        1.5,
        Paint()..color = Colors.white.withValues(alpha: math.sin(shootT * math.pi)),
      );
    }

    // ── Build wing star positions (apply wingScale around cx) ─────────────
    Offset w(double dx, double dy) => Offset(cx + dx * wingScale, cy + dy);

    // Body (no scale)
    final body = Offset(cx, cy);
    final bodyTop = Offset(cx, cy - 22);
    final bodyBot = Offset(cx, cy + 22);

    // Upper-left wing
    final ul1 = w(-35, -32); final ul2 = w(-65, -55); final ul3 = w(-88, -70); final ul4 = w(-105, -72);
    final ulTip2 = w(-118, -55); final ul5 = w(-92, -45); final ul6 = w(-82, -22); final ul7 = w(-55, -15);

    // Upper-right wing
    final ur1 = w(35, -32); final ur2 = w(65, -55); final ur3 = w(88, -70); final ur4 = w(105, -72);
    final urTip2 = w(118, -55); final ur5 = w(92, -45); final ur6 = w(82, -22); final ur7 = w(55, -15);

    // Lower-left wing
    final ll1 = w(-42, 35); final ll2 = w(-72, 58); final ll3 = w(-92, 85); final llTip = w(-108, 102);
    final ll4 = w(-75, 108); final ll5 = w(-45, 92); final ll6 = w(-22, 70);

    // Lower-right wing
    final lr1 = w(42, 35); final lr2 = w(72, 58); final lr3 = w(92, 85); final lrTip = w(108, 102);
    final lr4 = w(75, 108); final lr5 = w(45, 92); final lr6 = w(22, 70);

    // ── Constellation lines (color-cycled) ────────────────────────────────
    final ulColor = _lineColor(0, 0.30); final urColor = _lineColor(30, 0.30);
    final llColor = _lineColor(180, 0.28); final lrColor = _lineColor(210, 0.28);
    final spineColor = _lineColor(60, 0.35);

    for (final pair in [[body, ul1], [ul1, ul2], [ul2, ul3], [ul3, ul4], [ul4, ulTip2], [ul3, ul5], [ul5, ul6], [ul6, ul7], [ul7, ul1]]) {
      _drawLine(canvas, pair[0], pair[1], ulColor);
    }
    for (final pair in [[body, ur1], [ur1, ur2], [ur2, ur3], [ur3, ur4], [ur4, urTip2], [ur3, ur5], [ur5, ur6], [ur6, ur7], [ur7, ur1]]) {
      _drawLine(canvas, pair[0], pair[1], urColor);
    }
    for (final pair in [[bodyBot, ll1], [ll1, ll2], [ll2, ll3], [ll3, llTip], [ll3, ll4], [ll4, ll5], [ll5, ll6], [ll6, ll1]]) {
      _drawLine(canvas, pair[0], pair[1], llColor);
    }
    for (final pair in [[bodyBot, lr1], [lr1, lr2], [lr2, lr3], [lr3, lrTip], [lr3, lr4], [lr4, lr5], [lr5, lr6], [lr6, lr1]]) {
      _drawLine(canvas, pair[0], pair[1], lrColor);
    }
    _drawLine(canvas, bodyTop, bodyBot, spineColor);

    // ── Stars ─────────────────────────────────────────────────────────────
    _drawStar(canvas, body, 4.2, Colors.white, 0, extraGlow: 3);
    _drawStar(canvas, bodyTop, 2.8, cosmosTheme.glassTextColor, 1);
    _drawStar(canvas, bodyBot, 2.8, cosmosTheme.glassTextColor, 2);

    for (final star in [[ul1, 3.0], [ul2, 2.4], [ul3, 2.8]]) {
      _drawStar(canvas, star[0] as Offset, star[1] as double, cosmosTheme.nebulaColors[0], 3);
    }
    _drawStar(canvas, ul4, 3.2, cosmosTheme.glassTextColor, 6, extraGlow: 2);
    for (final star in [[ulTip2, 2.0], [ul5, 2.2], [ul6, 2.4], [ul7, 2.2]]) {
      _drawStar(canvas, star[0] as Offset, star[1] as double, cosmosTheme.nebulaColors[1], 7);
    }

    for (final star in [[ur1, 3.0], [ur2, 2.4], [ur3, 2.8]]) {
      _drawStar(canvas, star[0] as Offset, star[1] as double, cosmosTheme.nebulaColors[0], 11);
    }
    _drawStar(canvas, ur4, 3.2, cosmosTheme.glassTextColor, 14, extraGlow: 2);
    for (final star in [[urTip2, 2.0], [ur5, 2.2], [ur6, 2.4], [ur7, 2.2]]) {
      _drawStar(canvas, star[0] as Offset, star[1] as double, cosmosTheme.nebulaColors[1], 15);
    }

    for (final star in [[ll1, 2.8], [ll2, 2.4], [ll3, 3.0]]) {
      _drawStar(canvas, star[0] as Offset, star[1] as double, cosmosTheme.nebulaColors[2], 19);
    }
    _drawStar(canvas, llTip, 3.0, cosmosTheme.glassTextColor, 22, extraGlow: 2);
    for (final star in [[ll4, 2.2], [ll5, 2.4], [ll6, 2.2]]) {
      _drawStar(canvas, star[0] as Offset, star[1] as double, cosmosTheme.nebulaColors[2], 23);
    }

    for (final star in [[lr1, 2.8], [lr2, 2.4], [lr3, 3.0]]) {
      _drawStar(canvas, star[0] as Offset, star[1] as double, cosmosTheme.nebulaColors[2], 26);
    }
    _drawStar(canvas, lrTip, 3.0, cosmosTheme.glassTextColor, 29, extraGlow: 2);
    for (final star in [[lr4, 2.2], [lr5, 2.4], [lr6, 2.2]]) {
      _drawStar(canvas, star[0] as Offset, star[1] as double, cosmosTheme.nebulaColors[2], 30);
    }

    // ── Center glow rings ─────────────────────────────────────────────────
    final pulseOp = 0.08 + 0.10 * math.sin(clock * math.pi * 2);
    canvas.drawCircle(body, 13, Paint()..color = cosmosTheme.nebulaColors[0].withValues(alpha: pulseOp)..style = PaintingStyle.stroke..strokeWidth = 1.0);
    canvas.drawCircle(body, 22, Paint()..color = cosmosTheme.nebulaColors[1].withValues(alpha: pulseOp * 0.6)..style = PaintingStyle.stroke..strokeWidth = 0.5);
  }

  @override
  bool shouldRepaint(ButterflyPainter old) =>
      old.clock != clock || old.flapT != flapT || old.driftT != driftT || old.hueT != hueT || old.shootT != shootT || old.cosmosTheme != cosmosTheme;
}
