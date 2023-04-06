import 'package:flutter/material.dart';
import 'package:todo/models/todo_model.dart';
import 'package:todo/utils/date_time_utils.dart';

class TodoItem extends StatefulWidget {
  final TodoModel todoModel;
  final Function(BuildContext context, TodoModel todoModel)? onDoneButtonClick;

  const TodoItem({Key? key, required this.todoModel, this.onDoneButtonClick}) : super(key: key);

  @override
  State<TodoItem> createState() => _TodoItemState();
}

class _TodoItemState extends State<TodoItem> {
  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    DateTimeUtils.formatDeadline(widget.todoModel.deadline),
                    style:
                        const TextStyle(fontSize: 16.0, color: Colors.blueGrey),
                  ),
                  const SizedBox(height: 10.0),
                  Text(
                    widget.todoModel.todo,
                    style: const TextStyle(
                      fontSize: 30.0,
                    ),
                  )
                ],
              ),
            ),
            IconButton(
              onPressed: _handleDone,
              icon: !widget.todoModel.isDone
                  ? const Icon(
                      Icons.check_circle_outline,
                      size: 36.0,
                      color: Colors.green,
                    )
                  : const Icon(
                      Icons.check_circle,
                      size: 36.0,
                      color: Colors.green,
                    ),
            ),
          ],
        ),
      ),
    );
  }

  void _handleDone() {
    setState(() {
      widget.todoModel.isDone = !widget.todoModel.isDone;
    });

    if (widget.onDoneButtonClick != null) {
      widget.onDoneButtonClick!(context, widget.todoModel);
    }
  }
}
