import 'package:flutter/material.dart';
import '../models/data_model.dart';

class OptionTile extends StatelessWidget {
  final MenuItem item;
  final VoidCallback onToggle;

  const OptionTile({super.key, required this.item, required this.onToggle});

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 2,
      margin: const EdgeInsets.symmetric(vertical: 6, horizontal: 16),
      child: InkWell(
        onTap: onToggle,
        borderRadius: BorderRadius.circular(12),
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Row(
            children: [
              // Checkbox Icon
              Icon(
                item.isSelected ? Icons.check_circle : Icons.circle_outlined,
                color: item.isSelected ? Colors.teal : Colors.grey,
                size: 28,
              ),

              // 2. NEW: The Food Image
              ClipRRect(
                borderRadius: BorderRadius.circular(8),
                child: Image.asset(
                  item.imagePath,
                  width: 60,
                  height: 60,
                  fit: BoxFit.cover,
                  // Fallback if image not found
                  errorBuilder: (c, e, s) => Container(
                    width: 60,
                    height: 60,
                    color: Colors.grey[200],
                    child: Icon(Icons.fastfood, color: Colors.grey),
                  ),
                ),
              ),
              const SizedBox(width: 12),

              const SizedBox(width: 16),
              // Text Info
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      item.name,
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                      ),
                    ),
                    const SizedBox(height: 4),
                    Text(
                      "RM ${item.price.toStringAsFixed(2)}",
                      style: TextStyle(color: Colors.grey[700]),
                    ),
                  ],
                ),
              ),
              // Real Checkbox (Visual aid)
              IgnorePointer(
                child: Checkbox(
                  value: item.isSelected,
                  activeColor: Colors.teal,
                  onChanged: (val) {},
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
