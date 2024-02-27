import 'package:flutter/material.dart';
import 'package:neobis_first_app/app/domain/provider/task_provider.dart';
import 'package:neobis_first_app/app/ui/task_view_page.dart';
import 'package:provider/provider.dart';


void main() {
  runApp(const NeobisFirstApp());
}

class NeobisFirstApp extends StatelessWidget {
  const NeobisFirstApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => TaskProvider(),
      child: MaterialApp(
        theme: ThemeData(
          useMaterial3: false,
        ),
        debugShowCheckedModeBanner: false,
        home:const  TaskViewPage(),
      ),
    );
  }
}
