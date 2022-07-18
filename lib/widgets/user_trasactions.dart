import 'package:flutter/material.dart';
import "../widgets/transaction_list.dart";
import './new_transaction.dart';
import '../models/transaction.dart';

class UserTransaction extends StatefulWidget {
  @override
  State<UserTransaction> createState() => _UserTransactionState();
}

class _UserTransactionState extends State<UserTransaction> {
  void _addNewTransaction(String txTitle, double txAmount) {
    final newTx = Transaction(
        title: txTitle,
        amount: txAmount,
        date: DateTime.now(),
        id: DateTime.now().toString());
    setState(() {
      _userTransactions.add(newTx);
    });
  }

  List<Transaction> _userTransactions = [
    Transaction(
        amount: 850, date: DateTime.now(), id: "a1", title: "New Shoes"),
    Transaction(amount: 150, date: DateTime.now(), id: "a2", title: "Umbrella")
  ];
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        NewTransaction(_addNewTransaction),
        TransactionList(_userTransactions),
      ],
    );
  }
}
