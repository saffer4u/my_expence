import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import '../models/transaction.dart';
import '../widgets/transaction_items.dart';

class TransactionList extends StatelessWidget {
  final List<Transaction> transactions;
  final Function delTransaction;
  TransactionList(this.transactions, this.delTransaction);
  @override
  Widget build(BuildContext context) {
    return transactions.isEmpty
        ? LayoutBuilder(
            builder: (ctx, Constraints) {
              return Column(
                children: <Widget>[
                  Text(
                    'No transaction added yet!',
                    style: Theme.of(context).textTheme.title,
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Container(
                    height: Constraints.maxHeight * 0.5,
                    child: Image.asset(
                      'assets/images/waiting.png',
                      fit: BoxFit.cover,
                    ),
                  ),
                ],
              );
            },
          )
        : ListView.builder(
            itemCount: transactions.length,
            itemBuilder: (ctx, index) {
              return TransactionItems(transaction: transactions[index], delTransaction: delTransaction);
            },
          );
  }
}


