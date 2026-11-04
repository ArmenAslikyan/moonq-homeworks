import 'package:flutter/material.dart';

class TodoList extends StatefulWidget {
  const TodoList({super.key});

  @override
  State<TodoList> createState() => _TodoListState();
}

class _TodoListState extends State<TodoList> {
  final taskItemController = TextEditingController();

  final List<String> _tasks = [];
  final List<bool> _completedTasks = [];

  @override
  void dispose() {
    taskItemController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffecf6fc),
      body: SingleChildScrollView(
        child: Stack(
          children: [
            Container(
              height: 200,
              width: double.infinity,
              color: const Color(0xff2d489d),
            ),
            Column(
              children: [
                Container(
                  width: double.infinity,
                  padding: const EdgeInsets.only(top: 70, bottom: 40),
                  child: const Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(Icons.fact_check, color: Colors.white, size: 50),
                      SizedBox(width: 10),
                      Text(
                        'Tasks & Notes',
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.w600,
                          fontSize: 25,
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                  width: double.infinity,
                  decoration: const BoxDecoration(
                    color: Color(0xffecf6fc),
                    borderRadius: BorderRadius.vertical(top: Radius.circular(30)),
                  ),
                  child: Padding(
                    padding: const EdgeInsetsGeometry.fromLTRB(20, 20, 20, 0),
                    child: Column(
                      children: [
                        Container(
                          padding: const EdgeInsets.fromLTRB(20, 20, 20, 8),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            color: Colors.white,
                          ),
                          child: Column(
                            children: [
                          Text(
                            'Enter New Task or Item',
                            style: TextStyle(
                              fontWeight: FontWeight.w600,
                              fontSize: 22
                            ),
                          ),
                          SizedBox(height: 20,),
                          TextField(
                            controller: taskItemController,
                            decoration: InputDecoration(
                              prefixIcon: const Icon(Icons.search, color: Color(0xff757575)),
                              hintText: 'e.g., Buy groceries',
                              hintStyle: const TextStyle(
                                color: Color(0xffa0a0a0),
                                fontSize: 15,
                              ),
                              contentPadding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
                              filled: true,
                              fillColor: const Color(0xfff8fafc),
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(30),
                                borderSide: const BorderSide(color: Color(0xffd0dbe7), width: 1.5),
                              ),
                              enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(30),
                                borderSide: const BorderSide(color: Color(0xffd0dbe7), width: 1.5),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(30),
                                borderSide: const BorderSide(color: Color(0xff2d489d), width: 2),
                              ),
                            ),
                          ),
                          const SizedBox(height: 20),
                          SizedBox(
                            width: double.infinity,
                            child: Container(
                              decoration: BoxDecoration(
                                color: const Color(0xff2d82fe),
                                borderRadius: BorderRadius.circular(30),
                              ),   
                              child: InkWell(
                                onTap: () {
                                  final text = taskItemController.text.trim();
                                  if (text.isNotEmpty) {
                                    setState(() {
                                      _tasks.add(text);
                                      _completedTasks.add(false);
                                    });
                                    taskItemController.clear();
                                  }
                                },
                                borderRadius: BorderRadius.circular(30),
                                child: const Padding(
                                  padding: EdgeInsets.symmetric(vertical: 15, horizontal: 20),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Text(
                                        'ADD TO LIST',
                                        style: TextStyle(
                                          color: Colors.white,
                                          fontWeight: FontWeight.bold,
                                          fontSize: 16,
                                        ),
                                      ),
                                      SizedBox(width: 8),
                                      Icon(
                                        Icons.add_circle,
                                        color: Colors.white,
                                        size: 20,
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          ),
                            ],
                          ),
                        ),
                        ListView.builder(
                            shrinkWrap: true,
                            physics: const NeverScrollableScrollPhysics(),
                          padding: EdgeInsets.only(top: 20),
                            itemCount: _tasks.length,
                            itemBuilder: (context, index) {
                              return Container(
                                margin: const EdgeInsets.only(bottom: 10),
                                decoration: BoxDecoration(
                                  color: const Color(0xffeff7fe),
                                  borderRadius: BorderRadius.circular(12),
                                  border: Border.all(
                                    color: const Color(0xffd0dbe7),
                                  ),
                                ),
                                child: ListTile(
                                  contentPadding: const EdgeInsets.symmetric(horizontal: 8),
                                  leading: Checkbox(
                                    value: _completedTasks[index],
                                    activeColor: const Color(0xff2d82fe),
                                    onChanged: (checked) {
                                      setState(() {
                                        _completedTasks[index] = checked ?? false;
                                      });
                                    },
                                  ),
                                  title: Text(
                                    _tasks[index],
                                    style: const TextStyle(
                                      color: Color(0xff202124),
                                      fontSize: 16,
                                    ),
                                  ),
                                  trailing: IconButton(
                                    icon: const Icon(
                                      Icons.delete_outline,
                                      color: Color(0xff757575),
                                    ),
                                    onPressed: () {
                                      setState(() {
                                        _tasks.removeAt(index);
                                        _completedTasks.removeAt(index);
                                      });
                                    },
                                  ),
                                ),
                              );
                            },
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}