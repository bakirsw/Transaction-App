import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import './transaction.dart';
import 'package:intl/intl.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  final List<Transaction> transactions = [
    Transaction(
        amount: 54.99, date: DateTime.now(), id: 't1', title: 'Shoes', place: 'Lacoste, Wolfsburg'),
    Transaction(
        amount: 195.07, date: DateTime.now(), id: 't2', title: 'Bicycle', place: 'KS-Bicycle'),
  ];
  String titleInput;
  String amountInput;



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.deepOrange,
        title: Center(child: Text('Transaction App')),
      ),
      body: Column(
        children: [
          Container(
            width: double.infinity,
            margin: EdgeInsets.only(top: 5, bottom: 10),
            child: Card(
              child: Text(
                'CHART!',
                style: TextStyle(fontSize: 18),
              ),
              color: Colors.deepOrange,
              elevation: 10,
            ),
          ),
          Card(
            child: Container(
              padding: EdgeInsets.all(10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: <Widget>[
                  TextField(decoration: InputDecoration(labelText: 'Title'), onChanged: (inp) {titleInput = inp;},),
                  TextField(decoration: InputDecoration(labelText: 'Amount'), onChanged: (inp) {amountInput = inp;},),
                  FlatButton(child: Text('Add transaction', style: TextStyle(color: Colors.deepOrange),),
                  onPressed: () {print(titleInput);},)
                ],
              ),
            )),
          Column(
            children: transactions.map((tx) {
              return Card(
                  elevation: 10,
                  child: Row(
                    children: [
                      Container(
                        margin: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
                        padding: EdgeInsets.all(10),
                        decoration: BoxDecoration(border: Border.all(width: 2, color: Colors.deepOrange)),
                        child: Text('\$'+tx.amount.toString(), style: TextStyle(fontSize: 14,fontWeight: FontWeight.bold, color: Colors.deepOrange),)
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Card(child: Text(tx.title, style: TextStyle(color: Colors.deepOrange),),),
                          Card(child: Text(tx.place, style: TextStyle(color: Colors.grey, fontSize: 12),)),
                          Card(child: Text(DateFormat('dd-MMM yyyy').format(tx.date), style: TextStyle(color: Colors.grey),),)
                        ],
                      )
                    ],
                  )
              );
            }).toList(),
          ),
        ],
      ),
    );
  }
}
