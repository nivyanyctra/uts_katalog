import 'dart:ui' show lerpDouble;

import 'package:flutter/material.dart';

import '../app_theme.dart';

String heroTag(int id) => 'ikon-menu-$id';

RectTween _lintasanMelengkung(Rect? begin, Rect? end) =>
    MaterialRectCenterArcTween(begin: begin, end: end);

class RadialHero extends StatelessWidget {
  const RadialHero({
    super.key,
    required this.id,
    required this.ikon,
    required this.child,
  });

  final int id;
  final IconData ikon;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Hero(
      tag: heroTag(id),
      createRectTween: _lintasanMelengkung,
      flightShuttleBuilder: (context, animation, direction, from, to) =>
          _RadialShuttle(
        animation: animation,
        direction: direction,
        ikon: ikon,
      ),
      child: child,
    );
  }
}

class _RadialShuttle extends StatelessWidget {
  const _RadialShuttle({
    required this.animation,
    required this.direction,
    required this.ikon,
  });

  final Animation<double> animation;
  final HeroFlightDirection direction;
  final IconData ikon;

  static const double _radiusPersegi = 32;

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: animation,
      builder: (context, _) {
        final t = direction == HeroFlightDirection.push
            ? animation.value
            : 1 - animation.value;

        return LayoutBuilder(
          builder: (context, constraints) {
            final sisi = constraints.biggest.shortestSide;
            final radius =
                lerpDouble(sisi / 2, _radiusPersegi, t)!.clamp(0.0, sisi / 2);
            return ClipRRect(
              borderRadius: BorderRadius.circular(radius),
              child: ColoredBox(
                color: AppColors.tint,
                child: Center(
                  child: Icon(
                    ikon,
                    color: AppColors.accent,
                    size: lerpDouble(26, 84, t),
                  ),
                ),
              ),
            );
          },
        );
      },
    );
  }
}
