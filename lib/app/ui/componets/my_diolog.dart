import 'package:flutter/material.dart';
import 'package:neobis_first_app/app/domain/entity/task_entity.dart';
import 'package:neobis_first_app/app/domain/provider/task_provider.dart';
import 'package:provider/provider.dart';

class MyDiolog extends StatefulWidget {
  const MyDiolog({super.key});

  @override
  State<MyDiolog> createState() => _MyDiologState();
}

class _MyDiologState extends State<MyDiolog> {
  final taskNameController = TextEditingController();
  final timeController = TextEditingController();
  final GlobalKey<FormState> formKey = GlobalKey();

  @override
  void dispose() {
    timeController.dispose();
    taskNameController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final taskProvider = Provider.of<TaskProvider>(context, listen: false);
    return SimpleDialog(
      children: [
        Form(
          key: formKey,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [
                TextFormField(
                  validator: isValueEmpty,
                  controller: taskNameController,
                  maxLines: 1,
                  decoration: const InputDecoration(
                      labelText: 'task name ',
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(16)))),
                ),
                const SizedBox(
                  height: 16,
                ),
                TextFormField(
                  validator: isValueEmpty,
                  controller: timeController,
                  maxLines: 1,
                  decoration: const InputDecoration(
                      labelText: 'time',
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(16)))),
                ),
                const SizedBox(
                  height: 16,
                ),
                ElevatedButton(
                  onPressed: () {
                    if (formKey.currentState?.validate() == true) {
                      Navigator.pop(context);
                      taskProvider.addTask(Task(task:taskNameController.text,time: timeController.text));
                    }
                  },
                  style: ButtonStyle(
                    fixedSize: MaterialStateProperty.all<Size>(
                      const Size(double.maxFinite, 40))),
                  child: const Text('create task'),
                ),
              ],
            ),
          ),
        )
      ],
    );
  }

  String? isValueEmpty(String? value) {
    if (value?.isEmpty == true) {
      return 'Please fill form';
    }
    return null;
  }
}
