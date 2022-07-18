import 'package:flutter/material.dart';
import './transaction.dart';
import 'package:intl/intl.dart';
void main() => runApp(MyApp());
class MyApp extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Expense Manager",
      home: MyHomePage(),
    );
  }
}
class MyHomePage extends StatelessWidget{
  List<Transaction> transactions = [
    Transaction(amount: 850, date: DateTime.now(), id: "a1", title: "New Shoes"),
    Transaction(amount: 150, date: DateTime.now(), id: "a2", title: "Umbrella")
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Expense Manager"),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Container(
            width: double.infinity,
            child: Card(
              color: Colors.white60,
              child: Text("Card no.1"),
              elevation: 5,
            ),
          ),
          Column(
            children: transactions.map((tx){
              return Card(
                child: Container(
                  decoration: BoxDecoration(borderRadius: BorderRadius.all(Radius.circular(10)) , color: Colors.cyan),
                  child: Row(
                    children: [
                      Container(
                        child: Text(
                            "₹${tx.amount}",
                            style: TextStyle(
                              color: Colors.purple,
                              fontSize: 20,
                              fontWeight: FontWeight.w700,
                            ),
                        ),
                        decoration: BoxDecoration(borderRadius: BorderRadius.all(Radius.circular(10)) , border: Border.all(width: 2 , color: Colors.purple) , color: Colors.lightBlueAccent),
                        margin: EdgeInsets.symmetric(vertical: 15 , horizontal: 15),
                        padding: EdgeInsets.all(10),
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            tx.title,
                            style: TextStyle(
                              fontSize: 15,
                              fontWeight: FontWeight.bold,
                              color: Colors.deepPurple,
                            ),
                          ),
                          Text(DateFormat.yMMMd().format(tx.date),
                            style: TextStyle(
                              color: Colors.white54,
                            ),
                          )
                        ],
                      ),
                    ],
                  ),
                ),
              );
            }).toList(),
          ),
        ],
      ),
    );
  }
}