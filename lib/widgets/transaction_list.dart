import 'package:flutter/material.dart';
// import 'package:intl/intl.dart'; for DateTime
import '../models/transaction.dart';
import './transaction_item.dart';

class TransactionList extends StatelessWidget {
  final List<Transaction> transactions;
  // ignore: prefer_typing_uninitialized_variables
  final deleteTx; //idk how to fix this problem

  const TransactionList(this.transactions, this.deleteTx, {super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      // height: 475, it was the previously height of the transaction list before we dynamically calculated with using layoutbuilder()
      child: transactions.isEmpty
          ? LayoutBuilder(builder: (ctx, constraints) {
              return Column(children: [
                const Text(
                  'No transactions added yet!',
                  style: TextStyle(fontWeight: FontWeight.w600),
                ),
                SizedBox(
                    height: constraints.maxHeight * 0.8,
                    child: Image.asset('assets/images/waiting.png',
                        fit: BoxFit.cover)),
              ]);
            })
          : ListView.builder(
              itemBuilder: (ctx, index) {
                return TransactionItem(
                    transactions: transactions[index],
                    deleteTx: deleteTx); //extracted widget
              },
              itemCount: transactions.length,
            ),
    );
  }
}
