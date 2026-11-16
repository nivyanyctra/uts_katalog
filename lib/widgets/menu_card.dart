import 'package:flutter/material.dart';

import '../app_theme.dart';
import 'radial_hero.dart';

class MenuCard extends StatelessWidget {
  const MenuCard({
    super.key,
    required this.id,
    required this.nama,
    required this.harga,
    required this.tersedia,
    required this.ikon,
    required this.onTap,
    required this.onLongPress,
  });

  final int id;
  final String nama;
  final int harga;
  final bool tersedia;
  final IconData ikon;
  final VoidCallback onTap;
  final VoidCallback onLongPress;

  static const _radius = BorderRadius.all(Radius.circular(20));

  static const _dekorasi = BoxDecoration(
    gradient: LinearGradient(
      begin: Alignment.topLeft,
      end: Alignment.bottomRight,
      colors: [Colors.white, Color(0xFFF6F0E9)],
    ),
    borderRadius: _radius,
    border: Border.fromBorderSide(BorderSide(color: AppColors.line)),
    boxShadow: [
      BoxShadow(
        color: Color(0x14000000),
        blurRadius: 16,
        offset: Offset(0, 6),
      ),
    ],
  );

  static const _lingkaran = BoxDecoration(
    shape: BoxShape.circle,
    color: AppColors.tint,
  );

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 12),
      child: AnimatedOpacity(
        opacity: tersedia ? 1.0 : 0.4,
        duration: const Duration(milliseconds: 400),
        curve: Curves.easeOut,
        child: Container(
          decoration: _dekorasi,
          child: Material(
            color: Colors.transparent,
            child: InkWell(
              borderRadius: _radius,
              onTap: onTap,
              onLongPress: onLongPress,
              child: Padding(
                padding: const EdgeInsets.all(16),
                child: Row(
                  children: [
                    RadialHero(
                      id: id,
                      ikon: ikon,
                      child: Container(
                        width: 56,
                        height: 56,
                        decoration: _lingkaran,
                        child: Icon(ikon, size: 26, color: AppColors.accent),
                      ),
                    ),
                    const SizedBox(width: 16),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            nama,
                            style: const TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w600,
                              color: AppColors.ink,
                            ),
                          ),
                          const SizedBox(height: 4),
                          Text(
                            formatRupiah(harga),
                            style: const TextStyle(
                              fontSize: 14,
                              color: AppColors.muted,
                            ),
                          ),
                        ],
                      ),
                    ),
                    if (!tersedia) const _LabelHabis(),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class _LabelHabis extends StatelessWidget {
  const _LabelHabis();

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
      decoration: const BoxDecoration(
        color: AppColors.ink,
        borderRadius: BorderRadius.all(Radius.circular(12)),
      ),
      child: const Text(
        'Habis',
        style: TextStyle(
          color: Colors.white,
          fontSize: 12,
          fontWeight: FontWeight.w600,
        ),
      ),
    );
  }
}
