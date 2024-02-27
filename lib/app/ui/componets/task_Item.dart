import 'package:flutter/material.dart';

class TaskItem extends StatelessWidget {
  final String taskName;
  final String time;
  const TaskItem({super.key, required this.taskName, required this.time});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('task: $taskName',style:const  TextStyle(fontSize: 18),),
              const SizedBox(height:  5,),
              Text('time:  $time',style:const  TextStyle(fontSize: 16,))
            ],
          ),
          IconButton(
            onPressed: (){},
            color: Colors.red,
            icon:const Icon(Icons.delete)
          )
        ],
      ),
    );
  }
}