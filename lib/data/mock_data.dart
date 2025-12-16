import '../models/data_model.dart';

// Helper function with NEW image paths
List<MenuItem> get _kiahMenu => [
  MenuItem(
    name: "Nasi Kerabu",
    price: 12.00,
    imagePath: "assets/images/nasi_kerabu.png",
  ),
  MenuItem(
    name: "Ayam Percik",
    price: 8.50,
    imagePath: "assets/images/ayam_percik.png",
  ),
  MenuItem(
    name: "Solok Lada",
    price: 3.00,
    imagePath: "assets/images/solok_lada.png",
  ),
];

List<MenuItem> get _rajaMenu => [
  MenuItem(
    name: "Murtabak Daging",
    price: 15.00,
    imagePath: "assets/images/murtabak_daging.png",
  ),
  MenuItem(
    name: "Murtabak Ayam",
    price: 12.00,
    imagePath: "assets/images/murtabak_ayam.png",
  ),
  MenuItem(
    name: "Roti John",
    price: 10.00,
    imagePath: "assets/images/roti_john.png",
  ),
];

List<MenuItem> get _sadoMenu => [
  MenuItem(
    name: "Air Kathira",
    price: 5.00,
    imagePath: "assets/images/air_kathira.png",
  ),
  MenuItem(
    name: "Teh Ais Cincau",
    price: 4.00,
    imagePath: "assets/images/teh_ais.png",
  ),
  MenuItem(
    name: "Mangga Susu",
    price: 6.00,
    imagePath: "assets/images/mangga_susu.png",
  ),
];

final List<Stall> bazarStalls = [
  Stall(
    name: "Gerai Mak Cik Kiah",
    location: "Bazar TTDI",
    imagePath: "assets/images/stall_kiah.png", // <--- LOCAL PATH
    menu: _kiahMenu,
  ),
  Stall(
    name: "Murtabak Raja",
    location: "Bazar Shah Alam",
    imagePath: "assets/images/stall_murtabak.png", // <--- LOCAL PATH
    menu: _rajaMenu,
  ),
  Stall(
    name: "Air Balang Miku",
    location: "Bazar Bangsar",
    imagePath: "assets/images/stall_miku.png", // <--- LOCAL PATH
    menu: _sadoMenu,
  ),
];

// ... rest of the file (myCart, orderHistory) stays the same
List<MenuItem> myCart = [];
List<Order> orderHistory = [];
