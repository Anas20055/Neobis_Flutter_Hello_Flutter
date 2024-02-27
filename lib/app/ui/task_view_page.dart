import 'package:flutter/material.dart';
import 'package:neobis_first_app/app/ui/componets/my_diolog.dart';
import 'package:neobis_first_app/app/ui/componets/task_Item.dart';

class TaskViewPage extends StatelessWidget {
  const TaskViewPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Task app'),
      ),
      body: ListView.separated(
        itemCount: 5,
        itemBuilder: (context, index) {
          return const TaskItem(
            taskName: 'Finish App',
            time: '11:45',
          );
        },
        separatorBuilder: (context, index) {
          return const Divider(
            height: 2,
          );
        }
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => showDialog(
          context: context,
          builder: (context)=> const MyDiolog(),
        ),
        child: const Icon(Icons.add),
      ),
    );
  }
}
