import 'package:flutter/material.dart';
import '../models/data_model.dart';
import '../data/mock_data.dart';
import '../widgets/option_tile.dart';
import 'result_screen.dart';

class MenuScreen extends StatefulWidget {
  final Stall stall;

  const MenuScreen({super.key, required this.stall});

  @override
  State<MenuScreen> createState() => _MenuScreenState();
}

class _MenuScreenState extends State<MenuScreen> {
  late List<MenuItem> _localMenu;

  @override
  void initState() {
    super.initState();
    // FIX: Added imagePath here
    _localMenu = widget.stall.menu
        .map(
          (e) => MenuItem(
            name: e.name,
            price: e.price,
            imagePath: e.imagePath, // <--- ADDED THIS
          ),
        )
        .toList();
  }

  void _toggleSelection(int index) {
    setState(() {
      _localMenu[index].isSelected = !_localMenu[index].isSelected;
    });
  }

  void _addToCart() {
    List<MenuItem> selectedItems = _localMenu
        .where((item) => item.isSelected)
        .toList();

    if (selectedItems.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text("Select items to add first!")),
      );
      return;
    }

    setState(() {
      for (var item in selectedItems) {
        // FIX: Added imagePath here
        myCart.add(
          MenuItem(
            name: item.name,
            price: item.price,
            imagePath: item.imagePath, // <--- ADDED THIS
          ),
        );
      }
      for (var item in _localMenu) {
        item.isSelected = false;
      }
    });

    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text("${selectedItems.length} items added to Cart!"),
        backgroundColor: Colors.green,
        duration: const Duration(seconds: 1),
      ),
    );
  }

  void _confirmOrder() {
    List<MenuItem> selectedItems = _localMenu
        .where((item) => item.isSelected)
        .toList();

    if (selectedItems.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text("Please select at least one item!")),
      );
      return;
    }

    double total = selectedItems.fold(0, (sum, item) => sum + item.price);

    // FIX: Added imagePath here for History items
    List<MenuItem> historyItems = selectedItems
        .map(
          (e) => MenuItem(
            name: e.name,
            price: e.price,
            imagePath: e.imagePath, // <--- ADDED THIS
          ),
        )
        .toList();

    orderHistory.add(
      Order(
        date: DateTime.now(),
        stallName: widget.stall.name,
        items: historyItems,
        total: total,
      ),
    );

    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => ResultScreen(
          stallName: widget.stall.name,
          selectedItems: selectedItems,
          totalPrice: total,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.stall.name),
        backgroundColor: Colors.teal,
        foregroundColor: Colors.white,
      ),
      body: Column(
        children: [
          Container(
            padding: const EdgeInsets.all(16),
            color: Colors.teal.withOpacity(0.1),
            width: double.infinity,
            child: const Text(
              "Select your menu:",
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: _localMenu.length,
              itemBuilder: (context, index) {
                return OptionTile(
                  item: _localMenu[index],
                  onToggle: () => _toggleSelection(index),
                );
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Row(
              children: [
                Expanded(
                  child: OutlinedButton(
                    onPressed: _addToCart,
                    style: OutlinedButton.styleFrom(
                      padding: const EdgeInsets.symmetric(vertical: 15),
                    ),
                    child: const Text(
                      "Add to Cart",
                      style: TextStyle(fontSize: 16, color: Colors.teal),
                    ),
                  ),
                ),
                const SizedBox(width: 10),
                Expanded(
                  child: ElevatedButton(
                    onPressed: _confirmOrder,
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.teal,
                      padding: const EdgeInsets.symmetric(vertical: 15),
                    ),
                    child: const Text(
                      "Order Now",
                      style: TextStyle(color: Colors.white, fontSize: 16),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
