import 'dart:math';

import 'package:flutter/material.dart';

import 'package:intl/intl.dart';
import '../models/transaction.dart';

class TransactionItems extends StatefulWidget {
  const TransactionItems({
    Key key,
    @required this.transaction,
    @required this.delTransaction,
  }) : super(key: key);

  final Transaction transaction;
  final Function delTransaction;

  @override
  _TransactionItemsState createState() => _TransactionItemsState();
}

class _TransactionItemsState extends State<TransactionItems> {
  Color bgColor;
  @override
  void initState() {
    const avalableColor = [
      Colors.red,
      Colors.blue,
      Colors.cyan,
      Colors.purple,
    ];

    bgColor = avalableColor[Random().nextInt(4)];
    super.initState();
    
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5,
      margin: EdgeInsets.symmetric(horizontal: 20, vertical: 8),
      child: ListTile(
        leading: CircleAvatar(
          backgroundColor: bgColor,
          radius: 30,
          child: Padding(
            padding: EdgeInsets.all(6),
            child: FittedBox(
              child: Text(
                '\₹${widget.transaction.amount.toStringAsFixed(2)}',
              ),
            ),
          ),
        ),
        title: Text(
          widget.transaction.title,
          style: Theme.of(context).textTheme.title,
        ),
        subtitle: Text(
          DateFormat.yMMMd().format(widget.transaction.date),
        ),
        trailing: MediaQuery.of(context).size.width > 460
            ? FlatButton.icon(
                label: Text('Delete'),
                icon: Icon(Icons.delete),
                onPressed: () => widget.delTransaction(widget.transaction.id),
                textColor: Theme.of(context).errorColor,
              )
            : IconButton(
                icon: Icon(Icons.delete),
                onPressed: () => widget.delTransaction(widget.transaction.id),
                color: Theme.of(context).errorColor,
              ),
      ),
    );
  }
}
