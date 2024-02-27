import 'package:flutter/material.dart';
import 'package:neobis_first_app/app/domain/entity/task_entity.dart';


class TaskViewmodel extends ChangeNotifier {
  List<Task> tasks = [];

  addTask(String taskName,String time) {
    final task = Task(task: taskName, time: time);
    tasks.add(task);
    notifyListeners();
  }

  delateTask(int index){
    tasks.removeAt(index);
    notifyListeners();
  }

  setTask(int index){
    
    notifyListeners();
  }


}