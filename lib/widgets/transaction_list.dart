import 'package:flutter/material.dart';
import '../models/transaction.dart';
import 'package:intl/intl.dart';

class TransactionList extends StatelessWidget {
  final List<Transaction> transactionList;
  final Function(String) deleteTx;
  TransactionList(this.transactionList, this.deleteTx);
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 560,
      child: transactionList.isEmpty
          ? Column(
              children: [
                const SizedBox(
                  height: 15,
                ),
                Text("No transaction added!"),
                const SizedBox(
                  height: 20,
                ),
                SizedBox(
                  height: 200,
                  child: Image.asset(
                    "assets/images/waiting.png",
                    fit: BoxFit.cover,
                  ),
                )
              ],
            )
          : ListView.builder(
              itemBuilder: (ctx, index) {
                return Card(
                  elevation: 4,
                  margin:
                      const EdgeInsets.symmetric(vertical: 10, horizontal: 6),
                  child: ListTile(
                    leading: CircleAvatar(
                      radius: 30,
                      child: Padding(
                        padding: const EdgeInsets.all(6),
                        child: FittedBox(
                          child: Text("${transactionList[index].amount}"),
                        ),
                      ),
                    ),
                    title: Text(
                      transactionList[index].title,
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 12,
                      ),
                    ),
                    subtitle: Text(
                      DateFormat.yMMMd().format(transactionList[index].date),
                    ),
                    trailing: IconButton(
                      icon: const Icon(Icons.delete),
                      color: Colors.red,
                      onPressed: () => deleteTx(transactionList[index].id),
                    ),
                  ),
                );
                // return Card(
                //   elevation: 5,
                //   child: Container(
                //     decoration: BoxDecoration(
                //         borderRadius: BorderRadius.all(Radius.circular(10)),
                //         color: Colors.cyan),
                //     child: Row(
                //       children: [
                //         Container(
                //           child: Text(
                //             "₹${transactionList[index].amount.toStringAsFixed(2)}",
                //             style: TextStyle(
                //               color: Colors.purple,
                //               fontSize: 20,
                //               fontWeight: FontWeight.w700,
                //             ),
                //           ),
                //           decoration: BoxDecoration(
                //               borderRadius:
                //                   BorderRadius.all(Radius.circular(10)),
                //               border:
                //                   Border.all(width: 2, color: Colors.purple),
                //               color: Colors.lightBlueAccent),
                //           margin: EdgeInsets.symmetric(
                //               vertical: 15, horizontal: 15),
                //           padding: EdgeInsets.all(10),
                //         ),
                //         Column(
                //           crossAxisAlignment: CrossAxisAlignment.start,
                //           children: [
                //             Text(
                //               transactionList[index].title,
                //               style: TextStyle(
                //                 fontSize: 15,
                //                 fontWeight: FontWeight.bold,
                //                 color: Colors.deepPurple,
                //               ),
                //             ),
                //             Text(
                //               DateFormat.yMMMd()
                //                   .format(transactionList[index].date),
                //               style: TextStyle(
                //                 color: Colors.white54,
                //               ),
                //             )
                //           ],
                //         ),
                //       ],
                //     ),
                //   ),
                // );
              },
              itemCount: transactionList.length,
            ),
    );
  }
}
