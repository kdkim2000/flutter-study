import 'package:flutter/material.dart';

class AddTodoDialog extends StatefulWidget {
  final Function(String) onAdd;
  const AddTodoDialog({required this.onAdd, super.key});

  @override
  State<AddTodoDialog> createState() => _AddTodoDialogState();
}

class _AddTodoDialogState extends State<AddTodoDialog> {
  String _title = '';
  final _controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text('할 일 추가'),
      content: TextField(
        controller: _controller,
        autofocus: true,
        decoration: InputDecoration(hintText: '할 일 입력'),
        onChanged: (value) => setState(() => _title = value),
        onSubmitted: (value) {
          if (value.trim().isNotEmpty) {
            widget.onAdd(value.trim());
            Navigator.pop(context);
          }
        },
      ),
      actions: [
        TextButton(
          child: Text('취소'),
          onPressed: () => Navigator.pop(context),
        ),
        TextButton(
          child: Text('추가'),
          onPressed: () {
            if (_title.trim().isNotEmpty) {
              widget.onAdd(_title.trim());
              Navigator.pop(context);
            }
          },
        ),
      ],
    );
  }
}