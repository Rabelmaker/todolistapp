import 'package:calendar_slider/calendar_slider.dart';
import 'package:flutter/material.dart';
import 'customtodocard.dart';

class Todolistscreen extends StatefulWidget {
  const Todolistscreen({super.key});

  @override
  State<Todolistscreen> createState() => _TodolistscreenState();
}

class _TodolistscreenState extends State<Todolistscreen> {
  List<Map<String, dynamic>> todosMorning = [
    {
      'title': 'Buy Groceries',
      'description': 'Milk, Bread, Eggs',
      'completed': false,
      'tag': 'Priority',
      'originalTag': 'Priority',
      'deadline': '10:00 AM',
      'initialColor': Colors.red,
      'originalColor': Colors.red,
    },
    {
      'title': 'Study Flutter',
      'description': 'Learn state management',
      'completed': false,
      'tag': 'Studying',
      'originalTag': 'Studying',
      'deadline': '3:00 PM',
      'initialColor': Colors.orange,
      'originalColor': Colors.orange,
    },
    {
      'title': 'Exercise',
      'description': 'Go for a 5km run',
      'completed': false,
      'tag': 'Not Busy',
      'originalTag': 'Not Busy',
      'deadline': '6:00 AM',
      'initialColor': Colors.blue,
      'originalColor': Colors.blue,
    },
  ];
  List<Map<String, dynamic>> todosEvening = [
    {
      'title': 'Buy Groceries',
      'description': 'Milk, Bread, Eggs',
      'completed': false,
      'tag': 'Priority',
      'originalTag': 'Priority',
      'deadline': '10:00 AM',
      'initialColor': Colors.red,
      'originalColor': Colors.red,
    },
    {
      'title': 'Study Flutter',
      'description': 'Learn state management',
      'completed': false,
      'tag': 'Studying',
      'originalTag': 'Studying',
      'deadline': '3:00 PM',
      'initialColor': Colors.orange,
      'originalColor': Colors.orange,
    },
    {
      'title': 'Exercise',
      'description': 'Go for a 5km run',
      'completed': false,
      'tag': 'Not Busy',
      'originalTag': 'Not Busy',
      'deadline': '6:00 AM',
      'initialColor': Colors.blue,
      'originalColor': Colors.blue,
    },
  ];

  @override
  Widget build(BuildContext context) {
    Color secondaryColor = const Color(0xFF1E1E1E);
    Color backgroundColor = const Color(0xFFF3F3F3);

    return Scaffold(
      backgroundColor: backgroundColor,
      body: SafeArea(
        child: ListView(
          children: [
            Container(
              width: double.infinity,
              color: secondaryColor,
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            Container(
                              width: 70,
                              height: 70,
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                border: Border.all(
                                  color: Colors.white,
                                  width: 2,
                                ),
                              ),
                              child: const CircleAvatar(
                                radius: 35,
                                backgroundImage:
                                    AssetImage('assets/avatar.jpeg'),
                              ),
                            ),
                            const SizedBox(width: 16),
                            const Text(
                              'Hello Akbar',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                        Container(
                          height: 40,
                          width: 40,
                          decoration: BoxDecoration(
                            color: const Color(0xFFF3AF01),
                            borderRadius: BorderRadius.circular(25),
                          ),
                          child: const Icon(
                            Icons.notifications_none_rounded,
                            color: Colors.white,
                            size: 30,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 35),
                    const Text(
                      'Todo List',
                      style: TextStyle(fontSize: 30, color: Colors.white),
                    ),
                    const SizedBox(height: 16),
                    TextField(
                      decoration: InputDecoration(
                        hintText: 'Search...',
                        hintStyle: const TextStyle(color: Colors.grey),
                        prefixIcon:
                            const Icon(Icons.search, color: Colors.grey),
                        filled: true,
                        fillColor: Colors.white,
                        contentPadding: const EdgeInsets.symmetric(
                            vertical: 15, horizontal: 20),
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(25),
                          borderSide: BorderSide(
                            color: Colors.white.withOpacity(0.2),
                          ),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(25),
                        ),
                      ),
                      style: const TextStyle(color: Colors.grey),
                    ),
                    const SizedBox(height: 20),
                    const Text(
                      'Today, September 2024',
                      style: TextStyle(color: Colors.white, fontSize: 18),
                    ),
                    SizedBox(
                      height: 100,
                      child: CalendarSlider(
                        selectedDayPosition: SelectedDayPosition.left,
                        tileBackgroundColor: Colors.transparent,
                        dateColor: Colors.white,
                        selectedDateColor: Colors.white,
                        initialDate: DateTime.now(),
                        firstDate: DateTime.now().subtract(
                          const Duration(days: 140),
                        ),
                        lastDate: DateTime.now().add(const Duration(days: 4)),
                        onDateSelected: (date) {
                        },
                        monthYearTextColor: Colors.transparent,
                        monthYearButtonBackgroundColor: Colors.transparent,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 20),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 16),
              child: Text(
                'Morning',
                style: TextStyle(
                  fontSize: 16,
                ),
              ),
            ),
            ...todosMorning.map((todo) {
              return CustomTodoCard(
                title: todo['title'] ?? 'No Title',
                description: todo['description'] ?? 'No Description',
                isCompleted: todo['completed'] ?? false,
                tag: todo['tag'] ?? 'No Tag',
                deadline: todo['deadline'] ?? 'No Deadline',
                initialColor: todo['initialColor'],
                onChanged: (bool? newValue) {
                  setState(() {
                    todo['completed'] = newValue ?? false;
                    if (newValue == true) {
                      todo['tag'] = 'Completed';
                      todo['initialColor'] = Colors.green;
                    } else {
                      todo['tag'] = todo['originalTag'];
                      todo['initialColor'] = todo['originalColor'];
                    }
                  });
                },
              );
            }),
            const SizedBox(height: 20),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 16),
              child: Text(
                'Evening',
                style: TextStyle(
                  fontSize: 16,
                ),
              ),
            ),
            ...todosEvening.map((todo) {
              return CustomTodoCard(
                title: todo['title'] ?? 'No Title',
                description: todo['description'] ?? 'No Description',
                isCompleted: todo['completed'] ?? false,
                tag: todo['tag'] ?? 'No Tag',
                deadline: todo['deadline'] ?? 'No Deadline',
                initialColor: todo['initialColor'],
                onChanged: (bool? newValue) {
                  setState(() {
                    todo['completed'] = newValue ?? false;
                    if (newValue == true) {
                      todo['tag'] = 'Completed';
                      todo['initialColor'] = Colors.green;
                    } else {
                      todo['tag'] = todo['originalTag'];
                      todo['initialColor'] = todo['originalColor'];
                    }
                  });
                },
              );
            }),
            const SizedBox(height: 50),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        backgroundColor: Colors.blue,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(30),
          side: const BorderSide(color: Colors.white, width: 2),
        ),
        child: const Icon(
          Icons.add,
          color: Colors.white,
        ),
      ),
    );
  }
}
