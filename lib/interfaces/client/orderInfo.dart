 import 'package:flutter/material.dart';
import 'package:klodden/interfaces/backend/cache.dart';
import 'package:klodden/interfaces/backend/server.dart';


class OrderInfo extends StatelessWidget{ 
final String price;
final String minDeposit;
final String? material;
final String? color;
final String? style;
final String gender;
final bool view;

OrderInfo(this.price, this.minDeposit, this.material, this.color, this.style, this.gender, this.view);
 

  @override
  Widget build (BuildContext context){
    return SizedBox(  width: MediaQuery.of(context).size.width*0.9,//Container
                          child:  OrientationBuilder(
         builder: (context, orientation) { 
           return Wrap( 
             direction: Axis.horizontal,
              alignment: WrapAlignment.spaceEvenly, 
              children: 
              [
                    //|| MediaQuery.of(context).size.width <  MediaQuery.of(context).size.height ?
                    Container(  
                    //width: orientation == Orientation.portrait ? MediaQuery.of(context).size.width*0 : MediaQuery.of(context).size.width*0.6, 
                 constraints: BoxConstraints(
                    maxHeight: MediaQuery.of(context).size.height*0.8, 
                    maxWidth: orientation == Orientation.portrait ? MediaQuery.of(context).size.width*0.35  : MediaQuery.of(context).size.width*0.3,
                ),
                     //height: MediaQuery.of(context).size.height*0.7,
                 child:
                              Image.network( view == true ?'${sharedPrefs.imagepath}':'https://picsum.photos/250?image=9',
                              //placeholder:(context,url)=> Container(color: Colors.brown[200],child: Center(child: Text("I Love Yenetua",textAlign: TextAlign.center,style: TextStyle(fontSize: 34, color: Colors.brown[300],fontWeight: FontWeight.bold)))),
                             // errorWidget:(context,url,error)=>Container(color: Colors.brown[200],child: const Icon(Icons.error)),alignment: Alignment.center,
                             //220,
                            fit: BoxFit.fill, 
                            alignment: Alignment.center,  
                             )),
                Container( 
                  //width: orientation == Orientation.portrait ? MediaQuery.of(context).size.width*0.35  : MediaQuery.of(context).size.width*0.6, 
                  
                  constraints: BoxConstraints(
                    maxHeight: MediaQuery.of(context).size.height*0.8, 
                    maxWidth: orientation == Orientation.portrait ? MediaQuery.of(context).size.width*0.35  : MediaQuery.of(context).size.width*0.6, 
                  ),
                  padding: const EdgeInsets.all(8), 
                
                child:  Center(
                            child:Column(     
                          //mainAxisSize: MainAxisSize.max,
                          children: [ 
                            Text('Details'),
                            Divider(thickness: 2,color:  Colors.black), 
                            Expanded(child:  Container(
                              child:orientation == Orientation.portrait ?
                              Column(
                                
                                //runAlignment: WrapAlignment.center,
                                //spacing: 2,
                                //runSpacing: 3,
                                //crossAxisCount:  ? 1 : 2,
                                 children: [
                                 Expanded(child:  Text('Style: $style \n'),), Expanded(child:  Text('Colors: $color \n' ),), 
                                 Expanded(child:  Text('Material: $material \n'),), Expanded(child: Text('Gender: $gender \n'),),   
                                 Expanded(child:  Text('Price: $price'),), Expanded(child: Text('Minimum Deposit: $minDeposit'),),
                                  /* Row( children: [  Expanded(child:  Text('Style: \n $style \n'),), Expanded(child:  Text('Colors: \n $color \n' ),), ] ),
                                   Row( children: [  Expanded(child:  Text('Material: \n $material \n'),), Expanded(child: Text('Gender: \n \n'),), ] ), 
                                   Row( children: [  Expanded(child:  Text('Price: \n $price'),), Expanded(child: Text('Minimum Deposit: \n $minDeposit'),), ] ),
                                 */
                                ]  
                                 
                              )
                              : Column( 
                                
                                //runAlignment: WrapAlignment.center,
                                //spacing: 2,
                                //runSpacing: 3,
                                //crossAxisCount:  ? 1 : 2,
                                 children: [
                                  Row( children: [  Expanded(child:  Text('Style: $style \n'),), Expanded(child:  Text('Colors: $color \n' ),), ] ),
                                   Row( children: [  Expanded(child:  Text('Material: $material \n'),), Expanded(child: Text('Gender: $gender \n'),), ] ), 
                                   Row( children: [  Expanded(child:  Text('Price: $price'),), Expanded(child: Text('Minimum Deposit: $minDeposit'),), ] ),
                                  
                                ]  
                                 
                              )
                            )),  
                            SizedBox(),
                            orientation == Orientation.portrait ? Column(  mainAxisSize: MainAxisSize.min, 
                            children: [ 
                               TextButton.icon(onPressed:  (){
                                   //showDialog(barrierDismissible: false,context: context, builder:(context){ return AlertDialog( content: OrderInfo(), ) ;});
                                }, label: Text('Make Deposit'), icon: Icon(Icons.shopping_cart)) ,
                                //Expanded(child:  Container()),
                                 TextButton.icon(onPressed:  (){
                                   //showDialog(barrierDismissible: false,context: context, builder:(context){ return AlertDialog( content: OrderInfo(), ) ;});
                                }, label: Text('Proceed to Order'), icon: Icon(Icons.shopping_cart)) ,
                            ],) 
                            :Row( // mainAxisSize: MainAxisSize.min, 
                            children: [ 
                               TextButton.icon(onPressed:  (){
                                   //showDialog(barrierDismissible: false,context: context, builder:(context){ return AlertDialog( content: OrderInfo(), ) ;});
                                }, label: Text('Make Deposit'), icon: Icon(Icons.shopping_cart)) ,
                                Expanded(child:  Container()),
                                 TextButton.icon(onPressed:  (){
                                   //showDialog(barrierDismissible: false,context: context, builder:(context){ return AlertDialog( content: OrderInfo(), ) ;});
                                }, label: Text('Proceed to Order'), icon: Icon(Icons.shopping_cart)) ,
                            ],) ,
                            SizedBox(height : MediaQuery.of(context).size.height*0.05, ),
                            Text('Stylist Info'),
                            Divider(thickness: 2,color:  Colors.black), 
                            //Expanded(child:  Container()),  
                            /*Row(children:  List.generate(2, (index) {
                              return SingleChildScrollView(
                                scrollDirection: Axis.horizontal,
                                child: 
                               Container( width: orientation == Orientation.portrait ? MediaQuery.of(context).size.width*0.2 : MediaQuery.of(context).size.width*0.1,
                            height: orientation == Orientation.portrait ? MediaQuery.of(context).size.height*0.1 : MediaQuery.of(context).size.height*0.2,
                            child: // kIsWeb ?
                              Image.network( 'https://picsum.photos/250?image=9',
                              //placeholder:(context,url)=> Container(color: Colors.brown[200],child: Center(child: Text("I Love Yenetua",textAlign: TextAlign.center,style: TextStyle(fontSize: 34, color: Colors.brown[300],fontWeight: FontWeight.bold)))),
                             // errorWidget:(context,url,error)=>Container(color: Colors.brown[200],child: const Icon(Icons.error)),alignment: Alignment.center,
                             //220,
                            fit: BoxFit.fill, 
                            alignment: Alignment.center,  
                             )), ) ;
                            })
                            ,),   */
                            view==true?  ElevatedButton(onPressed: (){ 
            //showDialog(context: context, builder:(context){ return AlertDialog( content: Text('Submitting'), ) ;});
            connectCatalog(price,minDeposit,material,color,style,gender);
            showDialog(context: context, builder:(context){ return AlertDialog( content: Text('Submitted!'), ) ;});
            }, child: Text('Submit')):Text(' ')              
                            ]
                
                )),
                decoration: BoxDecoration( 
                   color: Colors.white,
                 ),
                ),
              ]
           );
           }));
  }
  } 