import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../models/menu_model.dart';
import '../widgets/cup_header.dart';
import '../widgets/menu_card.dart';
import 'detail_page.dart';

class KatalogPage extends StatefulWidget {
  const KatalogPage({super.key});

  @override
  State<KatalogPage> createState() => _KatalogPageState();
}

class _KatalogPageState extends State<KatalogPage> {
  late final List<MenuModel> _menus = buatDaftarMenu();

  @override
  void dispose() {
    for (final m in _menus) {
      m.dispose();
    }
    super.dispose();
  }

  void _bukaDetail(MenuModel menu) {
    Navigator.of(context).push(
      PageRouteBuilder<void>(
        transitionDuration: const Duration(milliseconds: 600),
        reverseTransitionDuration: const Duration(milliseconds: 600),
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
            const CupHeader(),
            Expanded(
              child: ListView.builder(
                padding: const EdgeInsets.fromLTRB(20, 8, 20, 24),
                itemCount: _menus.length,
                itemBuilder: (context, index) {
                  final menu = _menus[index];
                  return ValueListenableBuilder<bool>(
                    key: ValueKey(menu.id),
                    valueListenable: menu.tersedia,
                    builder: (context, tersedia, _) => MenuCard(
                      id: menu.id,
                      nama: menu.nama,
                      harga: menu.harga,
                      ikon: menu.ikon,
                      tersedia: tersedia,
                      onTap: () => _bukaDetail(menu),
                      onLongPress: () {
                        HapticFeedback.selectionClick();
                        menu.toggle();
                      },
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
