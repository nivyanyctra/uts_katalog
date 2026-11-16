import 'package:flutter/material.dart';

class MenuModel {
  MenuModel({
    required this.id,
    required this.nama,
    required this.harga,
    required this.ikon,
    required this.deskripsi,
    bool tersedia = true,
  }) : tersedia = ValueNotifier<bool>(tersedia);

  final int id;
  final String nama;
  final int harga;
  final IconData ikon;
  final String deskripsi;

  final ValueNotifier<bool> tersedia;

  void toggle() => tersedia.value = !tersedia.value;
  void dispose() => tersedia.dispose();
}

List<MenuModel> buatDaftarMenu() => [
      MenuModel(id: 1, nama: 'Espresso', harga: 18000, ikon: Icons.coffee, deskripsi: 'Kopi pekat dengan crema tebal, disajikan single shot.'),
      MenuModel(id: 2, nama: 'Cappuccino', harga: 28000, ikon: Icons.local_cafe, deskripsi: 'Espresso, susu panas, dan foam lembut dalam takaran seimbang.'),
      MenuModel(id: 3, nama: 'Caffe Latte', harga: 30000, ikon: Icons.emoji_food_beverage, deskripsi: 'Espresso dengan susu steamed yang creamy dan ringan.'),
      MenuModel(id: 4, nama: 'Matcha Latte', harga: 32000, ikon: Icons.eco, deskripsi: 'Matcha premium dengan susu segar, manis secukupnya.'),
      MenuModel(id: 5, nama: 'Croissant', harga: 25000, ikon: Icons.bakery_dining, deskripsi: 'Pastry berlapis, renyah di luar dan lembut di dalam.'),
      MenuModel(id: 6, nama: 'Roti Bakar', harga: 20000, ikon: Icons.breakfast_dining, deskripsi: 'Roti tebal panggang dengan mentega dan selai pilihan.'),
      MenuModel(id: 7, nama: 'Nasi Goreng', harga: 35000, ikon: Icons.rice_bowl, deskripsi: 'Nasi goreng rempah dengan telur dan acar segar.'),
      MenuModel(id: 8, nama: 'Mie Ramen', harga: 38000, ikon: Icons.ramen_dining, deskripsi: 'Kuah kaldu gurih dengan mie kenyal dan topping lengkap.'),
      MenuModel(id: 9, nama: 'Cookies', harga: 15000, ikon: Icons.cookie, deskripsi: 'Cookies cokelat panggang, chewy dengan chip melimpah.'),
      MenuModel(id: 10, nama: 'Es Krim Vanila', harga: 18000, ikon: Icons.icecream, deskripsi: 'Es krim vanila lembut dengan taburan biji vanila asli.'),
    ];
