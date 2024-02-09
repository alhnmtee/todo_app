import 'package:flutter/material.dart';
import 'package:todo_app/constants/tasktype.dart';
import 'package:todo_app/model/task.dart';

class TodoItem extends StatefulWidget {
  const TodoItem({super.key, required this.task});
  final Task task;

  @override
  State<TodoItem> createState() => _TodoItemState();
}

class _TodoItemState extends State<TodoItem> {
  bool isCheck = false;
  @override
  Widget build(BuildContext context) {
    return Card(
      color: widget.task.isCompleted ? Colors.grey.shade300 : Colors.white,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15.0),
      ),
      child: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            widget.task.type == TaskType.note
                ? Image.asset('lib/assets/images/Category.png')
                : widget.task.type == TaskType.contest
                    ? Image.asset(
                        'lib/assets/images/Category2.png',
                      )
                    : Image.asset(
                        'lib/assets/images/Category (1).png',
                      ),
            Expanded(
              child: Column(
                children: [
                  Text(
                    widget.task.title,
                    style: TextStyle(
                        decoration: widget.task.isCompleted
                            ? TextDecoration.lineThrough
                            : null,
                        fontSize: 20,
                        fontWeight: FontWeight.bold),
                  ),
                  Text(
                    widget.task.description,
                    style: TextStyle(
                        decoration: widget.task.isCompleted
                            ? TextDecoration.lineThrough
                            : null,
                        fontSize: 15),
                  ),
                ],
              ),
            ),
            Checkbox(
                value: isCheck,
                onChanged: (val) => {
                      setState(() {
                        widget.task.isCompleted = !widget.task.isCompleted;
                        isCheck = val!;
                      })
                    }),
          ],
        ),
      ),
    );
  }
}
