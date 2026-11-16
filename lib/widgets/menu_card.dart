import 'package:flutter/material.dart';

import '../app_theme.dart';
import 'radial_hero.dart';

class MenuCard extends StatelessWidget {
  MenuCard({
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

  @override
  Widget build(BuildContext context) {
    // Dekorasi dibuat ulang di setiap build (tidak const).
    final dekorasi = BoxDecoration(
      gradient: LinearGradient(
        begin: Alignment.topLeft,
        end: Alignment.bottomRight,
        colors: [Colors.white, Color(0xFFF6F0E9)],
      ),
      borderRadius: BorderRadius.circular(20),
      border: Border.all(color: AppColors.line),
      boxShadow: [
        BoxShadow(
          color: Color(0x14000000),
          blurRadius: 16,
          offset: Offset(0, 6),
        ),
      ],
    );

    return Padding(
      padding: EdgeInsets.only(bottom: 12),
      child: AnimatedOpacity(
        opacity: tersedia ? 1.0 : 0.4,
        duration: Duration(milliseconds: 400),
        curve: Curves.easeOut,
        child: Container(
          decoration: dekorasi,
          child: Material(
            color: Colors.transparent,
            child: InkWell(
              borderRadius: BorderRadius.circular(20),
              onTap: onTap,
              onLongPress: onLongPress,
              child: Padding(
                padding: EdgeInsets.all(16),
                child: Row(
                  children: [
                    RadialHero(
                      id: id,
                      ikon: ikon,
                      child: Container(
                        width: 56,
                        height: 56,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: AppColors.tint,
                        ),
                        child: Icon(ikon, size: 26, color: AppColors.accent),
                      ),
                    ),
                    SizedBox(width: 16),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            nama,
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w600,
                              color: AppColors.ink,
                            ),
                          ),
                          SizedBox(height: 4),
                          Text(
                            formatRupiah(harga),
                            style: TextStyle(
                              fontSize: 14,
                              color: AppColors.muted,
                            ),
                          ),
                        ],
                      ),
                    ),
                    if (!tersedia)
                      Container(
                        padding: EdgeInsets.symmetric(
                          horizontal: 10,
                          vertical: 4,
                        ),
                        decoration: BoxDecoration(
                          color: AppColors.ink,
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: Text(
                          'Habis',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 12,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
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
