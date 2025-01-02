import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../provider/provider.dart';

class TodoHomePage extends StatelessWidget {
  const TodoHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final TodoProvider todoProviderFalse = Provider.of<TodoProvider>(context, listen: false);
    final TodoProvider todoProviderTrue = Provider.of<TodoProvider>(context, listen: true);

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: todoProviderTrue.isDarkTheme
          ? ThemeData.dark().copyWith(
        primaryColor: Colors.blueAccent,
        scaffoldBackgroundColor: Colors.black,
        appBarTheme: AppBarTheme(
          backgroundColor: Colors.blue[800],
          titleTextStyle: const TextStyle(color: Colors.white, fontSize: 20),
          elevation: 4,
        ),
        floatingActionButtonTheme: const FloatingActionButtonThemeData(backgroundColor: Colors.blueAccent),
        iconTheme: const IconThemeData(color: Colors.white),
      )
          : ThemeData.light().copyWith(
        primaryColor: Colors.blue[700],
        scaffoldBackgroundColor: Colors.white,
        appBarTheme: AppBarTheme(
          backgroundColor: Colors.blue[700],
          titleTextStyle: const TextStyle(color: Colors.white, fontSize: 20),
          elevation: 4,
        ),
        floatingActionButtonTheme: FloatingActionButtonThemeData(backgroundColor: Colors.blue[700]),
        iconTheme: const IconThemeData(color: Colors.black),
      ),
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Todo List'),
          actions: [
            IconButton(
              onPressed: () {
                todoProviderFalse.toggleTheme();
              },
              icon: Icon(
                todoProviderTrue.isDarkTheme ? Icons.dark_mode : Icons.light_mode,
                size: 28,
              ),
            ),
            IconButton(
              onPressed: () {
                todoProviderFalse.changeView();
              },
              icon: Icon(
                todoProviderTrue.isToggle ? Icons.grid_view : Icons.view_list,
                size: 28,
              ),
            ),
          ],
        ),
        body: FutureBuilder(
          future: todoProviderFalse.fetchData(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            } else if (snapshot.hasData) {
              return Padding(
                padding: const EdgeInsets.all(16.0),
                child: todoProviderTrue.isToggle
                    ? ListView.builder(
                  itemCount: todoProviderFalse.todoList.length,
                  itemBuilder: (context, index) {
                    final todo = todoProviderFalse.todoList[index];
                    return AnimatedContainer(
                      duration: const Duration(milliseconds: 300),
                      margin: const EdgeInsets.symmetric(vertical: 8.0),
                      decoration: BoxDecoration(
                        color: todo.completed
                            ? Colors.blue[600]
                            : Colors.blue[300],
                        borderRadius: BorderRadius.circular(12),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withOpacity(0.1),
                            blurRadius: 8,
                            offset: const Offset(0, 5),
                          ),
                        ],
                      ),
                      child: ListTile(
                        contentPadding: const EdgeInsets.all(16.0),
                        title: Text(
                          todo.title,
                          style: const TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 16,
                            color: Colors.white,
                          ),
                        ),
                        subtitle: Text(
                          'User ID: ${todo.userId}',
                          style: TextStyle(fontSize: 14, color: Colors.grey[300]),
                        ),
                        leading: CircleAvatar(
                          backgroundColor: Colors.white,
                          child: Text(
                            '${todo.id}',
                            style: const TextStyle(
                              color: Colors.blueAccent,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),
                    );
                  },
                )
                    : GridView.builder(
                  itemCount: todoProviderTrue.todoList.length,
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    crossAxisSpacing: 12,
                    mainAxisSpacing: 12,
                  ),
                  itemBuilder: (context, index) {
                    final todo = todoProviderTrue.todoList[index];
                    return AnimatedContainer(
                      duration: const Duration(milliseconds: 300),
                      decoration: BoxDecoration(
                        color: todo.completed
                            ? Colors.blue[600]
                            : Colors.blue[300],
                        borderRadius: BorderRadius.circular(12),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withOpacity(0.1),
                            blurRadius: 8,
                            offset: const Offset(0, 5),
                          ),
                        ],
                      ),
                      child: Center(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              todo.title,
                              textAlign: TextAlign.center,
                              style: const TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 14,
                                color: Colors.white,
                              ),
                            ),
                            const SizedBox(height: 8),
                            Text(
                              'User ID: ${todo.userId}',
                              style: const TextStyle(fontSize: 12, color: Colors.white70),
                            ),
                            const SizedBox(height: 8),
                            CircleAvatar(
                              radius: 14,
                              backgroundColor: Colors.white,
                              child: Text(
                                '${todo.id}',
                                style: const TextStyle(
                                  color: Colors.blueAccent,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                ),
              );
            } else {
              return const Center(
                child: Text(
                  'Error loading data.',
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                ),
              );
            }
          },
        ),
      ),
    );
  }
}
