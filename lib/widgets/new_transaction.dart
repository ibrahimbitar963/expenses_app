import 'package:flutter/material.dart';
class NewTransaction extends StatefulWidget {
  final Function addTransaction;

  NewTransaction(this.addTransaction);

  @override
  _NewTransactionState createState() => _NewTransactionState();
}

class _NewTransactionState extends State<NewTransaction> {
  final titleController = TextEditingController();

  final amountController = TextEditingController();

  void submitData(){
    final enteredTitle = titleController.text;
    final enteredAmount = double.parse(amountController.text);


    if(enteredTitle.isEmpty || enteredAmount<=0){
      return;
    }
      widget.addTransaction(
        enteredTitle,enteredAmount,);
    Navigator.of(context).pop();
    }

  @override
  Widget build(BuildContext context) {
    return  Card(
      elevation: 5,
      child: Container(
        padding: EdgeInsets.all(10),
        child: Column(
          children: [
            TextField(
              controller: titleController,
              decoration: InputDecoration(
                labelText: 'Title',

              ),
            onSubmitted: (_)=>submitData(),),
            TextField(
              controller: amountController,
              decoration: InputDecoration(
                labelText: 'Amount',
              ),keyboardType: TextInputType.number,
            onSubmitted: (_)=>submitData(), ),
            TextButton(
              onPressed: () {
                submitData();
              },
              child: Text(
                'Add Transaction',
                style: TextStyle(
                  color: Colors.purple,
                  fontSize: 19,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
