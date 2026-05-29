// ignore_for_file: deprecated_member_use
import 'dart:async';
import 'dart:math' as math;
import 'dart:ui' as ui;
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';

// =============================================================================
// ULTIMATE GALAXY BACKGROUND + CONSTELLATION LOOP
//
// Key idea: ConstellationOverlay receives the SAME List<Star> the galaxy
// painter renders.  For each constellation template it snaps every vertex
// to the nearest real star already on screen — no new stars are created.
// Lines then travel point-to-point between those real star positions.
// =============================================================================

// =============================================================================
// SECTION 1 — Constellation templates
// Positions are normalised (0..1).  The overlay will snap each vertex to the
// closest real Star in the shared pool.
// =============================================================================

class ConstellationTemplate {
  final String name;
  final List<Offset> shape; // normalised anchor points
  final List<(int, int)> edges;
  final Color color;
  const ConstellationTemplate({
    required this.name,
    required this.shape,
    required this.edges,
    required this.color,
  });
}

const List<ConstellationTemplate> kTemplates = [
  ConstellationTemplate(
    name: 'Orion',
    color: Color(0xFF88CCFF),
    shape: [
      Offset(0.48, 0.18),
      Offset(0.54, 0.16),
      Offset(0.48, 0.28),
      Offset(0.51, 0.27),
      Offset(0.54, 0.26),
      Offset(0.46, 0.36),
      Offset(0.56, 0.34),
      Offset(0.51, 0.14),
    ],
    edges: [
      (0, 1),
      (0, 2),
      (1, 4),
      (2, 3),
      (3, 4),
      (2, 5),
      (4, 6),
      (0, 7),
      (1, 7),
    ],
  ),
  ConstellationTemplate(
    name: 'Ursa Major',
    color: Color(0xFFAADDFF),
    shape: [
      Offset(0.14, 0.12),
      Offset(0.19, 0.15),
      Offset(0.22, 0.20),
      Offset(0.18, 0.22),
      Offset(0.14, 0.28),
      Offset(0.09, 0.32),
      Offset(0.05, 0.38),
    ],
    edges: [(0, 1), (1, 2), (2, 3), (3, 4), (4, 5), (5, 6), (0, 3)],
  ),
  ConstellationTemplate(
    name: 'Cassiopeia',
    color: Color(0xFFCCAAFF),
    shape: [
      Offset(0.72, 0.08),
      Offset(0.77, 0.12),
      Offset(0.80, 0.08),
      Offset(0.85, 0.11),
      Offset(0.89, 0.07),
    ],
    edges: [(0, 1), (1, 2), (2, 3), (3, 4)],
  ),
  ConstellationTemplate(
    name: 'Scorpius',
    color: Color(0xFFFF8877),
    shape: [
      Offset(0.62, 0.50),
      Offset(0.60, 0.45),
      Offset(0.63, 0.42),
      Offset(0.66, 0.45),
      Offset(0.68, 0.50),
      Offset(0.65, 0.58),
      Offset(0.62, 0.64),
      Offset(0.60, 0.70),
      Offset(0.63, 0.74),
      Offset(0.66, 0.72),
    ],
    edges: [
      (0, 1),
      (1, 2),
      (2, 3),
      (3, 4),
      (4, 5),
      (5, 6),
      (6, 7),
      (7, 8),
      (8, 9),
    ],
  ),
  ConstellationTemplate(
    name: 'Leo',
    color: Color(0xFFFFDD88),
    shape: [
      Offset(0.30, 0.38),
      Offset(0.28, 0.32),
      Offset(0.31, 0.28),
      Offset(0.36, 0.29),
      Offset(0.39, 0.33),
      Offset(0.38, 0.38),
      Offset(0.35, 0.42),
    ],
    edges: [(0, 1), (1, 2), (2, 3), (3, 4), (4, 5), (5, 6), (6, 0), (3, 5)],
  ),
  ConstellationTemplate(
    name: 'Lyra',
    color: Color(0xFFEEFFAA),
    shape: [
      Offset(0.70, 0.22),
      Offset(0.68, 0.28),
      Offset(0.72, 0.30),
      Offset(0.74, 0.27),
      Offset(0.73, 0.24),
    ],
    edges: [(0, 1), (1, 2), (2, 3), (3, 4), (4, 0), (1, 3), (2, 4)],
  ),
  ConstellationTemplate(
    name: 'Cygnus',
    color: Color(0xFFBBEEFF),
    shape: [
      Offset(0.58, 0.20),
      Offset(0.60, 0.26),
      Offset(0.62, 0.32),
      Offset(0.56, 0.27),
      Offset(0.64, 0.27),
    ],
    edges: [(0, 1), (1, 2), (3, 4), (3, 1), (1, 4)],
  ),
  ConstellationTemplate(
    name: 'Perseus',
    color: Color(0xFFDDCCFF),
    shape: [
      Offset(0.38, 0.10),
      Offset(0.40, 0.14),
      Offset(0.38, 0.18),
      Offset(0.35, 0.21),
      Offset(0.33, 0.17),
      Offset(0.34, 0.12),
      Offset(0.36, 0.08),
    ],
    edges: [(0, 1), (1, 2), (2, 3), (3, 4), (4, 5), (5, 6), (6, 0), (1, 5)],
  ),
  ConstellationTemplate(
    name: 'Gemini',
    color: Color(0xFFFFCCCC),
    shape: [
      Offset(0.22, 0.25),
      Offset(0.24, 0.25),
      Offset(0.21, 0.30),
      Offset(0.23, 0.30),
      Offset(0.20, 0.36),
      Offset(0.22, 0.36),
      Offset(0.19, 0.42),
      Offset(0.23, 0.42),
    ],
    edges: [
      (0, 2),
      (2, 4),
      (4, 6),
      (1, 3),
      (3, 5),
      (5, 7),
      (0, 1),
      (4, 5),
      (6, 7),
    ],
  ),
  ConstellationTemplate(
    name: 'Taurus',
    color: Color(0xFFFFBB88),
    shape: [
      Offset(0.34, 0.32),
      Offset(0.31, 0.30),
      Offset(0.28, 0.32),
      Offset(0.26, 0.28),
      Offset(0.30, 0.26),
      Offset(0.36, 0.27),
      Offset(0.37, 0.24),
    ],
    edges: [(0, 1), (1, 2), (2, 3), (1, 4), (4, 5), (5, 6), (0, 5)],
  ),
  ConstellationTemplate(
    name: 'Virgo',
    color: Color(0xFFAAFFCC),
    shape: [
      Offset(0.42, 0.55),
      Offset(0.44, 0.50),
      Offset(0.46, 0.45),
      Offset(0.43, 0.42),
      Offset(0.48, 0.48),
      Offset(0.50, 0.52),
      Offset(0.47, 0.58),
    ],
    edges: [(0, 1), (1, 2), (2, 3), (2, 4), (4, 5), (1, 6), (6, 0)],
  ),
  ConstellationTemplate(
    name: 'Sagittarius',
    color: Color(0xFFFFEE88),
    shape: [
      Offset(0.50, 0.62),
      Offset(0.53, 0.60),
      Offset(0.56, 0.62),
      Offset(0.57, 0.66),
      Offset(0.53, 0.68),
      Offset(0.50, 0.66),
      Offset(0.54, 0.64),
      Offset(0.58, 0.60),
    ],
    edges: [
      (0, 1),
      (1, 2),
      (2, 3),
      (3, 4),
      (4, 5),
      (5, 0),
      (1, 6),
      (6, 4),
      (2, 7),
      (7, 1),
    ],
  ),
  ConstellationTemplate(
    name: 'Andromeda',
    color: Color(0xFFEECCFF),
    shape: [
      Offset(0.80, 0.18),
      Offset(0.76, 0.20),
      Offset(0.72, 0.22),
      Offset(0.68, 0.20),
      Offset(0.74, 0.16),
      Offset(0.70, 0.14),
    ],
    edges: [(0, 1), (1, 2), (2, 3), (1, 4), (4, 5)],
  ),
  ConstellationTemplate(
    name: 'Pegasus',
    color: Color(0xFFDDEEFF),
    shape: [
      Offset(0.82, 0.22),
      Offset(0.88, 0.22),
      Offset(0.88, 0.28),
      Offset(0.82, 0.28),
      Offset(0.76, 0.24),
    ],
    edges: [(0, 1), (1, 2), (2, 3), (3, 0), (0, 4)],
  ),
  ConstellationTemplate(
    name: 'Draco',
    color: Color(0xFFBBFFDD),
    shape: [
      Offset(0.42, 0.08),
      Offset(0.44, 0.10),
      Offset(0.42, 0.13),
      Offset(0.40, 0.12),
      Offset(0.38, 0.16),
      Offset(0.36, 0.20),
      Offset(0.32, 0.22),
      Offset(0.28, 0.18),
      Offset(0.26, 0.14),
    ],
    edges: [
      (0, 1),
      (1, 2),
      (2, 3),
      (3, 0),
      (3, 4),
      (4, 5),
      (5, 6),
      (6, 7),
      (7, 8),
    ],
  ),
  ConstellationTemplate(
    name: 'Aquarius',
    color: Color(0xFF88DDFF),
    shape: [
      Offset(0.75, 0.52),
      Offset(0.78, 0.55),
      Offset(0.76, 0.60),
      Offset(0.73, 0.62),
      Offset(0.79, 0.63),
      Offset(0.77, 0.68),
    ],
    edges: [(0, 1), (1, 2), (2, 3), (2, 4), (4, 5), (3, 5)],
  ),
  ConstellationTemplate(
    name: 'Capricornus',
    color: Color(0xFFCCFFEE),
    shape: [
      Offset(0.68, 0.62),
      Offset(0.70, 0.60),
      Offset(0.74, 0.62),
      Offset(0.76, 0.66),
      Offset(0.72, 0.70),
      Offset(0.68, 0.68),
    ],
    edges: [(0, 1), (1, 2), (2, 3), (3, 4), (4, 5), (5, 0), (1, 5)],
  ),
  ConstellationTemplate(
    name: 'Aquila',
    color: Color(0xFFFFFFBB),
    shape: [
      Offset(0.55, 0.42),
      Offset(0.53, 0.40),
      Offset(0.57, 0.40),
      Offset(0.55, 0.47),
      Offset(0.54, 0.52),
    ],
    edges: [(1, 0), (0, 2), (0, 3), (3, 4)],
  ),
  ConstellationTemplate(
    name: 'Aries',
    color: Color(0xFFFFDDBB),
    shape: [
      Offset(0.88, 0.28),
      Offset(0.85, 0.30),
      Offset(0.83, 0.27),
      Offset(0.86, 0.24),
    ],
    edges: [(0, 1), (1, 2), (2, 3)],
  ),
  ConstellationTemplate(
    name: 'Pisces',
    color: Color(0xFFAABBFF),
    shape: [
      Offset(0.82, 0.38),
      Offset(0.85, 0.35),
      Offset(0.88, 0.38),
      Offset(0.87, 0.42),
      Offset(0.84, 0.44),
      Offset(0.80, 0.42),
      Offset(0.78, 0.48),
      Offset(0.76, 0.52),
    ],
    edges: [(0, 1), (1, 2), (2, 3), (3, 4), (4, 5), (5, 0), (5, 6), (6, 7)],
  ),
];

// =============================================================================
// SECTION 2 — Snap helper
// Given the template shape and the pool of real stars already on screen,
// assign each template vertex to its nearest available real star (no repeats).
// Returns the resolved pixel Offsets, sized to the canvas.
// =============================================================================

List<Offset> snapToRealStars(
  List<Offset> templateNorm, // normalised template vertices
  List<Star> pool, // all real stars (x/y in 0..1)
  Size size,
) {
  // Build candidate list: pixel positions of every real star
  final candidates = pool
      .map((s) => Offset(s.x * size.width, s.y * size.height))
      .toList();

  final used = <int>{};
  final result = <Offset>[];

  for (final anchor in templateNorm) {
    final target = Offset(anchor.dx * size.width, anchor.dy * size.height);
    double bestDist = double.infinity;
    int bestIdx = 0;

    for (var i = 0; i < candidates.length; i++) {
      if (used.contains(i)) continue;
      final d = (candidates[i] - target).distanceSquared;
      if (d < bestDist) {
        bestDist = d;
        bestIdx = i;
      }
    }
    used.add(bestIdx);
    result.add(candidates[bestIdx]);
  }
  return result;
}

// =============================================================================
// SECTION 3 — Constellation overlay widget
// =============================================================================

class ConstellationOverlay extends StatefulWidget {
  final List<Star> allStars;
  const ConstellationOverlay({super.key, required this.allStars});

  @override
  State<ConstellationOverlay> createState() => _ConstellationOverlayState();
}

class _ConstellationOverlayState extends State<ConstellationOverlay>
    with TickerProviderStateMixin {
  int _currentIndex = 0;
  bool _labelVisible = false;
  bool _overlayVisible = true;

  // Resolved pixel positions for the current constellation (set on first layout)
  List<Offset> _resolvedStars = [];
  Size _lastSize = Size.zero;

  // One AnimationController per edge
  final List<AnimationController> _edgeControllers = [];
  final List<Animation<double>> _edgeAnims = [];

  static const Duration _lineDur = Duration(milliseconds: 480);
  static const Duration _gapDur = Duration(milliseconds: 60);
  static const Duration _holdDur = Duration(milliseconds: 2800);
  static const Duration _fadeDur = Duration(milliseconds: 800);

  @override
  void initState() {
    super.initState();
    // Defer first build until we have a size
    WidgetsBinding.instance.addPostFrameCallback((_) => _buildAndPlay());
  }

  void _resolveIfNeeded(Size size) {
    if (size == _lastSize && _resolvedStars.isNotEmpty) return;
    _lastSize = size;
    final tmpl = kTemplates[_currentIndex];
    _resolvedStars = snapToRealStars(tmpl.shape, widget.allStars, size);
  }

  Future<void> _buildAndPlay() async {
    _disposeEdgeControllers();

    // Resolve star positions now that we have a size
    final size = _lastSize == Size.zero
        ? MediaQuery.of(context).size
        : _lastSize;
    final tmpl = kTemplates[_currentIndex];
    _resolvedStars = snapToRealStars(tmpl.shape, widget.allStars, size);

    for (var i = 0; i < tmpl.edges.length; i++) {
      final ctrl = AnimationController(vsync: this, duration: _lineDur);
      final anim = CurvedAnimation(parent: ctrl, curve: Curves.easeInOutCubic);
      _edgeControllers.add(ctrl);
      _edgeAnims.add(anim);
    }

    if (!mounted) return;
    setState(() {
      _overlayVisible = true;
      _labelVisible = false;
    });

    // Animate edges one by one
    for (var i = 0; i < _edgeControllers.length; i++) {
      if (!mounted) return;
      await _edgeControllers[i].forward();
      await Future.delayed(_gapDur);
    }

    if (!mounted) return;
    setState(() => _labelVisible = true);

    await Future.delayed(_holdDur);
    if (!mounted) return;

    setState(() {
      _labelVisible = false;
      _overlayVisible = false;
    });
    await Future.delayed(_fadeDur + const Duration(milliseconds: 120));

    if (!mounted) return;
    setState(() => _currentIndex = (_currentIndex + 1) % kTemplates.length);
    _buildAndPlay();
  }

  void _disposeEdgeControllers() {
    for (final c in _edgeControllers) c.dispose();
    _edgeControllers.clear();
    _edgeAnims.clear();
  }

  @override
  void dispose() {
    _disposeEdgeControllers();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final tmpl = kTemplates[_currentIndex];

    return LayoutBuilder(
      builder: (ctx, constraints) {
        final size = Size(constraints.maxWidth, constraints.maxHeight);
        _resolveIfNeeded(size);

        return Stack(
          children: [
            // Line painter
            AnimatedOpacity(
              opacity: _overlayVisible ? 1.0 : 0.0,
              duration: _fadeDur,
              curve: Curves.easeInOut,
              child: _edgeAnims.isEmpty || _resolvedStars.isEmpty
                  ? const SizedBox.expand()
                  : AnimatedBuilder(
                      animation: Listenable.merge(_edgeControllers),
                      builder: (_, __) => CustomPaint(
                        painter: _ConstellationPainter(
                          resolvedStars: _resolvedStars,
                          edges: tmpl.edges,
                          color: tmpl.color,
                          edgeTs: _edgeAnims.map((a) => a.value).toList(),
                        ),
                        child: const SizedBox.expand(),
                      ),
                    ),
            ),

            // Name label
            Positioned(
              bottom: 80,
              left: 0,
              right: 0,
              child: AnimatedSwitcher(
                duration: const Duration(milliseconds: 500),
                child: _labelVisible
                    ? Text(
                            tmpl.name.toUpperCase(),
                            key: ValueKey(tmpl.name),
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              color: tmpl.color.withOpacity(0.85),
                              fontSize: 11,
                              letterSpacing: 5,
                              fontWeight: FontWeight.w300,
                            ),
                          )
                          .animate()
                          .fadeIn(duration: 500.ms)
                          .slideY(
                            begin: 0.4,
                            end: 0,
                            duration: 450.ms,
                            curve: Curves.easeOutCubic,
                          )
                    : const SizedBox.shrink(key: ValueKey('empty')),
              ),
            ),
          ],
        );
      },
    );
  }
}

// =============================================================================
// SECTION 4 — Constellation painter (draws on real-star positions)
// =============================================================================

class _ConstellationPainter extends CustomPainter {
  final List<Offset> resolvedStars; // pixel positions of snapped real stars
  final List<(int, int)> edges;
  final Color color;
  final List<double> edgeTs; // 0..1 per edge

  const _ConstellationPainter({
    required this.resolvedStars,
    required this.edges,
    required this.color,
    required this.edgeTs,
  });

  @override
  void paint(Canvas canvas, Size size) {
    if (resolvedStars.isEmpty) return;

    final arrivedStars = <int>{};

    for (var i = 0; i < edgeTs.length; i++) {
      final t = edgeTs[i];
      if (t <= 0) continue;

      final (ai, bi) = edges[i];
      if (ai >= resolvedStars.length || bi >= resolvedStars.length) continue;

      final p1 = resolvedStars[ai];
      final p2 = resolvedStars[bi];
      final tip = Offset.lerp(p1, p2, t)!;

      // Glow trail
      canvas.drawLine(
        p1,
        tip,
        Paint()
          ..color = color.withOpacity(0.18)
          ..strokeWidth = 4.0
          ..strokeCap = StrokeCap.round
          ..maskFilter = const MaskFilter.blur(BlurStyle.normal, 3.5),
      );

      // Core laser line
      canvas.drawLine(
        p1,
        tip,
        Paint()
          ..color = color.withOpacity(0.65)
          ..strokeWidth = 1.0
          ..strokeCap = StrokeCap.round,
      );

      // Moving tip spark (only while still travelling)
      if (t < 1.0) {
        canvas.drawCircle(
          tip,
          5.5,
          Paint()
            ..color = Colors.white.withOpacity(0.14)
            ..maskFilter = const MaskFilter.blur(BlurStyle.normal, 4),
        );
        canvas.drawCircle(tip, 2.4, Paint()..color = color.withOpacity(0.92));
        canvas.drawCircle(
          tip,
          1.0,
          Paint()..color = Colors.white.withOpacity(0.97),
        );
      }

      arrivedStars.add(ai);
      if (t >= 1.0) arrivedStars.add(bi);
    }

    // Highlight the real stars that are part of this constellation
    for (final idx in arrivedStars) {
      if (idx >= resolvedStars.length) continue;
      final pos = resolvedStars[idx];

      // Extra glow ring around the existing star
      canvas.drawCircle(
        pos,
        7.0,
        Paint()
          ..color = color.withOpacity(0.13)
          ..maskFilter = const MaskFilter.blur(BlurStyle.normal, 5),
      );

      // Coloured halo
      canvas.drawCircle(pos, 3.2, Paint()..color = color.withOpacity(0.40));

      // Bright white core
      canvas.drawCircle(
        pos,
        1.6,
        Paint()..color = Colors.white.withOpacity(0.95),
      );
    }
  }

  @override
  bool shouldRepaint(_ConstellationPainter old) =>
      old.resolvedStars != resolvedStars ||
      old.color != color ||
      !_eq(old.edgeTs, edgeTs);

  static bool _eq(List<double> a, List<double> b) {
    if (a.length != b.length) return false;
    for (var i = 0; i < a.length; i++) if (a[i] != b[i]) return false;
    return true;
  }
}

// =============================================================================
// SECTION 5 — Main widget: shares star pool with both painters
// =============================================================================

class AnimatedStarBackgroundComponent extends StatefulWidget {
  const AnimatedStarBackgroundComponent({super.key});

  @override
  State<AnimatedStarBackgroundComponent> createState() =>
      _AnimatedStarBackgroundComponentState();
}

class _AnimatedStarBackgroundComponentState
    extends State<AnimatedStarBackgroundComponent>
    with SingleTickerProviderStateMixin {
  late final AnimationController _controller;

  final List<Star> _bgStars = List.generate(160, (_) => Star(layer: 0));
  final List<Star> _midStars = List.generate(90, (_) => Star(layer: 1));
  final List<Star> _fgStars = List.generate(40, (_) => Star(layer: 2));
  final List<DustParticle> _dust = List.generate(60, (_) => DustParticle());
  final List<ShootingStar> _shoots = List.generate(4, (_) => ShootingStar());

  // Single flat list shared with the constellation overlay
  late final List<Star> _allStars;

  @override
  void initState() {
    super.initState();
    // Foreground stars first so the snap algorithm prefers brighter stars
    _allStars = [..._fgStars, ..._midStars, ..._bgStars];
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 40),
    );
    unawaited(_controller.repeat());
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        AnimatedBuilder(
          animation: _controller,
          builder: (_, __) => CustomPaint(
            painter: _GalaxyPainter(
              progress: _controller.value,
              bgStars: _bgStars,
              midStars: _midStars,
              fgStars: _fgStars,
              dust: _dust,
              shoots: _shoots,
            ),
            child: const SizedBox.expand(),
          ),
        ),
        ConstellationOverlay(allStars: _allStars),
      ],
    );
  }
}

// =============================================================================
// SECTION 6 — Galaxy painter (all 8 layers, unchanged)
// =============================================================================

class _GalaxyPainter extends CustomPainter {
  final double progress;
  final List<Star> bgStars, midStars, fgStars;
  final List<DustParticle> dust;
  final List<ShootingStar> shoots;

  _GalaxyPainter({
    required this.progress,
    required this.bgStars,
    required this.midStars,
    required this.fgStars,
    required this.dust,
    required this.shoots,
  });

  @override
  void paint(Canvas canvas, Size size) {
    _drawSpaceBackground(canvas, size);
    _drawMilkyWay(canvas, size);
    _drawNebulae(canvas, size);
    _drawDust(canvas, size);
    _drawStarLayer(canvas, size, bgStars, driftScale: 2.0);
    _drawStarLayer(canvas, size, midStars, driftScale: 5.0);
    _drawStarLayer(canvas, size, fgStars, driftScale: 8.0);
    for (final s in shoots) _drawShootingStar(canvas, size, s);
  }

  void _drawSpaceBackground(Canvas canvas, Size size) {
    canvas.drawRect(
      Offset.zero & size,
      Paint()
        ..shader = ui.Gradient.linear(
          Offset(size.width * 0.2, 0),
          Offset(size.width * 0.8, size.height),
          const [
            Color(0xFF000005),
            Color(0xFF03001C),
            Color(0xFF050016),
            Color(0xFF020008),
            Color(0xFF000000),
          ],
          [0.0, 0.25, 0.5, 0.75, 1.0],
        ),
    );
  }

  void _drawMilkyWay(Canvas canvas, Size size) {
    final slow = progress * 0.04;
    canvas.save();
    canvas.translate(
      size.width * (0.35 + math.sin(slow * math.pi * 2) * 0.04),
      size.height * 0.5,
    );
    canvas.rotate(-0.4);
    _blob(
      canvas,
      Offset.zero,
      size.width * .9,
      size.height * .28,
      const Color(0xFF1A0E3A),
      .18,
    );
    _blob(
      canvas,
      Offset.zero,
      size.width * .55,
      size.height * .14,
      const Color(0xFF2A1560),
      .22,
    );
    _blob(
      canvas,
      Offset.zero,
      size.width * .25,
      size.height * .06,
      const Color(0xFF3D1E80),
      .18,
    );
    _blob(
      canvas,
      Offset(size.width * .15, size.height * .08),
      size.width * .40,
      size.height * .10,
      const Color(0xFF1E0E50),
      .14,
    );
    canvas.restore();
  }

  void _drawNebulae(Canvas canvas, Size size) {
    final t = progress * math.pi * 2;
    _blob(
      canvas,
      Offset(size.width * .18 + math.sin(t * .3) * 8, size.height * .22),
      size.width * .32,
      size.height * .18,
      const Color(0xFF0A2060),
      .28,
    );
    _blob(
      canvas,
      Offset(size.width * .12 + math.sin(t * .3) * 5, size.height * .18),
      size.width * .18,
      size.height * .10,
      const Color(0xFF1040A0),
      .18,
    );
    _blob(
      canvas,
      Offset(size.width * .78 + math.cos(t * .25) * 10, size.height * .38),
      size.width * .30,
      size.height * .22,
      const Color(0xFF3A0860),
      .26,
    );
    _blob(
      canvas,
      Offset(size.width * .82 + math.cos(t * .25) * 6, size.height * .34),
      size.width * .16,
      size.height * .12,
      const Color(0xFF6010A0),
      .16,
    );
    _blob(
      canvas,
      Offset(size.width * .50 + math.sin(t * .2) * 12, size.height * .78),
      size.width * .38,
      size.height * .18,
      const Color(0xFF042830),
      .24,
    );
    _blob(
      canvas,
      Offset(size.width * .52 + math.sin(t * .2) * 7, size.height * .80),
      size.width * .20,
      size.height * .10,
      const Color(0xFF085060),
      .18,
    );
    _blob(
      canvas,
      Offset(size.width * .85, size.height * .12 + math.sin(t * .35) * 8),
      size.width * .20,
      size.height * .14,
      const Color(0xFF400810),
      .20,
    );
  }

  void _drawDust(Canvas canvas, Size size) {
    for (final d in dust) {
      final x =
          (d.x * size.width + progress * d.driftX * size.width) % size.width;
      final y =
          (d.y * size.height + progress * d.driftY * size.height) % size.height;
      canvas.drawCircle(
        Offset(x, y),
        d.size,
        Paint()..color = d.color.withOpacity(d.opacity),
      );
    }
  }

  void _drawStarLayer(
    Canvas canvas,
    Size size,
    List<Star> stars, {
    required double driftScale,
  }) {
    for (final star in stars) {
      final twinkle =
          0.35 +
          0.65 *
              math.sin(progress * math.pi * 2 * star.twinkleSpeed + star.phase);
      final x =
          (star.x * size.width +
              math.sin(progress * math.pi * 2 * .18 + star.phase) *
                  driftScale) %
          size.width;
      final y =
          (star.y * size.height +
              math.cos(progress * math.pi * 2 * .18 + star.phase) *
                  driftScale) %
          size.height;
      final op = (twinkle * star.opacity).clamp(0.0, 1.0);
      final pos = Offset(x, y);

      if (star.size > 0.9) {
        canvas.drawCircle(
          pos,
          star.size * 4.5,
          Paint()
            ..color = star.color.withOpacity(op * .07)
            ..maskFilter = const MaskFilter.blur(BlurStyle.normal, 4),
        );
        canvas.drawCircle(
          pos,
          star.size * 2.2,
          Paint()
            ..color = star.color.withOpacity(op * .18)
            ..maskFilter = const MaskFilter.blur(BlurStyle.normal, 2),
        );
      }
      canvas.drawCircle(
        pos,
        star.size,
        Paint()..color = star.color.withOpacity(op),
      );
      if (star.size > 1.2) {
        canvas.drawCircle(
          pos,
          star.size * .35,
          Paint()..color = Colors.white.withOpacity(op),
        );
        if (star.size > 1.8) _drawSpike(canvas, pos, star.size, op, star.color);
      }
    }
  }

  void _drawSpike(Canvas canvas, Offset pos, double r, double op, Color color) {
    final len = r * 6.0;
    final p = Paint()
      ..strokeWidth = 0.6
      ..strokeCap = StrokeCap.round;
    for (final a in [0.0, math.pi / 2]) {
      final dx = math.cos(a) * len;
      final dy = math.sin(a) * len;
      p.shader = ui.Gradient.linear(
        Offset(pos.dx - dx, pos.dy - dy),
        Offset(pos.dx + dx, pos.dy + dy),
        [
          Colors.transparent,
          color.withOpacity(op * .6),
          color.withOpacity(op * .9),
          color.withOpacity(op * .6),
          Colors.transparent,
        ],
        [0.0, 0.3, 0.5, 0.7, 1.0],
      );
      canvas.drawLine(
        Offset(pos.dx - dx, pos.dy - dy),
        Offset(pos.dx + dx, pos.dy + dy),
        p,
      );
    }
  }

  void _drawShootingStar(Canvas canvas, Size size, ShootingStar s) {
    final raw = (progress + s.cycleOffset) % s.cycleLength;
    if (raw > s.activeWindow) return;
    final t = raw / s.activeWindow;
    final fade = math.sin(t * math.pi);
    final sx = s.startFracX * size.width;
    final sy = s.startFracY * size.height;
    final curX = sx + math.cos(s.angle) * s.length * t;
    final curY = sy + math.sin(s.angle) * s.length * t;
    final tLen = s.length * math.min(t, 0.6);
    final tSX = curX - math.cos(s.angle) * tLen;
    final tSY = curY - math.sin(s.angle) * tLen;
    canvas.drawLine(
      Offset(tSX, tSY),
      Offset(curX, curY),
      Paint()
        ..shader = ui.Gradient.linear(
          Offset(tSX, tSY),
          Offset(curX, curY),
          [
            Colors.transparent,
            s.color.withOpacity(fade * .5),
            s.color.withOpacity(fade * .9),
          ],
          [0.0, 0.6, 1.0],
        )
        ..strokeWidth = s.width
        ..strokeCap = StrokeCap.round,
    );
    canvas.drawCircle(
      Offset(curX, curY),
      s.width * 1.4,
      Paint()
        ..color = Colors.white.withOpacity(fade * .95)
        ..maskFilter = const MaskFilter.blur(BlurStyle.normal, 1.5),
    );
  }

  void _blob(
    Canvas canvas,
    Offset center,
    double w,
    double h,
    Color color,
    double opacity,
  ) {
    canvas.drawOval(
      Rect.fromCenter(center: center, width: w, height: h),
      Paint()
        ..color = color.withOpacity(opacity)
        ..maskFilter = MaskFilter.blur(BlurStyle.normal, (w + h) / 6),
    );
  }

  @override
  bool shouldRepaint(covariant _GalaxyPainter old) => old.progress != progress;
}

// =============================================================================
// SECTION 7 — Data models
// =============================================================================

class Star {
  Star({required int layer}) {
    final rng = math.Random();
    x = rng.nextDouble();
    y = rng.nextDouble();
    phase = rng.nextDouble() * math.pi * 2;
    if (rng.nextDouble() < 0.45) {
      x = 0.2 + rng.nextDouble() * 0.6;
      y = 0.3 + rng.nextDouble() * 0.4;
    }
    switch (layer) {
      case 0:
        size = rng.nextDouble() * 0.7 + 0.25;
        opacity = rng.nextDouble() * 0.45 + 0.15;
        twinkleSpeed = rng.nextDouble() * 1.5 + 0.5;
        color = _pickColor(rng);
      case 1:
        size = rng.nextDouble() * 1.0 + 0.6;
        opacity = rng.nextDouble() * 0.55 + 0.30;
        twinkleSpeed = rng.nextDouble() * 2.5 + 0.8;
        color = _pickColor(rng);
      default:
        size = rng.nextDouble() * 1.2 + 1.4;
        opacity = rng.nextDouble() * 0.40 + 0.55;
        twinkleSpeed = rng.nextDouble() * 3.5 + 1.5;
        color = _pickColor(rng);
    }
  }

  static Color _pickColor(math.Random rng) {
    final r = rng.nextDouble();
    if (r < 0.50) return const Color(0xFFFFFFFF);
    if (r < 0.70) return const Color(0xFFCCDDFF);
    if (r < 0.82) return const Color(0xFFFFEECC);
    if (r < 0.90) return const Color(0xFFFFCC88);
    if (r < 0.95) return const Color(0xFFAABBFF);
    return const Color(0xFFFF9988);
  }

  late double x, y, size, opacity, twinkleSpeed, phase;
  late Color color;
}

class DustParticle {
  DustParticle() {
    final rng = math.Random();
    x = rng.nextDouble();
    y = rng.nextDouble();
    size = rng.nextDouble() * 0.6 + 0.1;
    opacity = rng.nextDouble() * 0.12 + 0.03;
    driftX = (rng.nextDouble() - 0.5) * 0.008;
    driftY = (rng.nextDouble() - 0.5) * 0.008;
    final cols = [
      const Color(0xFF8899BB),
      const Color(0xFFAA99CC),
      const Color(0xFF6688AA),
      const Color(0xFFCCBBDD),
    ];
    color = cols[rng.nextInt(cols.length)];
  }
  late double x, y, size, opacity, driftX, driftY;
  late Color color;
}

class ShootingStar {
  ShootingStar() {
    final rng = math.Random();
    startFracX = rng.nextDouble() * 0.7;
    startFracY = rng.nextDouble() * 0.5;
    angle = math.pi / 6 + rng.nextDouble() * math.pi / 6;
    length = 120 + rng.nextDouble() * 180;
    width = 1.2 + rng.nextDouble() * 1.4;
    cycleOffset = rng.nextDouble();
    cycleLength = 0.18 + rng.nextDouble() * 0.20;
    activeWindow = 0.035 + rng.nextDouble() * 0.03;
    color = rng.nextDouble() < 0.7 ? Colors.white : const Color(0xFFDDEEFF);
  }
  late double startFracX, startFracY, angle, length, width;
  late double cycleOffset, cycleLength, activeWindow;
  late Color color;
}
