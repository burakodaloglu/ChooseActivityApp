import 'package:choose_activity_app/todo/product/locale_keys.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class TodoView extends StatefulWidget {
  const TodoView({super.key});

  @override
  State<TodoView> createState() => _TodoViewState();
}

class _TodoViewState extends State<TodoView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(LocaleKeys.title.value),
      ),
      bottomNavigationBar: ElevatedButton(onPressed: ((){}),child: Text(LocaleKeys.name.value)),
      body: GridView.builder(
          gridDelegate:
              SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 3),
          itemBuilder: ((context, index) {
            return Column(
              children: const[
                Placeholder(fallbackHeight: 20,),
                Padding(
                  padding: EdgeInsets.only(top: 20),
                  child: Text("Events"),
                )
              ],
            );
          })),
    );
  }
}
