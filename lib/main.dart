// import 'package:flutter/foundation.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart'; 
import 'package:klodden/interfaces/client/body.dart'; 

import 'interfaces/backend/cache.dart';
import 'interfaces/backend/server.dart';
import 'interfaces/client/color.dart';
import 'interfaces/client/designs.dart';
import 'interfaces/client/orderInfo.dart';
import 'interfaces/client/orders.dart';
import 'interfaces/client/preferences.dart';
import 'interfaces/client/stylists.dart';
import 'package:firebase_core/firebase_core.dart'; 

Future<void> main() async {
  await Firebase.initializeApp();
  //await getEnv.init();
  await sharedPrefs.init(); 
  await FirebaseAuth.instance.signInAnonymously();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'KloDDen',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'KloDDen'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> { 
  var page = 'home';  
  

  @override
  Widget build(BuildContext context) {
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    sharedPrefs.dislikes = "I dont like";
    sharedPrefs.likes = "I like";
    sharedPrefs.colors = [Colors.orange, Colors.black, Colors.blue, Colors.white, Colors.red, Colors.pink, Colors.indigo];;
    sharedPrefs.body = [""];
    sharedPrefs.favid = [""];
    sharedPrefs.stylists = [""];
    
    return Scaffold(
      appBar: AppBar(
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: Text(widget.title),
        actions: [
          ElevatedButton(onPressed: (){  
          setState((){ page = 'Designs';});
           }, child: Text('Upload Design'))
          ],
      ),
      drawer: Drawer(
        
        child: ListView(
        padding: EdgeInsets.zero,
        children: [
          const DrawerHeader(
        decoration: BoxDecoration(
          color: Colors.blue,
        ),
        child: Text('Drawer Header'),
      ),
      ListTile(
        title: const Text('Home'),
        onTap: () {
          // Update the state of the app.
          // ... 
          Navigator.pop(context);
          setState((){ page = 'home';});
        },
      ),
      ListTile(
        title: const Text('Orders'),
        onTap: () {
          // Update the state of the app.
          // ... 
          Navigator.pop(context);
          setState((){ page = 'Orders';});
        },
      ),
      ListTile(
        title: const Text('Body Measurement'),
        onTap: () {
          // Update the state of the app.
          // ...
          Navigator.pop(context); 
          setState((){ page = 'Body';});
        },
      ),
      ListTile(
        title: const Text('Preferences'),
        onTap: () {
          // Update the state of the app.
          // ...
          Navigator.pop(context); 
          setState((){ page = 'Preferences';});
        },
      ),
      ListTile(
        title: const Text('My Colors'),
        onTap: () {
          // Update the state of the app.
          // ...
          Navigator.pop(context);
          setState((){ page = 'Colors';});
        },
      ),
       ListTile(
        title: const Text('My Designs'),
        onTap: () {
          // Update the state of the app.
          // ...
          Navigator.pop(context);
          setState((){ page = 'Designs';});
        },
      ),
      ListTile(
        title: const Text('My Stylists'),
        onTap: () {
          // Update the state of the app.
          // ...
          Navigator.pop(context); 
          setState((){ page = 'Stylists';});
        }, 
      ),
        ],)
      ),
      body: page == 'Designs'? Designs() :   
      page == 'Stylists'? Stylists() :  
      page == 'Colors'? ColorsPage() :  
      page == 'Preferences'? Preferences() :  
      page == 'Orders'? Orders() :  
      page == 'Body'? Body() :
      Home(), 
      floatingActionButton: FloatingActionButton(
        onPressed: (){},
        tooltip: 'Chat',
        child: const Icon(Icons.message),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}


class Home extends StatelessWidget{
  //const TPC({Key key}) : super(key: key);

  @override
  Widget build (BuildContext context){
    return  FutureBuilder<QuerySnapshot>(
        future:  FirebaseFirestore.instance.collection('uploads').get(),
        builder: (BuildContext context, AsyncSnapshot<QuerySnapshot>  snapshot){
        if(snapshot.hasError){return const Align( alignment: Alignment.center, child: Text("Something went wrong. Please Try Again Later"));}//
        if(!snapshot.hasData){return const Align( alignment: Alignment.center, child: Text("Loading"));} //
        if(snapshot.data!.docs.length == 1){return Align( alignment: Alignment.center, child: Text(//"Please Check Your Connection and Refresh!":
        "No Data Found")); } 
        switch (snapshot.connectionState){
          case ConnectionState.waiting : return const Align( alignment: Alignment.center, child:  CircularProgressIndicator());
           default:   
            return OrientationBuilder(
         builder:   (context, orientation) { 
           var wi =  orientation == Orientation.portrait ? MediaQuery.of(context).size.width/2 : MediaQuery.of(context).size.width/4; 
           var hi =  orientation == Orientation.portrait ? MediaQuery.of(context).size.height/2 : MediaQuery.of(context).size.height*3/4; 
          return GridView.count( 
            crossAxisSpacing: 3.0,
            mainAxisSpacing: 3.0,
            childAspectRatio: 0.5,
            crossAxisCount: orientation == Orientation.portrait? 2 : 5,
            children: List.generate(snapshot.data!.docs.length, (index) {   
              final document = snapshot.data!.docs[index]; 
              bool yh = sharedPrefs.favid!.contains(document['clothid'])? true :false;
    return Container( 
       width: wi,
       //height: hi,
      padding: const EdgeInsets.all(8),
      child: Column(     
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            Expanded(child:  Container(  
                              width: wi,
                              height: hi,
                               child: // kIsWeb ?
                              Image.network(
                                document['image'],
                               //'https://picsum.photos/250/400?image=8',
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
                                //onlik info assign to sign
                                Align(alignment: Alignment.bottomLeft, child: FavComponent( document['clothid'], yh )),
                                Expanded( child: SizedBox( ),),
                                Align(alignment: Alignment.bottomRight, child: TextButton.icon(onPressed:  (){
                                   showDialog(//barrierDismissible: false,
                                   context: context, builder:(context){ return AlertDialog( content: OrderInfo(document['price'],document['minDeposit'],document['material'] ,document['colour'],document['style'],document['gender'],false), ) ;});
                                }, label: Text('Order'), icon: Icon(Icons.shopping_cart))),
                              ]
                            )
                            ]
                    ),
      color: Colors.teal[100],
    ); 
    }));
    } ) ; 
       
       }
  }); 
  }
  }

  class FavComponent extends StatefulWidget {
    final String clothid;
    bool yh;
    FavComponent(this.clothid, this.yh);
     @override
  State<FavComponent> createState() => FavComponentState();

}

class FavComponentState extends State<FavComponent> {  
  
  @override
  Widget build(BuildContext context) {
    return IconButton(onPressed:(){ sharedPrefs.favid!.contains(widget.clothid) ? sharedPrefs.favid!.remove(widget.clothid) : sharedPrefs.favid!.add(widget.clothid); setState((){widget.yh = !widget.yh ;}) ;connectFav(); }, icon: Icon(Icons.favorite, color: widget.yh == true ?Colors.red:Colors.white,));
                                
  }
  }