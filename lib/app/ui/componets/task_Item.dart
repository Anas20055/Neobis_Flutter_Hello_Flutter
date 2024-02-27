import 'package:flutter/material.dart';
import 'package:neobis_first_app/app/domain/provider/task_provider.dart';
import 'package:provider/provider.dart';

class TaskItem extends StatelessWidget {
  final String taskName;
  final String time;
  final int index;
  const TaskItem({super.key, required this.taskName, required this.time, required this.index});

  @override
  Widget build(BuildContext context) {
    final taskProvider = Provider.of<TaskProvider>(context, listen: false);
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
            onPressed: ()=>taskProvider.deleteTask(index),
            color: Colors.red,
            icon:const Icon(Icons.delete)
          )
        ],
      ),
    );
  }
}