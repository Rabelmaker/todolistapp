import 'package:flutter/material.dart';

class CustomTodoCard extends StatelessWidget {
  final String title;
  final String description;
  final bool isCompleted;
  final String tag;
  final String deadline;
  final Function(bool?)? onChanged;
  final Color initialColor;

  const CustomTodoCard({
    super.key,
    required this.title,
    required this.description,
    required this.isCompleted,
    required this.tag,
    required this.deadline,
    required this.initialColor,
    this.onChanged,
  });

  Color _getTagColor(String tag) {
    switch (tag) {
      case 'Completed':
        return const Color(0xff0ABD11);
      case 'Priority':
        return const Color(0xffF31E01);
      case 'Not Busy':
        return const Color(0xff018CF3);
      case 'Studying':
        return const Color(0xffF3AF01);
      default:
        return Colors.grey;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
      ),
      elevation: 4,
      child: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Stack(
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  width: 5,
                  height: 60,
                  decoration: BoxDecoration(
                    color: isCompleted ? Colors.green : initialColor,
                    borderRadius: const BorderRadius.only(
                      topLeft: Radius.circular(12),
                      bottomLeft: Radius.circular(12),
                    ),
                  ),
                ),
                const SizedBox(width: 10),
                Checkbox(
                  value: isCompleted,
                  onChanged: onChanged,
                  activeColor: Colors.green,
                ),
                const SizedBox(width: 10),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        title,
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          decoration: isCompleted
                              ? TextDecoration.lineThrough
                              : TextDecoration.none,
                        ),
                      ),
                      const SizedBox(height: 5),
                      Text(
                        description,
                        style: TextStyle(
                          fontSize: 14,
                          color: Colors.grey[600],
                          decoration: isCompleted
                              ? TextDecoration.lineThrough
                              : TextDecoration.none,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            Positioned(
              top: 0,
              right: 0,
              child: Container(
                padding: const EdgeInsets.symmetric(vertical: 4, horizontal: 8),
                decoration: BoxDecoration(
                  color: _getTagColor(tag),
                  borderRadius: const BorderRadius.only(
                    topRight: Radius.circular(12),
                    bottomLeft: Radius.circular(12),
                  ),
                ),
                child: Text(
                  tag,
                  style: const TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 12,
                  ),
                ),
              ),
            ),
            Positioned(
              bottom: 0,
              right: 0,
              child: Padding(
                padding: const EdgeInsets.only(right: 10, bottom: 8),
                child: Text(
                  'Due: $deadline',
                  style: const TextStyle(
                    fontSize: 12,
                    color: Colors.grey,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
