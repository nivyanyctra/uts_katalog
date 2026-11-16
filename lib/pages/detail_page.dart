import 'package:flutter/material.dart';

import '../app_theme.dart';
import '../models/menu_model.dart';
import '../widgets/radial_hero.dart';

class DetailPage extends StatelessWidget {
  DetailPage({super.key, required this.menu});

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
            padding: EdgeInsets.symmetric(horizontal: 32),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                RadialHero(
                  id: menu.id,
                  ikon: menu.ikon,
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(32),
                    child: Container(
                      width: 180,
                      height: 180,
                      color: AppColors.tint,
                      child: Icon(menu.ikon, size: 84, color: AppColors.accent),
                    ),
                  ),
                ),
                SizedBox(height: 32),
                Text(
                  menu.nama,
                  style: TextStyle(
                    fontSize: 28,
                    fontWeight: FontWeight.w700,
                    color: AppColors.ink,
                  ),
                ),
                SizedBox(height: 8),
                Text(
                  formatRupiah(menu.harga),
                  style: TextStyle(fontSize: 18, color: AppColors.muted),
                ),
                SizedBox(height: 16),
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 14, vertical: 6),
                  decoration: BoxDecoration(
                    color: menu.tersedia ? AppColors.tint : AppColors.ink,
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Text(
                    menu.tersedia ? 'Tersedia' : 'Habis',
                    style: TextStyle(
                      fontSize: 13,
                      fontWeight: FontWeight.w600,
                      color: menu.tersedia ? AppColors.accent : Colors.white,
                    ),
                  ),
                ),
                SizedBox(height: 24),
                Text(
                  menu.deskripsi,
                  textAlign: TextAlign.center,
                  style: TextStyle(
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
