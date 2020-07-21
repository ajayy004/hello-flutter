import 'package:flutter/material.dart';

import './helpers/db_helper.dart';
import 'helpers/db_helper.dart';

class AddTodo extends StatelessWidget {
  TextEditingController _controller = TextEditingController();

  void _onSubmit(_) {
    if (_controller.text != null && _controller.text.length > 0) {
      DbHelper.insert(
        {
          "title": _controller.text,
          "isCompleted": 1,
        },
      );
      _controller.text = '';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10),
      child: TextField(
        decoration: InputDecoration(
          labelText: 'Todo',
          border: OutlineInputBorder(),
        ),
        controller: _controller,
        onSubmitted: _onSubmit,
      ),
    );
  }
}
