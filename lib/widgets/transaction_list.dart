
import 'package:expenses_app/model/transaction.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class TransactionList extends StatelessWidget {
final List<Transaction> transactions;
final Function deletetx;
TransactionList(this.transactions,this.deletetx);

  @override
  Widget build(BuildContext context) {
    return   transactions.isEmpty
        ? LayoutBuilder(builder:(context,constraints) {
          return Column(
            children: [
              Text('No transaction added yet'
                , style: Theme.of(context).textTheme.title,
              ),
              SizedBox(height: 20,),
              Container(
                height: constraints.maxHeight *0.6,
                child: Image.asset('assets/images/waiting.png',
                  fit: BoxFit.cover,),
              ),
            ],
          );

    })
          : ListView.builder(
        itemBuilder: (context , int index){
         return Card(
           elevation: 6,
           margin: EdgeInsets.symmetric(vertical: 8,horizontal: 5,),
           child: ListTile(
             leading: CircleAvatar(
               radius: 30,
               child: Padding(
                 padding: const EdgeInsets.all(6.0),
                 child: FittedBox(
                   child: Text(
                     '\$${transactions[index].amount}'
                   ),
                 ),
               ),
             ),
             title: Text(
               transactions[index].title,
               style: Theme.of(context).textTheme.title,
             ),
             subtitle: Text(
             DateFormat.yMMMd().format(transactions[index].date) ,
             ),
           trailing:  MediaQuery.of(context).size.width > 360 ?
               TextButton.icon(onPressed: ()=>deletetx(transactions[index].id),
                   icon: Icon(Icons.delete,color:Theme.of(context).errorColor ,),
                   label: Text('delete',style: TextStyle(
                      color:Theme.of(context).errorColor ,
                   ),))
           :IconButton(icon:Icon(Icons.delete,
             color:Theme.of(context).errorColor ,) ,
             onPressed: ()=>deletetx(transactions[index].id),


           ) ,),
         );
        },
        itemCount:transactions.length ,



    );}
}
