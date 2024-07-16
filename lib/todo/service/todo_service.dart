import 'package:choose_activity_app/todo/model/todo_model.dart';
import 'package:vexana/vexana.dart';

class ToDoService {
  final INetworkManager networkManager;

  ToDoService(this.networkManager);

  Future<List<TodoModel>> fetchToDoItems() async {
    final response = await networkManager.send(ServicePath.todo.path,
        parseModel: TodoModel(), method: RequestType.GET);
    return response.data ?? [];
  }
}

enum ServicePath {
  todo('todo.json');

  final String path;

  const ServicePath(this.path);
}
