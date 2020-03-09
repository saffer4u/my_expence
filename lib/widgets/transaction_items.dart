import 'package:flutter/material.dart';

import 'package:intl/intl.dart';
import '../models/transaction.dart';


class TransactionItems extends StatelessWidget {
  const TransactionItems({
    Key key,
    @required this.transaction,
    @required this.delTransaction,
  }) : super(key: key);

  final Transaction transaction;
  final Function delTransaction;

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5,
      margin: EdgeInsets.symmetric(horizontal: 20, vertical: 8),
      child: ListTile(
        leading: CircleAvatar(
          radius: 30,
          child: Padding(
            padding: EdgeInsets.all(6),
            child: FittedBox(
              child: Text(
                '\₹${transaction.amount.toStringAsFixed(2)}',
              ),
            ),
          ),
        ),
        title: Text(
          transaction.title,
          style: Theme.of(context).textTheme.title,
        ),
        subtitle: Text(
          DateFormat.yMMMd().format(transaction.date),
        ),
        trailing: MediaQuery.of(context).size.width > 460
            ? FlatButton.icon(
                label: Text('Delete'),
                icon: Icon(Icons.delete),
                onPressed: () =>
                    delTransaction(transaction.id),
                textColor: Theme.of(context).errorColor,
              )
            : IconButton(
                icon: Icon(Icons.delete),
                onPressed: () =>
                    delTransaction(transaction.id),
                color: Theme.of(context).errorColor,
              ),
      ),
    );
  }
}