import 'package:flutter/material.dart';

import '../app_theme.dart';
import '../models/menu_model.dart';
import '../widgets/radial_hero.dart';

class DetailPage extends StatelessWidget {
  const DetailPage({super.key, required this.menu});

  final MenuModel menu;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        scrolledUnderElevation: 0,
        foregroundColor: AppColors.ink,
      ),
      body: SafeArea(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 32),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                RadialHero(
                  id: menu.id,
                  ikon: menu.ikon,
                  child: ClipRRect(
                    borderRadius: const BorderRadius.all(Radius.circular(32)),
                    child: Container(
                      width: 180,
                      height: 180,
                      color: AppColors.tint,
                      child: Icon(menu.ikon, size: 84, color: AppColors.accent),
                    ),
                  ),
                ),
                const SizedBox(height: 32),
                Text(
                  menu.nama,
                  style: const TextStyle(
                    fontSize: 28,
                    fontWeight: FontWeight.w700,
                    color: AppColors.ink,
                  ),
                ),
                const SizedBox(height: 8),
                Text(
                  formatRupiah(menu.harga),
                  style: const TextStyle(fontSize: 18, color: AppColors.muted),
                ),
                const SizedBox(height: 16),
                ValueListenableBuilder<bool>(
                  valueListenable: menu.tersedia,
                  builder: (context, tersedia, _) =>
                      _StatusChip(tersedia: tersedia),
                ),
                const SizedBox(height: 24),
                Text(
                  menu.deskripsi,
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                    fontSize: 15,
                    height: 1.5,
                    color: AppColors.muted,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class _StatusChip extends StatelessWidget {
  const _StatusChip({required this.tersedia});

  final bool tersedia;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 6),
      decoration: BoxDecoration(
        color: tersedia ? AppColors.tint : AppColors.ink,
        borderRadius: const BorderRadius.all(Radius.circular(20)),
      ),
      child: Text(
        tersedia ? 'Tersedia' : 'Habis',
        style: TextStyle(
          fontSize: 13,
          fontWeight: FontWeight.w600,
          color: tersedia ? AppColors.accent : Colors.white,
        ),
      ),
    );
  }
}
