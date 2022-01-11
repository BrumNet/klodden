 import 'package:flutter/material.dart';
 
import 'package:image_picker/image_picker.dart';
import 'package:klodden/interfaces/backend/cache.dart';

import 'orderInfo.dart';

class Designs extends StatefulWidget{
  //const TPC({Key key}) : super(key: key);
@override
  State<Designs> createState() => DesignsState( );
}

class DesignsState extends State<Designs> { 
  var page = 'Designs';
  @override
  Widget build (BuildContext context){
    return Container( width: MediaQuery.of(context).size.width,
                          child: Column(     
                          mainAxisSize: MainAxisSize.max,
                          
                          children: [ 
                            SizedBox(height:  6.0,),
        Divider(),
        SizedBox(height:  6.0,), 
       Center(  child: Row( mainAxisSize: MainAxisSize.min,children: [
         ElevatedButton(onPressed: (){setState((){ page = 'Upload';});}, child: Text('Upload Design'),),
         SizedBox(width: 6.0,),
         ElevatedButton(onPressed: (){setState((){ page = 'Catalog';});}, child: Text('Catalog'),), 
         SizedBox(width: 6.0,),
         ElevatedButton(onPressed: (){setState((){ page = 'Designs';});}, child: Text('My Designs'),), 
        ],)  ),
        SizedBox(height:  6.0,),
        Divider(),
        SizedBox(height: 16.0,),
        Expanded( child:   page == 'Upload' ? Upload() : page == 'Catalog' ? Catalog() : MyDesign(), 
        
         )
                         
                          ]
                          ));

  }
  } 


class MyDesign  extends StatelessWidget{
  @override
  Widget build (BuildContext context){
    return
  SingleChildScrollView(
         child:  OrientationBuilder(
         builder:   (context, orientation) {
           return Container(
             width: MediaQuery.of(context).size.width*0.89,
           child:Wrap( 
             alignment: WrapAlignment.center,
             spacing: 2,
             runSpacing: 3,
          children: List.generate(15, (index) {   
            var wi = orientation == Orientation.portrait ? MediaQuery.of(context).size.width/3 : MediaQuery.of(context).size.width/7  ;  
           var hi =  MediaQuery.of(context).size.height/1.5; 
    return Container( 
       width: wi,
       height: hi,
      padding: const EdgeInsets.all(8),
      child: Column(     
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            Expanded(child:  Container(  
                              width: wi,
                               child: // kIsWeb ?
                              Image.network(
                               'https://picsum.photos/250?image=9',
                              //placeholder:(context,url)=> Container(color: Colors.brown[200],child: Center(child: Text("I Love Yenetua",textAlign: TextAlign.center,style: TextStyle(fontSize: 34, color: Colors.brown[300],fontWeight: FontWeight.bold)))),
                             // errorWidget:(context,url,error)=>Container(color: Colors.brown[200],child: const Icon(Icons.error)),alignment: Alignment.center,
                             //220,
                            fit: BoxFit.fill, 
                            alignment: Alignment.center, 
                            
                             )  
                            )
                            ), 
                            Divider(thickness: 2,color:  Colors.white),
                            Row(
                              mainAxisSize: MainAxisSize.max,
                              children: [
                                Align(alignment: Alignment.bottomLeft, child: IconButton(onPressed:  (){}, icon: Icon(Icons.favorite, color: Colors.red ))),
                                Expanded( child: SizedBox( ),),
                                Align(alignment: Alignment.bottomRight, child: TextButton.icon(onPressed:  (){
                                   }, label: Text('Order'), icon: Icon(Icons.shopping_cart))),
                              ]
                            )
                            ]
                    ),
      color: Colors.teal[100],
    ); 
    }
        )

       ),
         ); 
         }));
         }
         }
       

 class Upload extends StatefulWidget{
   
@override
  State<Upload> createState() => UploadState( );
}

class UploadState extends State<Upload> { 
 final price = TextEditingController(); 
 final minDeposit = TextEditingController(); 
 final material = TextEditingController(); 
 final color = TextEditingController(); 
 final style = TextEditingController();  
 bool view = false;
 bool gender1 = false;
 String? gender;
 bool gender2 = false;
 bool gender3 = false;
 String process = "unclicked";
  @override
  Widget build (BuildContext context){
    
    return Container(
      padding: EdgeInsets.symmetric(horizontal:18), 
      child: Column(
        children: [
          Row( mainAxisSize: MainAxisSize.min,children: [
            ElevatedButton(onPressed: (){ _getFromGallery(); }, child: Text('Upload Image')),
            SizedBox(width: 6.0,),
            process=="unclicked" ?Icon(Icons.cancel ):process=="clicked"?CircularProgressIndicator(): Icon(Icons.done ) ,
            IconButton(icon: Icon(gender1==false?Icons.check_box_outline_blank:Icons.check_box_outlined), onPressed:() { gender = 'Unisex'; setState((){gender1 = !gender1;gender2 = false;gender3 = false;});}),
            Text('Unisex'), 
            IconButton(icon: Icon(gender2==false?Icons.check_box_outline_blank:Icons.check_box_outlined), onPressed:() { gender = 'Female'; setState((){gender1 = false;gender2 = !gender2;gender3 = false;});}),
            Text('Female'), 
            IconButton(icon: Icon(gender3==false?Icons.check_box_outline_blank:Icons.check_box_outlined), onPressed:() { gender = 'Male'; setState((){gender1 = false;gender2 = false;gender3 = !gender3;});}),
            Text('Male'),
          ]
          ),
          SizedBox(height: 16.0,),
          TextField(
            controller: price,
            decoration: InputDecoration(
                   label: Text('Price'),
                   border:  OutlineInputBorder(borderSide: BorderSide(),
                   //borderRadius: BorderRadius.all(Radius.circular(4.0)), 
                   ),
                   //
                  ),
          ),
          SizedBox(height: 16.0,),
          TextField(
            controller: minDeposit,
            decoration: InputDecoration(
                   label: Text('Minimum Deposit'),
                   border:  OutlineInputBorder(borderSide: BorderSide(),
                   //borderRadius: BorderRadius.all(Radius.circular(4.0)), 
                   ),
                   //
                  ),
          ), 
          SizedBox(height: 16.0,),
          TextField(
            controller: color,
            decoration: InputDecoration(
                   label: Text('Color'),
                   border:  OutlineInputBorder(borderSide: BorderSide(),
                   borderRadius: BorderRadius.all(Radius.circular(4.0)), 
                   ),
                   //
                  ),
          ),
          SizedBox(height: 16.0,),
          TextField(
            controller: style,
            decoration: InputDecoration(
                   label: Text('Style'),
                   border:  OutlineInputBorder(borderSide: BorderSide(),
                   borderRadius: BorderRadius.all(Radius.circular(4.0)), 
                   ),
                   //
                  ),),  
                  SizedBox(height: 16.0,),
          TextField(
            controller: material,
            decoration: InputDecoration(
                   label: Text('Material'),
                   border:  OutlineInputBorder(borderSide: BorderSide(),
                   borderRadius: BorderRadius.all(Radius.circular(4.0)), 
                   ),
                   //
                  ),
          ),
         SizedBox(height: 16.0,),
         ElevatedButton(onPressed: (){ 
           showDialog(//barrierDismissible: false,
                                   context: context, builder:(context){ return AlertDialog( content: price.text == '' ||  minDeposit.text == '' || sharedPrefs.imagepath == null || gender == null ? 
                                   Text(sharedPrefs.imagepath == null ?'Image not Selected':gender == null ?'Kindly Select A Gender':'Price/Minimum Deposit Not Entered' ):  
                                   OrderInfo(price.text,minDeposit.text,material.text,color.text,style.text,gender!,view), 
                                   ) ;});
         }, child: Text('Preview')),

      ],) 
    );
   
         }
          _getFromGallery() async {
            
    sharedPrefs.imagepath = '';
     XFile? pickedFile = await ImagePicker().pickImage(
      source: ImageSource.gallery,
      maxWidth: 1800,
      maxHeight: 1800,
      imageQuality: 25,
    );
    //if(kIsWeb){
      sharedPrefs.imagepath =  pickedFile?.path;
      view=true ;
      setState(()=> process = "selected" );
    //else{ _cropImage(pickedFile.path);  }
   }

         }

 class Catalog extends StatelessWidget{
  @override
  Widget build (BuildContext context){
    return
  SingleChildScrollView(
         child:  OrientationBuilder(
         builder:   (context, orientation) {
           return Container(
             width: MediaQuery.of(context).size.width*0.89,
           child:Wrap( 
             alignment: WrapAlignment.center,
             spacing: 2,
             runSpacing: 3,
          children: List.generate(15, (index) {   
            var wi = orientation == Orientation.portrait ? MediaQuery.of(context).size.width/3 : MediaQuery.of(context).size.width/7  ;  
           var hi =  MediaQuery.of(context).size.height/1.5; 
    return Container( 
       width: wi,
       height: hi,
      padding: const EdgeInsets.all(8),
      child: Column(     
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            Expanded(child:  Container(  
                              width: wi,
                               child: // kIsWeb ?
                              Image.network(
                               'https://picsum.photos/250?image=9',
                              //placeholder:(context,url)=> Container(color: Colors.brown[200],child: Center(child: Text("I Love Yenetua",textAlign: TextAlign.center,style: TextStyle(fontSize: 34, color: Colors.brown[300],fontWeight: FontWeight.bold)))),
                             // errorWidget:(context,url,error)=>Container(color: Colors.brown[200],child: const Icon(Icons.error)),alignment: Alignment.center,
                             //220,
                            fit: BoxFit.fill, 
                            alignment: Alignment.center, 
                            
                             )  
                            )
                            ), 
                            Divider(thickness: 2,color:  Colors.white),
                            Row(
                              mainAxisSize: MainAxisSize.max,
                              children: [
                                Align(alignment: Alignment.bottomLeft, child: IconButton(onPressed:  (){}, icon: Icon(Icons.favorite, color: Colors.red ))),
                                Expanded( child: SizedBox( ),),
                                Align(alignment: Alignment.bottomRight, child: TextButton.icon(onPressed:  (){
                                   }, label: Text('Order'), icon: Icon(Icons.shopping_cart))),
                              ]
                            )
                            ]
                    ),
      color: Colors.teal[100],
    ); 
    }
        )

       ),
         ); 
         }));
         }
         }
       