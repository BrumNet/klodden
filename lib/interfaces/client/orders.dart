import 'package:flutter/material.dart';

import './orders/order.dart';
import './orders/myorder.dart';

class Orders extends StatefulWidget {
  //const TPC({Key key}) : super(key: key);

  @override
  State<Orders> createState() => _OrdersState();
}

class _OrdersState extends State<Orders> {
  var page = "MyOrder";
  var varSl = false;

  @override
  Widget build(BuildContext context) {
    return Container(
        width: MediaQuery.of(context).size.width,
        child: Column(mainAxisSize: MainAxisSize.max, children: [
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.05,
          ),
          Center(
              child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              ElevatedButton(
                onPressed: () {
                  setState(() {
                    page = 'Order';
                  });
                },
                child: Text('My Orders'),
                style: ElevatedButton.styleFrom(
                    backgroundColor:
                        page == 'Order' ? Color(0XFFEAFDF7) : Colors.white,
                    foregroundColor: Colors.black),
              ),
              SizedBox(
                width: MediaQuery.of(context).size.width * 0.05,
              ),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                    backgroundColor:
                        page == 'MyOrder' ? Color(0XFFEAFDF7) : Colors.white,
                    foregroundColor: Colors.black),
                onPressed: () {
                  setState(() {
                    page = 'MyOrder';
                  });
                },
                child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: 5),
                    child: Text(' Received')),
              ),
            ],
          )),
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.05,
          ),
          Expanded(
              child: SingleChildScrollView(
            child: Container(
                child: Center(
                    child: Wrap(
                        alignment: WrapAlignment.spaceEvenly,
                        clipBehavior: Clip.hardEdge,
                        runSpacing: 4.0,
                        children: [
                  Container(
                    width: MediaQuery.of(context).size.width * 0.8,
                    margin: EdgeInsets.all(4.0),
                    decoration: BoxDecoration(
                      color: Color(0xFFDFF6EF),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.withOpacity(0.5),
                          spreadRadius: 3.0,
                          blurRadius: 3.0,
                        )
                      ],
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: page == 'Order' ? Order() : MyOrder(),
                  ),
                ]))),
          ))
        ]));
  }
}
