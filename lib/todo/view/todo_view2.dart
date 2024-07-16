import 'package:choose_activity_app/todo/product/locale_keys.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class TodoView2 extends StatefulWidget {
  const TodoView2({super.key});

  @override
  State<TodoView2> createState() => _TodoView2State();
}

class _TodoView2State extends State<TodoView2> {
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
