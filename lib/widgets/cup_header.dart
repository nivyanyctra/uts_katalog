import 'dart:math' as math;

import 'package:flutter/material.dart';

import '../app_theme.dart';

class CupHeader extends StatefulWidget {
  const CupHeader({super.key});

  @override
  State<CupHeader> createState() => _CupHeaderState();
}

class _CupHeaderState extends State<CupHeader>
    with SingleTickerProviderStateMixin {
  late final AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 4),
    )..repeat();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(24, 24, 24, 16),
      child: Row(
        children: [
          Container(
            width: 48,
            height: 48,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: AppColors.tint,
            ),
            child: RepaintBoundary(
              child: AnimatedBuilder(
                animation: _controller,
                child: Icon(
                  Icons.local_cafe,
                  size: 24,
                  color: AppColors.accent,
                ),
                builder: (context, child) => Transform.rotate(
                  angle: _controller.value * 2 * math.pi, // 0 .. 2π
                  child: child,
                ),
              ),
            ),
          ),
          const SizedBox(width: 16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Katalog Menu',
                  style: TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.w700,
                    color: AppColors.ink,
                  ),
                ),
                const SizedBox(height: 2),
                Text(
                  'Tekan lama kartu untuk ubah ketersediaan',
                  style: TextStyle(fontSize: 13, color: AppColors.muted),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
