import 'dart:math' as math;

import 'package:flutter/material.dart';

import '../app_theme.dart';
import '../models/menu_model.dart';
import '../widgets/menu_card.dart';
import 'detail_page.dart';

class KatalogPage extends StatefulWidget {
  KatalogPage({super.key});

  @override
  State<KatalogPage> createState() => _KatalogPageState();
}

class _KatalogPageState extends State<KatalogPage>
    with SingleTickerProviderStateMixin {
  final List<MenuModel> _menus = buatDaftarMenu();
  late final AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller =
        AnimationController(vsync: this, duration: Duration(seconds: 4))
          // BURUK: setiap tick animasi me-rebuild SELURUH halaman.
          ..addListener(() => setState(() {}))
          ..repeat();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void _bukaDetail(MenuModel menu) {
    Navigator.of(context).push(
      PageRouteBuilder<void>(
        transitionDuration: Duration(milliseconds: 600),
        reverseTransitionDuration: Duration(milliseconds: 600),
        pageBuilder: (_, __, ___) => DetailPage(menu: menu),
        transitionsBuilder: (_, animation, __, child) =>
            FadeTransition(opacity: animation, child: child),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            _buildHeader(),
            Expanded(
              // BURUK: ListView biasa, semua item dibangun sekaligus.
              child: ListView(
                padding: EdgeInsets.fromLTRB(20, 8, 20, 24),
                children: _menus
                    .map(
                      (menu) => MenuCard(
                        id: menu.id,
                        nama: menu.nama,
                        harga: menu.harga,
                        ikon: menu.ikon,
                        tersedia: menu.tersedia,
                        onTap: () => _bukaDetail(menu),
                        // BURUK: setState di halaman -> semua kartu rebuild.
                        onLongPress: () =>
                            setState(() => menu.tersedia = !menu.tersedia),
                      ),
                    )
                    .toList(),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildHeader() {
    return Padding(
      padding: EdgeInsets.fromLTRB(24, 24, 24, 16),
      child: Row(
        children: [
          Container(
            width: 48,
            height: 48,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: AppColors.tint,
            ),
            // BURUK: tanpa AnimatedBuilder(child:) dan tanpa RepaintBoundary.
            child: Transform.rotate(
              angle: _controller.value * 2 * math.pi,
              child: Icon(Icons.local_cafe, size: 24, color: AppColors.accent),
            ),
          ),
          SizedBox(width: 16),
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
                SizedBox(height: 2),
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
