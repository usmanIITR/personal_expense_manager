import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class NewTransaction extends StatefulWidget {
  final Function(String, double, DateTime?) addTxFunction;
  NewTransaction(this.addTxFunction);

  @override
  State<NewTransaction> createState() => _NewTransactionState();
}

class _NewTransactionState extends State<NewTransaction> {
  final _titleController = TextEditingController();

  final _amountController = TextEditingController();

  void _submitData() {
    final enteredTitle = _titleController.text;
    final enteredAmount = double.parse(_amountController.text);
    if (enteredTitle.isEmpty ||
        enteredAmount <= 0 ||
        _selectedDate == null ||
        _amountController.text.isEmpty) {
      return;
    }
    widget.addTxFunction(enteredTitle, enteredAmount, _selectedDate);
    Navigator.of(context).pop();
  }

  DateTime? _selectedDate;
  void _giveDatePicker() {
    showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2022),
      lastDate: DateTime.now(),
    ).then((pickedDate) {
      if (pickedDate == null) {
        return;
      }
      setState(() {
        _selectedDate = pickedDate;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5,
      child: Container(
        margin: EdgeInsets.all(15),
        child: Column(
          children: [
            TextField(
              decoration: const InputDecoration(labelText: "Title"),
              controller: _titleController,
            ),
            TextField(
              decoration: const InputDecoration(labelText: "Amount"),
              controller: _amountController,
              keyboardType: TextInputType.number,
              onSubmitted: (_) => _submitData(),
            ),
            const SizedBox(
              height: 20,
            ),
            Row(
              children: [
                Expanded(
                  child: Text(
                    _selectedDate == null
                        ? "No date choosen! "
                        : "Picked Date : ${DateFormat.yMMMd().format(_selectedDate!)}",
                    style: const TextStyle(color: Colors.grey),
                  ),
                ),
                TextButton(
                  onPressed: _giveDatePicker,
                  child: const Text(
                    "Choose Date",
                    style: TextStyle(
                        fontWeight: FontWeight.bold, color: Colors.purple),
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 20,
            ),
            Container(
              alignment: Alignment.centerRight,
              child: ElevatedButton(
                onPressed: () => _submitData(),
                style: ElevatedButton.styleFrom(
                  primary: Colors.purple,
                  textStyle: const TextStyle(fontSize: 17),
                ),
                child: const Text(
                  "Add Transaction",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
