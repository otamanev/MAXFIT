import 'package:flutter/material.dart';
import 'package:flutter_application_2/domain/workout.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).primaryColor,
      appBar: AppBar(
        title: const Text('MaxFit'),
        leading: const Icon(Icons.fitness_center),
      ),
      body: WorkoutsList(),
    );
  }
}

class WorkoutsList extends StatelessWidget {
  final workouts = <Workout>[
    Workout(
        title: 'Test1',
        author: 'Max1',
        description: 'Test Workout1',
        level: 'Beginner'),
    Workout(
        title: 'Test2',
        author: 'Max2',
        description: 'Test Workout2',
        level: 'Intermediant'),
    Workout(
        title: 'Test3',
        author: 'Max3',
        description: 'Test Workout3',
        level: 'Advanced'),
    Workout(
        title: 'Test4',
        author: 'Max4',
        description: 'Test Workout4',
        level: 'Beginner'),
    Workout(
        title: 'Test5',
        author: 'Max5',
        description: 'Test Workout5',
        level: 'Intermediant'),
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Container(
        child: ListView.builder(
            itemCount: workouts.length,
            itemBuilder: (context, i) {
              return Card(
                elevation: 2.0,
                margin: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                child: Container(
                  decoration: BoxDecoration(
                    color: Color.fromRGBO(50, 65, 85, 0.8),
                  ),
                  child: ListTile(
                    contentPadding: EdgeInsets.symmetric(horizontal: 10),
                    leading: Container(
                      padding: EdgeInsets.only(right: 12),
                      child: Icon(Icons.fitness_center, color: Colors.white),
                      decoration: BoxDecoration(
                          border: Border(
                              right:
                                  BorderSide(width: 1, color: Colors.white24))),
                    ),
                    title: Text(workouts[i].title ?? '',
                        style: TextStyle(
                            color: Colors.white, fontWeight: FontWeight.bold)),
                    trailing:
                        Icon(Icons.keyboard_arrow_right, color: Colors.white),
                    subtitle: subtitle(context, workouts[i]),
                  ),
                ),
              );
            }),
      ),
    );
  }
}

Widget subtitle(BuildContext context, Workout workout) {
  var color = Colors.grey;
  double indicatorLevel = 0;

  switch (workout.level) {
    case 'Beginner':
      color = Colors.green;
      indicatorLevel = 0.33;
      break;

    case 'Intermediant':
      color = Colors.yellow;
      indicatorLevel = 0.66;
      break;

    case 'Advanced':
      color = Colors.red;
      indicatorLevel = 1;
      break;
  }

  return Row(children: <Widget>[
    Expanded(
      flex: 1,
      child: LinearProgressIndicator(
          backgroundColor: Theme.of(context).textTheme.headline6?.color,
          value: indicatorLevel,
          valueColor: AlwaysStoppedAnimation(color)),
    ),
    SizedBox(width: 10),
    Expanded(
      flex: 3,
      child: Text(workout?.level ?? '',
          style:
              TextStyle(color: Theme.of(context).textTheme.headline6?.color)),
    ),
  ]);
}
