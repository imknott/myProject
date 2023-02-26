import 'package:flutter/material.dart';
class GoalScreen extends StatefulWidget {
  const GoalScreen({Key? key}) : super(key: key);

  @override
  State<GoalScreen> createState() => _GoalScreenState();
}

class _GoalScreenState extends State<GoalScreen> {
  // Instance variables

  final List<Map<String, dynamic>> goals = [
    {'title': 'SleepGoal', 'current': 8, 'target': '8 hrs'},
    {'title': 'WalkGoal', 'current': 1, 'target': '3 miles'},
    {'title': 'WaterGoal', 'current': 1, 'target': '3 L'},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
            backgroundColor: Colors.cyan,
            title: const Text(
              'My goals',
              style: TextStyle(
                fontSize: 30,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        body: ListView.builder(
          itemCount: goals.length,
          itemBuilder: (context, index) {
            var goal = goals[index];
            return ListTile(
              title: Text(goal['title']),
              subtitle: Text('${goal['current']} / ${goal['target']}'),
            );
          },
        ),
      );
  }
}