import 'package:choose_activity_app/todo/product/locale_keys.dart';
import 'package:choose_activity_app/todo/service/todo_service.dart';
import 'package:flutter/material.dart';
import 'package:vexana/vexana.dart';

import '../model/todo_model.dart';

class TodoView2 extends StatefulWidget {
  const TodoView2({super.key});

  @override
  State<TodoView2> createState() => _TodoView2State();
}

class _TodoView2State extends State<TodoView2> {
  late final ToDoService toDoService;
  List<TodoModel> toDoModelItems = [];
  bool isLoading = true;

  @override
  void initState() {
    super.initState();
    toDoService = ToDoService(NetworkManager<TodoModel>(
        options: BaseOptions(baseUrl: 'https://fakestoreapi.com/')));
    fetchItems();
  }

  Future<void> fetchItems() async {
    final response = await toDoService.fetchToDoItems();
    toDoModelItems = response;
  }

  void changeLoading(List args) {
    setState(() {
      isLoading = !isLoading;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(LocaleKeys.title.value),
        actions: [
          if (isLoading)
            const Center(
              child: CircularProgressIndicator(),
            )
        ],
      ),
      bottomNavigationBar: ElevatedButton(
          onPressed: (() {}), child: Text(LocaleKeys.name.value)),
      body: GridView.builder(
          gridDelegate:
              SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
          itemCount: toDoModelItems.length,
          itemBuilder: ((context, index) {
            return _ToDo(
              todoModel: toDoModelItems[index],
            );
          })),
    );
  }
}

class _ToDo extends StatelessWidget {
  _ToDo({
    Key? key,
    required this.todoModel,
  }) : super(key: key);

  final TodoModel todoModel;

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15),
      ),
      elevation: 5,
      color: Colors.white, // Set the background color to white
      child: Container(
        width: 200, // Adjust the width as needed
        padding: const EdgeInsets.all(10),
        child: Column(
          mainAxisSize: MainAxisSize.min, // Ensure the column takes minimum space
          children: [
            Column(
              children: [
                Image.network(
                  todoModel.image ?? '',
                  height: 100, // Adjust the height as needed
                  fit: BoxFit.cover,
                ),
                SizedBox(height: 10),
                Text(
                  todoModel.title ?? '',
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                  textAlign: TextAlign.center,
                  overflow: TextOverflow.ellipsis, // Add ellipsis for overflow
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

