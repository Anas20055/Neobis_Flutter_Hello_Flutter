import 'package:flutter/material.dart';
import 'package:neobis_first_app/app/domain/provider/task_provider.dart';
import 'package:neobis_first_app/app/ui/componets/my_diolog.dart';
import 'package:neobis_first_app/app/ui/componets/task_Item.dart';
import 'package:provider/provider.dart';

class TaskViewPage extends StatelessWidget {
  const TaskViewPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Task app'),
      ),
      body: Consumer<TaskProvider>(builder: (context, taskProvider, _) {
        taskProvider.loadTasks();
        return taskProvider.tasks.isEmpty
            ? const Center(
                child: Text('You don\'t have tasks right now'),
              )
            : ListView.separated(
                itemCount: taskProvider.tasks.length,
                itemBuilder: (context, index) {
                  final task = taskProvider.tasks[index];
                  return TaskItem(
                    taskName: task.task,
                    time: task.time,
                    index: index,
                  );
                },
                separatorBuilder: (context, index) {
                  return const Divider(
                    height: 2,
                  );
                });
      }),
      floatingActionButton: FloatingActionButton(
        onPressed: () => showDialog(
          context: context,
          builder: (context) => const MyDiolog(),
        ),
        child: const Icon(Icons.add),
      ),
    );
  }
}
