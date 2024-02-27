import 'package:flutter/material.dart';
import 'package:neobis_first_app/app/domain/entity/task_entity.dart';
import 'package:shared_preferences/shared_preferences.dart';


class TaskProvider extends ChangeNotifier {
  List<Task> _tasks = [];
  
  List<Task> get tasks => _tasks;

  Future<void> addTask(Task task) async {
    _tasks.add(task);
    await _saveTasksToPrefs();
    notifyListeners();
  }

  Future<void> deleteTask(int index) async {
    _tasks.removeAt(index);
    await _saveTasksToPrefs();
    notifyListeners();
  }

  Future<void> loadTasks() async {
    final prefs = await SharedPreferences.getInstance();
    final taskList = prefs.getStringList('tasks') ?? [];
    _tasks = taskList.map((taskStr) {
      final taskParts = taskStr.split(';');
      return Task(task: taskParts[0], time: taskParts[1]);
    }).toList();
    notifyListeners();
  }

  Future<void> _saveTasksToPrefs() async {
    final prefs = await SharedPreferences.getInstance();
    final taskStrings = _tasks.map((task) => '${task.task};${task.time}').toList();
    prefs.setStringList('tasks', taskStrings);
  }



}