import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo_list22/provider/to_do_provider.dart';

class ToDo extends StatefulWidget {
  const ToDo({super.key});

  @override
  State<ToDo> createState() => _ToDoState();
}

class _ToDoState extends State<ToDo> {
  final itemTextController = TextEditingController();

  @override
  void dispose() {
    itemTextController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final toDos = context.watch<ToDoProvider>().toDos;

    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              const SizedBox(height: 24),
              const Text(
                'To do list',
                style: TextStyle(fontSize: 24),
              ),
              const SizedBox(height: 16),
              TextField(
                controller: itemTextController,
                onChanged: (_) => setState(() {}),
                decoration: const InputDecoration(
                  labelText: 'Todo item',
                  border: OutlineInputBorder(),
                ),
              ),
              const SizedBox(height: 12),
              ElevatedButton(
                onPressed: itemTextController.text.trim().isEmpty
                    ? null
                    : () {
                  final toDo = itemTextController.text.trim();
                  if (toDo.isEmpty) return;
                  context
                      .read<ToDoProvider>()
                      .add(toDo);
                  itemTextController.clear();
                  setState(() {});
                },
                child: const Text('Ավելացնել'),
              ),
              const SizedBox(height: 16),
              Expanded(
                child: ListView.builder(
                  itemCount: toDos.length,
                  itemBuilder: (context, index) {
                    return ListTile(
                      title: Text(toDos[index]),
                      trailing: IconButton(
                        icon: const Icon(Icons.delete),
                        tooltip: 'Delete todo',
                        onPressed: () =>
                            context.read<ToDoProvider>().delete(index),
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}