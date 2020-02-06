import 'package:flutter/material.dart';

alert(BuildContext context, String msg) {
  showDialog(
    context: context,
    builder: (context) {
      return AlertDialog(
        title: Text("Carros"),
        content: Text(msg),
        actions: <Widget>[
          FlatButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: Text("Cancelar")),
          FlatButton(
            onPressed: () {
              Navigator.pop(context);
              //Fazer algo
            },
            child: Text("Ok"),
          ),
        ],
      );
    },
  );
}