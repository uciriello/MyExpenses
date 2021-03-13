import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AdaptiveButton extends StatelessWidget {
  final String text;
  final Function handler;
  final Color color;
  final bool bold;

  AdaptiveButton({@required this.text, @required this.handler, this.color, @required this.bold});

  @override
  Widget build(BuildContext context) {
    return Platform.isIOS
        ? CupertinoButton(
            onPressed: handler,
            color: this.color != null ? Theme.of(context).primaryColor : null,
            child: Text(
              text,
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
          )
        : FlatButton(
            textColor: this.color == null
                ? Theme.of(context).primaryColor
                : Theme.of(context).textTheme.button.color,
            onPressed: handler,
            color: this.color != null ? Theme.of(context).primaryColor : null,
            child: Text(
              text,
              style: TextStyle(fontWeight: bold ? FontWeight.bold : FontWeight.normal),
            ),
          );
  }
}
