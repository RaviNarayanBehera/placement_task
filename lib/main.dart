// Task-1

// import 'package:flutter/material.dart';
// import 'package:placement_task/task_1/provider/provider.dart';
// import 'package:placement_task/task_1/screen/home_page.dart';
//
// import 'package:provider/provider.dart';
//
// void main() {
//   WidgetsFlutterBinding.ensureInitialized();
//   runApp(const MyApp());
// }
//
// class MyApp extends StatelessWidget {
//   const MyApp({super.key});
//
//   @override
//   Widget build(BuildContext context) {
//     return MultiProvider(
//       providers: [
//         ChangeNotifierProvider(
//           create: (context) => TodoProvider(),
//         ),
//       ],
//       builder: (context, child) => MaterialApp(
//         debugShowCheckedModeBanner: false,
//         theme: ThemeData(
//           colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
//           useMaterial3: true,
//         ),
//         initialRoute: '/todo',
//         routes: {
//           '/todo': (context)=>const TodoHomePage(),
//
//         },
//       ),
//     );
//   }
// }


// Task-2

