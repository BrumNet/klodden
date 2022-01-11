 import 'package:flutter/material.dart';

class Orders extends StatefulWidget{
  //const TPC({Key key}) : super(key: key);


  @override
  State<Orders> createState() => _OrdersState();
}

class _OrdersState extends State<Orders> { 
var page;
var varSl = false;
  @override
  Widget build (BuildContext context){
    return Container( width: MediaQuery.of(context).size.width,
                          child: Column(     
                          mainAxisSize: MainAxisSize.max, 
                          children: [ 
       SizedBox(height:MediaQuery.of(context).size.height*0.05,),                     
       Center(  child: Row( mainAxisSize: MainAxisSize.min,children: [
         ElevatedButton(onPressed: (){setState((){ page = 'Order';});}, child: Text('Orders'),
         style: ButtonStyle(  //side: L , shape:  BorderRadius.all(Radius(7.0) ),
         ),), 
         SizedBox(width:MediaQuery.of(context).size.width*0.05,),  
         ElevatedButton(onPressed: (){setState((){ page = 'MyOrder';});}, child: Text('My Orders'),), 
       ],)  ),
       
      SizedBox(height:MediaQuery.of(context).size.height*0.05,),
      Expanded( child:   SingleChildScrollView(
         child:  Container(
           child: Center(
      child: Wrap(  
            alignment: WrapAlignment.spaceEvenly,
            clipBehavior: Clip.hardEdge,
            runSpacing: 4.0,
             
            children: [
               Container(
                 width:MediaQuery.of(context).size.width*0.8,
                 margin: EdgeInsets.all(4.0), 
                decoration: BoxDecoration
                    (
                      color: Colors.indigo[100],
                      border: Border.all(
                        width:  2, 
                        color: Colors.pink,
                        ),
                      boxShadow: [
                        BoxShadow(
                            color: Colors.grey.withOpacity(0.5),
                            spreadRadius: 5.0,    
                            blurRadius: 5.0,
                      )
                      ],
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child:   page == 'Order' ? Order() :  MyOrder() ,
                   
           ),   
            ]
            )
    ) 
         ),
       ))
                          ]
                          ));
  }
  } 

class Order extends StatelessWidget{
  @override
  Widget build (BuildContext context){
    return
   Column(     
        mainAxisSize: MainAxisSize.min,
         children: [
           SizedBox(height:MediaQuery.of(context).size.height*0.05,),
            Icon(Icons.shopping_cart),
           Text("Orders"),
           Divider(thickness: 2,color:  Colors.white),
           Container(
             child: Text(" "),
             //height: MediaQuery.of(context).size.height*0.01,  
             width: MediaQuery.of(context).size.width*0.8,
             ),

             Column(children: List.generate(4, (index) { 
                return ListTile(
                  style: ListTileStyle.list,
                  selectedTileColor: Colors.white,
                  selectedColor:  Colors.teal,
                  selected:false,
        title: Text('$index, You have a new order '),
        onTap: () {
          // Update the state of the app.
          // ...  
          //setState((){varSl = true;});
         showDialog( context: context, builder:(context){ return AlertDialog( title: Icon(Icons.shopping_cart) ,content: Text('Orders $index'), ) ;});
        },
      ); 
              })     

              )
              ]
         );
         }}
           
class MyOrder extends StatelessWidget{
  @override
  Widget build (BuildContext context){
    return
   Column(     
        mainAxisSize: MainAxisSize.min,
         children: [
           SizedBox(height:MediaQuery.of(context).size.height*0.05,),
            Icon(Icons.shopping_cart),
           Text("Orders"),
           Divider(thickness: 2,color:  Colors.white),
           Container(
             child: Text(" "),
             //height: MediaQuery.of(context).size.height*0.01,  
             width: MediaQuery.of(context).size.width*0.8,
             ),

             Column(children: List.generate(4, (index) { 
                return ListTile(
                  style: ListTileStyle.list,
                  selectedTileColor: Colors.white,
                  selectedColor:  Colors.teal,
                  selected:false,
        title: Text('$index, You placed an order '),
        onTap: () {
          // Update the state of the app.
          // ...  
          //setState((){varSl = true;});
         showDialog( context: context, builder:(context){ return AlertDialog( title: Icon(Icons.shopping_cart) ,content: Text('Orders $index'), ) ;});
        },
      ); 
              })     

              )
              ]
         );
         }}
           