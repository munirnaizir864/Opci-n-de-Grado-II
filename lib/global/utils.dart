import 'package:intl/intl.dart';
import 'package:flutter/material.dart';

String dateFormat(String dateTime) {
  DateTime date = DateTime.parse(dateTime);
  String formattedDate = DateFormat('dd/MM/yyyy').format(date);
  return formattedDate;
}

String startEndHour2(String dateTime) {
  DateTime date = DateTime.parse(dateTime);
  String formattedDate = DateFormat('hh:mm a').format(date);
  return formattedDate;
}

class Dialogs {
  static void alert(BuildContext context, {String title, String description}) {
    showDialog(
      context: context,
      child: AlertDialog(
        title: title != null ? Text(title) : null,
        content: description != null ? Text(description) : null,
        actions: <Widget>[
          FlatButton(
            child: Text("OK"),
            onPressed: () => Navigator.pop(context),
          )
        ],
      ),
    );
  }

  static void alert2(BuildContext context, VoidCallback onTap,
      {String title, String description}) {
    showDialog(
      context: context,
      child: AlertDialog(
        title: title != null ? Text(title) : null,
        content: description != null ? Text(description) : null,
        actions: <Widget>[FlatButton(child: Text("OK"), onPressed: onTap)],
      ),
    );
  }
}
