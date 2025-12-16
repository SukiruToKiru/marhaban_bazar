import 'package:flutter/material.dart';
import '../data/mock_data.dart'; // Access orderHistory
import '../models/data_model.dart';

class HistoryScreen extends StatefulWidget {
  const HistoryScreen({super.key});

  @override
  State<HistoryScreen> createState() => _HistoryScreenState();
}

class _HistoryScreenState extends State<HistoryScreen> {
  @override
  Widget build(BuildContext context) {
    // Reverse list to show newest first
    List<Order> reversedHistory = List.from(orderHistory.reversed);

    return Scaffold(
      appBar: AppBar(
        title: const Text("Order History"),
        backgroundColor: Colors.teal,
        foregroundColor: Colors.white,
        automaticallyImplyLeading: false,
      ),
      body: reversedHistory.isEmpty
          ? const Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(Icons.history, size: 80, color: Colors.grey),
                  SizedBox(height: 20),
                  Text(
                    "No orders yet.",
                    style: TextStyle(fontSize: 18, color: Colors.grey),
                  ),
                ],
              ),
            )
          : ListView.builder(
              padding: const EdgeInsets.all(16),
              itemCount: reversedHistory.length,
              itemBuilder: (context, index) {
                final order = reversedHistory[index];

                // Format Date helper
                final String timeStr =
                    "${order.date.hour}:${order.date.minute.toString().padLeft(2, '0')}";
                final String dateStr = "${order.date.day}/${order.date.month}";

                return Card(
                  margin: const EdgeInsets.only(bottom: 12),
                  child: ExpansionTile(
                    leading: Container(
                      padding: const EdgeInsets.all(10),
                      decoration: BoxDecoration(
                        color: Colors.teal.withOpacity(0.1),
                        shape: BoxShape.circle,
                      ),
                      child: const Icon(Icons.receipt_long, color: Colors.teal),
                    ),
                    title: Text(
                      order.stallName,
                      style: const TextStyle(fontWeight: FontWeight.bold),
                    ),
                    subtitle: Text("$dateStr at $timeStr"),
                    trailing: Text(
                      "RM ${order.total.toStringAsFixed(2)}",
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Colors.teal,
                        fontSize: 16,
                      ),
                    ),
                    children: [
                      // The list of items inside the dropdown
                      Container(
                        color: Colors.grey[50],
                        padding: const EdgeInsets.all(10),
                        child: Column(
                          children: order.items
                              .map(
                                (item) => Padding(
                                  padding: const EdgeInsets.symmetric(
                                    vertical: 4,
                                  ),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text("• ${item.name}"),
                                      Text(
                                        "RM ${item.price.toStringAsFixed(2)}",
                                        style: TextStyle(
                                          color: Colors.grey[600],
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              )
                              .toList(),
                        ),
                      ),
                    ],
                  ),
                );
              },
            ),
    );
  }
}
