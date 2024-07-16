import 'dart:html';
import 'package:vexana/vexana.dart';

class TodoModel extends INetworkModel<TodoModel> {
  String? imageUrl;
  String? title;

  TodoModel({
    this.imageUrl,
    this.title,
  });

  @override
  Map<String, dynamic>? toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['imageUrl'] = imageUrl;
    data['title'] = title;

    return data;
  }

  @override
  TodoModel fromJson(Map<String, dynamic> json) => TodoModel.fromJson(json);

  TodoModel copyWith({
    String? imageUrl,
    String? title,
  }) {
    return TodoModel(
        imageUrl: imageUrl ?? this.imageUrl, title: title ?? this.title);
  }

  TodoModel.fromJson(Map<String, dynamic> json) {
    imageUrl = json['imageUrl'];
    title = json['title'];
  }
}
