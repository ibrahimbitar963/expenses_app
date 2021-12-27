import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
class NewTransaction extends StatefulWidget {
  final Function addTransaction;

  NewTransaction(this.addTransaction);

  @override
  _NewTransactionState createState() => _NewTransactionState();
}

class _NewTransactionState extends State<NewTransaction> {
  final _titleController = TextEditingController();
  final _amountController = TextEditingController();
  DateTime _selectedDate;

  void _submitData(){
    if(_amountController.text.isEmpty){
      return;
    }
    final enteredTitle = _titleController.text;
    final enteredAmount = double.parse(_amountController.text);


    if(enteredTitle.isEmpty || enteredAmount<=0 ||_selectedDate==null ){
      return;
    }
      widget.addTransaction(
        enteredTitle,enteredAmount,_selectedDate);
    Navigator.of(context).pop();
    }
      void _presentDatePicker(){
          showDatePicker(context: context,
              initialDate: DateTime.now(),
              firstDate: DateTime(2021),
              lastDate: DateTime.now(),)
              .then((value) {
                if(value==null){
                  return;
                }else{
                      _selectedDate=value;
                setState(() {
                  
                });
                }
          });
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
              controller: _titleController,
              decoration: InputDecoration(
                labelText: 'Title',

              ),
            onSubmitted: (_)=>_submitData(),),
            TextField(
              controller: _amountController,
              decoration: InputDecoration(
                labelText: 'Amount',
              ),keyboardType: TextInputType.number,
            onSubmitted: (_)=>_submitData(), ),
            Container(
              height: 70,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(_selectedDate==null?'No Date Chosen':
                  'Picked Date :${DateFormat.yMMMd().format(_selectedDate)}',),
                  TextButton(onPressed:(){
                    _presentDatePicker();
                  } ,
                     child: Text('Choose Date'
                       ,style: TextStyle(
                         fontWeight: FontWeight.bold
                       ),),),
                      ],
              ),
            ),
            RaisedButton(
              color: Theme.of(context).primaryColor,
              onPressed: () {
                _submitData();
              },
              child: Text(
                'Add Transaction',
                style: TextStyle(
                  color: Theme.of(context).textTheme.button.color,
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
