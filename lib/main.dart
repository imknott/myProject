import 'dart:math';
import 'dart:async';
import 'package:floating_action_bubble/floating_action_bubble.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:yes_or_no/walk_goal_screen.dart';
import 'package:yes_or_no/water_goal_screen.dart';
import 'goal_screen.dart';
import 'sleep_goal_screen.dart';


void main() {
  runApp(MyApp());
}
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context){
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Walk, Water and Sleep'),
          backgroundColor: Colors.cyan,
        ),
        body: MyHomePage(),

      ),
    );
  }
}

class ClockWidget extends StatefulWidget {
  @override
  _ClockWidgetState createState() => _ClockWidgetState();
}

class _ClockWidgetState extends State<ClockWidget> {
  late String _timeString;

  @override
  void initState() {
    super.initState();
    _timeString = _formatDateTime(DateTime.now());
    Timer.periodic(Duration(seconds: 1), (Timer t) => _getTime());
  }

  void _getTime() {
    final DateTime now = DateTime.now();
    final String formattedDateTime = _formatDateTime(now);
    setState(() {
      _timeString = formattedDateTime;
    });
  }

  String _formatDateTime(DateTime dateTime) {
    return DateFormat('hh:mm:ss a').format(dateTime);
  }

  @override
  Widget build(BuildContext context) {
    //will continue this project an add a function that will change depending on the time.
    return Text(
      '$_timeString you have 8 hours until you need to sleep.' ,
      style: TextStyle(fontSize: 24),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> with SingleTickerProviderStateMixin {

  late Animation<double> _animation;
  late AnimationController _animationController;



  @override
  void initState() {
    _animationController = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 260),
    );

    final curvedAnimation = CurvedAnimation(
        curve: Curves.easeInOut, parent: _animationController);
    _animation = Tween<double>(begin: 0, end: 1).animate(curvedAnimation);


    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        floatingActionButtonLocation: FloatingActionButtonLocation.endDocked,

        //Init Floating Action Bubble
        floatingActionButton: FloatingActionBubble(
          // Menu items
          items: <Bubble>[

            // Floating action menu item
            Bubble(
              title: "Sleep",
              iconColor: Colors.white,
              bubbleColor: Colors.blue,
              icon: Icons.bed,
              titleStyle: TextStyle(fontSize: 16, color: Colors.white),
              onPress: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) =>
                          const SleepGoalScreen(),
                    ));
              },
            ),
            Bubble(
              title: "Walk",
              iconColor: Colors.white,
              bubbleColor: Colors.blue,
              icon: Icons.directions_walk,
              titleStyle: TextStyle(fontSize: 16, color: Colors.white),
              onPress: () {
                Navigator.push(
                    context,
                MaterialPageRoute(
                  builder: (context) =>
                  const WalkGoalScreen(),
                ));
              },
            ),
            // Floating action menu item
            Bubble(
              title: "Water",
              iconColor: Colors.white,
              bubbleColor: Colors.blue,
              icon: Icons.local_drink,
              titleStyle: TextStyle(fontSize: 16, color: Colors.white),
              onPress: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                  builder: (context) =>
                  const WaterGoalScreen(),
                ),);
              },
            ),
            //Floating action menu item
            Bubble(
              title: "Goals",
              iconColor: Colors.white,
              bubbleColor: Colors.blue,
              icon: Icons.flag,
              titleStyle: TextStyle(fontSize: 16, color: Colors.white),
              onPress: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) =>
                    const GoalScreen(),
                  ),);
              },
            ),
          ],

          // animation controller
          animation: _animation,

          // On pressed change animation state
          onPress: () =>
          _animationController.isCompleted
              ? _animationController.reverse()
              : _animationController.forward(),

          // Floating Action button Icon color
          iconColor: Colors.blue,

          // Flaoting Action button Icon
          iconData: Icons.ac_unit,
          backGroundColor: Colors.white,
        ),
        body: Center(
        child: ClockWidget(),
    ),
    );
  }
}