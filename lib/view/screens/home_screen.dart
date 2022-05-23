import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Todo App"),
      ),
      body: const Center(),
      floatingActionButton: FloatingActionButton(
        onPressed: (){},
        tooltip: 'Add',
        child: const Icon(Icons.add),
      ),
    );
  }
}
