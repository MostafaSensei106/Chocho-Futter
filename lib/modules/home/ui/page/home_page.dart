// ignore_for_file: discarded_futures, deprecated_member_use
import 'dart:math' as math;
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import '../widgets/glass_app_bar.dart';
import '../widgets/glass_bottom_nav.dart';
import '../widgets/home_content.dart';
import '../widgets/home_drawer.dart';
import '../widgets/sky_canvas.dart';

class HomePage extends HookWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final selectedIndex = useState(0);

    final clock = useAnimationController(duration: const Duration(seconds: 10))
      ..repeat();

    final flapCtrl = useAnimationController(
      duration: const Duration(milliseconds: 1800),
    )..repeat(reverse: true);

    final flapAnim = useAnimation(
      CurvedAnimation(parent: flapCtrl, curve: Curves.easeInOutSine),
    );

    final driftCtrl = useAnimationController(
      duration: const Duration(seconds: 7),
    )..repeat();

    final hueCtrl = useAnimationController(duration: const Duration(seconds: 5))
      ..repeat();

    final shootCtrl = useAnimationController(
      duration: const Duration(milliseconds: 900),
    );

    useEffect(() {
      var isMounted = true;

      Future<void> scheduleShoot() async {
        // ignore: inference_failure_on_instance_creation
        await Future.delayed(Duration(seconds: 3 + math.Random().nextInt(4)));
        if (!isMounted) return;
        await shootCtrl.forward(from: 0);
        if (isMounted) await scheduleShoot();
      }

      scheduleShoot();
      return () => isMounted = false;
    }, [shootCtrl]);

    // Listen to all animations to trigger rebuilds for the SkyCanvas
    useListenable(clock);
    useListenable(driftCtrl);
    useListenable(hueCtrl);
    useListenable(shootCtrl);

    return Scaffold(
      backgroundColor: const Color(0xFF06060F),
      extendBodyBehindAppBar: true,
      extendBody: true,
      appBar: const GlassAppBar(),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            SkyCanvas(
              clock: clock.value,
              flapT: flapAnim,
              driftT: driftCtrl.value,
              hueT: hueCtrl.value,
              shootT: shootCtrl.value,
            ),
            const HomeContent(),
          ],
        ),
      ),
      drawer: const HomeDrawer(),
      bottomNavigationBar: GlassBottomNav(
        selectedIndex: selectedIndex.value,
        onDestinationSelected: (i) => selectedIndex.value = i,
      ),
    );
  }
}
