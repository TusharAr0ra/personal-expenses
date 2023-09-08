import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import '../models/transaction.dart';

//Extracted Widget
class TransactionItem extends StatelessWidget {
  const TransactionItem({
    super.key,
    required this.transactions,
    required this.deleteTx,
  });

  final Transaction transactions;
  final dynamic deleteTx;

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 3,
      child: ListTile(
        leading: CircleAvatar(
          radius: 30,
          child: Padding(
            padding: const EdgeInsets.all(5.0),
            child: FittedBox(
              child: Text('₹${transactions.amount}'),
            ),
          ),
        ),
        title: Text(transactions.title,
            style: Theme.of(context).textTheme.titleLarge),
        subtitle: Text(DateFormat.yMMMd().format(transactions.date)),
        trailing: MediaQuery.of(context).size.width >
                360 //will check the width present of the list item and show this button with labell if enought width is present
            ? TextButton.icon(
                onPressed: () => deleteTx(transactions.id),
                icon: const Icon(Icons.remove_circle),
                label: const Text('Delete'),
                style: const ButtonStyle(
                  foregroundColor: MaterialStatePropertyAll(Colors.red),
                ),
              )
            : //else this button will be shown
            IconButton(
                onPressed: () => deleteTx(transactions.id),
                icon: const Icon(Icons.remove_circle),
                color: Theme.of(context).colorScheme.error,
              ),
      ),
    );
  }
}
