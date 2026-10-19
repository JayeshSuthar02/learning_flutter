import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: CounterScreen(),
    );
  }
}

class CounterScreen extends StatefulWidget {
  const CounterScreen({super.key});

  @override
  State<CounterScreen> createState() {
    return _CounterScreenState();
  }
}

class _CounterScreenState extends State<CounterScreen> {
  int count = 0;
  final TextEditingController countController = TextEditingController();

  Color getBackgroundcolor() {
    if(count == 0){
      return Colors.grey;
    } else if (count < 6){
      return Colors.green;
    } else if (count < 10){
      return Colors.orange;
    }
    else {
      return Colors.red;
    }
  }

  String getCounterMessage(){
    if(count == 0) {
      return "Start Counting";
    }
    else if(count <6){
      return "Good";
    } else if(count < 10){
      return "Almost there";
    } else {
      return "Maximum Reached";
    }
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: getBackgroundcolor(),

      appBar: AppBar(
        title: const Text("Counter",style: TextStyle(fontSize: 28,fontWeight: FontWeight.bold),),
        backgroundColor: Colors.grey,
        foregroundColor: Colors.white,
      ),

      body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "$count",
                style: const TextStyle(fontSize: 40,color: Colors.white),
              ),

              Text(
                getCounterMessage(),
                style: TextStyle(fontSize: 20,color: Colors.white),
              ),

              TextField(
                  controller: countController,
                  keyboardType: TextInputType.number,
                  decoration: const InputDecoration(
                      hintText: "Enter count Value"
                  )
              ),
              ElevatedButton(
                onPressed: (){
                  if(countController.text.isEmpty){
                    ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(
                          content: Text("Please enter a value"),
                        )
                    );
                    return;
                  }
                  int? value = int.tryParse(countController.text);


                  if(value == null) {
                    ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(
                          content: Text("Please enter a valid value"),
                        )
                    );
                    return;
                  }

                  if(value < 0) {
                    ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(
                          content: Text('Value cannot be negative'),
                        )
                    );
                    return;
                  }

                  if(value > 10) {
                    ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(
                            content: Text('Value cannot be greater than 10')
                        )
                    );
                    return;
                  }
                  setState(() {
                    count = value;
                  });

                },
                child: const Text("Set Count"),
              )

            ],
          )
      ),

      floatingActionButton: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,

        children: [

          SizedBox(
            width: 80,
            height: 80,
            child:
            FloatingActionButton(
              backgroundColor: Colors.green,
              foregroundColor: Colors.white,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15),
              ),
              onPressed: () {
                if(count < 10) {
                  setState(() {
                    count++;
                  });
                } else {
                  ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar (
                          content: Text("Counter cannot be greater than 10")
                      )
                  );
                }
              },
              child: const Icon(Icons.add),
            ),

          ),
          SizedBox(
              width: 80,
              height: 80,
              child:

              FloatingActionButton(
                  backgroundColor: Colors.red,
                  foregroundColor: Colors.white,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15),
                  ),
                  onPressed: () {
                    if(count > 0) {
                      setState(() {
                        count--;
                      });
                    } else {
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(
                          content: Text("Counter cannot be negative"),
                        ),
                      );
                    }
                  },
                  child: const Icon(Icons.remove)
              )
          ),
        ],
      ),
    );
  }
}