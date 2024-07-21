import 'package:vexana/vexana.dart';

class TodoModel extends INetworkModel<TodoModel> {
  String? image;
  String? title;

  TodoModel({
    this.image,
    this.title,
  });

  @override
  Map<String, dynamic>? toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['image'] = image;
    data['title'] = title;

    return data;
  }

  @override
  TodoModel fromJson(Map<String, dynamic> json) => TodoModel.fromJson(json);

  TodoModel copyWith({
    String? image,
    String? title,
  }) {
    return TodoModel(
        image: image ?? this.image,
        title: title ?? this.title
    );
  }

  TodoModel.fromJson(Map<String, dynamic> json) {
    image = json['image'];
    title = json['title'];
  }
}
