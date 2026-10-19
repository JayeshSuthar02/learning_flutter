import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  int number = 0;
  Map<String, dynamic> data = {'name': 'Amit', 'age': 20};

  late Employee emp;

  @override
  void initState() {
    super.initState();
    emp = Employee.fromJson(data);

    Employee testEmp = Employee.fromJson({'name': 'Rahul', 'age': 30});

    print(testEmp.toJson());
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: SafeArea(
          child: Center(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(number.toString()),
                ElevatedButton(
                  onPressed: () {
                    setState(() {
                      number++;
                    });
                  },
                  child: Text('Increse'),
                ),
                ElevatedButton(
                  onPressed: () {
                    setState(() {
                      number = 0;
                    });
                  },
                  child: Text('Reset'),
                ),
                Text(emp.name),

                Text(emp.age.toString()),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class Employee {
  String name;
  int age;

  Employee(this.name, this.age);

  factory Employee.fromJson(Map<String, dynamic> json) {
    return Employee(json['name'], json['age']);
  }

  Map<String, dynamic> toJson() {
    return {'name': name, 'age': age};
  }
}
