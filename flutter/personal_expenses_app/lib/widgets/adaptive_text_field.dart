import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

class AdaptiveText extends StatelessWidget {
  String label;
  TextEditingController _onChangeHandle;
  TextInputType _inputType = TextInputType.text;
  Function _onSubmit;

  AdaptiveText(
    this.label,
    this._onChangeHandle,
    this._inputType,
    this._onSubmit,
  );

  @override
  Widget build(BuildContext context) {
    return Platform.isIOS
        ? Column(
            children: <Widget>[
              SizedBox(
                height: 10,
              ),
              CupertinoTextField(
                placeholder: label,
                controller: _onChangeHandle,
                keyboardType: _inputType,
              ),
              SizedBox(
                height: 10,
              )
            ],
          )
        : TextField(
            controller: _onChangeHandle,
            decoration: InputDecoration(labelText: label),
            keyboardType: _inputType,
          );
  }
}
