class MenuItem {
  final String name;
  final double price;
  final String imagePath; // Ensure this is here
  bool isSelected;

  MenuItem({
    required this.name,
    required this.price,
    required this.imagePath,
    this.isSelected = false,
  });
}

class Stall {
  final String name;
  final String location;
  final String imagePath;
  final List<MenuItem> menu;

  Stall({
    required this.name,
    required this.location,
    required this.imagePath,
    required this.menu,
  });
}

class Order {
  final DateTime date;
  final String stallName;
  final List<MenuItem> items;
  final double total;

  Order({
    required this.date,
    required this.stallName,
    required this.items,
    required this.total,
  });
}
