// import 'package:flutter/foundation.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:klodden/interfaces/client/body.dart';

import 'interfaces/backend/cache.dart';
import 'interfaces/client/color.dart';
import 'interfaces/client/designs.dart';
import 'interfaces/client/home/home.dart';
import 'interfaces/client/orders.dart';
import 'interfaces/client/preferences.dart';
import 'interfaces/client/stylists.dart';
import 'package:firebase_core/firebase_core.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: FirebaseOptions(
        apiKey: "AIzaSyAAEtgD57GtA4ogbbEKSiwSPEy8YBZ9z5A",
        authDomain: "klodden.firebaseapp.com",
        projectId: "klodden",
        storageBucket: "klodden.appspot.com",
        messagingSenderId: "158135104669",
        appId: "1:158135104669:web:db847fff7c6d35f3b95074",
        measurementId: "G-SZ1F6Y20C4"),
  );
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
        // changing the backgroundColorSwatch below to Colors.green and then invoke
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

  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    sharedPrefs.dislikes = "TAP here to type";
    sharedPrefs.likes = "TAP here to type";
    sharedPrefs.colors = [
      "0xff443a49",
      "0xffffffff",
      "0xff443a00",
      "0x00000000",
      "0xffff0049",
      "0xff44ff49",
      "0xff443a00"
    ];
    sharedPrefs.body = [""];
    sharedPrefs.favid = [""];
    sharedPrefs.stylists = [""];

    return Scaffold(
      resizeToAvoidBottomInset: false,
      key: _scaffoldKey,
      appBar: AppBar(
        backgroundColor: Color(0xFFEAFDF7),
        leading: IconButton(
          icon: Icon(
            Icons.menu,
            color: Colors.black,
          ),
          onPressed: () {
            _scaffoldKey.currentState!.openDrawer();
          },
        ),
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        //To open the drawer, use the [ScaffoldState.openDrawer] function.
        //To close the drawer, use either [ScaffoldState.closeDrawer] or [Navigator.pop].
        title: Text(
          page == "home" ? "" : page,
          style: TextStyle(fontSize: 12, color: Colors.black),
        ),
        actions: [
          Row(mainAxisSize: MainAxisSize.min, children: [
            Padding(
                padding: EdgeInsets.fromLTRB(0, 0, 10, 0),
                child: ElevatedButton(
                    onPressed: () {
                      setState(() {
                        page = 'Upload';
                      });
                    },
                    style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.white,
                        foregroundColor: Colors.black),
                    child: Text(
                      'Upload',
                      style: TextStyle(fontSize: 12),
                    )))
          ])
        ],
      ),

      drawer: Drawer(
          child: ListView(
        padding: EdgeInsets.zero,
        children: [
          DrawerHeader(
            decoration: BoxDecoration(
              color: Color(0XFFBBF9E2),
            ),
            child: Padding(
                padding: EdgeInsets.fromLTRB(0, 50, 0, 0),
                child: Row(
                  children: [
                    TextButton.icon(
                        onPressed: () {},
                        icon: Icon(
                          Icons.people,
                          size: 50,
                          color: Colors.white,
                        ),
                        label: Text(
                          "Philip",
                          style: TextStyle(color: Colors.black),
                        ))
                  ],
                )),
          ),
          ListTile(
            title: Row(children: [
              TextButton.icon(
                  onPressed: () {
                    Navigator.pop(context);
                    setState(() {
                      page = 'home';
                    });
                  },
                  icon: Icon(
                    Icons.home,
                    size: 20,
                    color: Colors.grey,
                  ),
                  label: Text(
                    "Home",
                    style: TextStyle(color: Colors.black),
                  ))
            ]),
            onTap: () {
              // Update the state of the app.
              // ...
              Navigator.pop(context);
              setState(() {
                page = 'home';
              });
            },
          ),
          Divider(),
          ListTile(
            title: Row(children: [
              TextButton.icon(
                  onPressed: () {
                    Navigator.pop(context);
                    setState(() {
                      page = 'Orders';
                    });
                  },
                  icon: Icon(
                    Icons.shopping_bag,
                    size: 20,
                    color: Colors.black,
                  ),
                  label: Text(
                    "Orders",
                    style: TextStyle(color: Colors.black),
                  ))
            ]),
            onTap: () {
              // Update the state of the app.
              // ...
              Navigator.pop(context);
              setState(() {
                page = 'Orders';
              });
            },
          ),
          Divider(),
          ListTile(
            title: Row(children: [
              TextButton.icon(
                  onPressed: () {
                    Navigator.pop(context);
                    setState(() {
                      page = 'Body';
                    });
                  },
                  icon: Icon(
                    Icons.person,
                    size: 20,
                    color: Colors.brown,
                  ),
                  label: Text(
                    "Body Measurement",
                    style: TextStyle(color: Colors.black),
                  ))
            ]),
            onTap: () {
              // Update the state of the app.
              // ...
              Navigator.pop(context);
              setState(() {
                page = 'Body';
              });
            },
          ),
          Divider(),
          ListTile(
            title: Row(children: [
              TextButton.icon(
                  onPressed: () {
                    Navigator.pop(context);
                    setState(() {
                      page = 'Preferences';
                    });
                  },
                  icon: Icon(
                    Icons.thumb_up_sharp,
                    size: 20,
                    color: Colors.yellow,
                  ),
                  label: Text(
                    "Preferences",
                    style: TextStyle(color: Colors.black),
                  ))
            ]),
            onTap: () {
              // Update the state of the app.
              // ...
              Navigator.pop(context);
              setState(() {
                page = 'Preferences';
              });
            },
          ),
          Divider(),
          ListTile(
            title: Row(children: [
              TextButton.icon(
                  onPressed: () {
                    Navigator.pop(context);
                    setState(() {
                      page = 'Colors';
                    });
                  },
                  icon: Icon(
                    Icons.colorize,
                    size: 20,
                    color: Colors.pink,
                  ),
                  label: Text(
                    "Colors",
                    style: TextStyle(color: Colors.black),
                  ))
            ]),
            onTap: () {
              // Update the state of the app.
              // ...
              Navigator.pop(context);
              setState(() {
                page = 'Colors';
              });
            },
          ),
          Divider(),
          ListTile(
            title: Row(children: [
              TextButton.icon(
                  onPressed: () {
                    Navigator.pop(context);
                    setState(() {
                      page = 'Designs';
                    });
                  },
                  icon: Icon(
                    Icons.design_services,
                    size: 20,
                    color: Colors.red,
                  ),
                  label: Text(
                    "My Designs",
                    style: TextStyle(color: Colors.black),
                  ))
            ]),
            onTap: () {
              // Update the state of the app.
              // ...
              Navigator.pop(context);
              setState(() {
                page = 'Designs';
              });
            },
          ),
          Divider(),
          ListTile(
            title: Row(children: [
              TextButton.icon(
                  onPressed: () {
                    Navigator.pop(context);
                    setState(() {
                      page = 'Stylists';
                    });
                  },
                  icon: Icon(
                    Icons.cut,
                    size: 20,
                    color: Colors.orange,
                  ),
                  label: Text(
                    "My Stylists",
                    style: TextStyle(color: Colors.black),
                  ))
            ]),
            onTap: () {
              // Update the state of the app.
              // ...
              Navigator.pop(context);
              setState(() {
                page = 'Stylists';
              });
            },
          ),
          Divider(),
        ],
      )),
      body: page == 'Designs'
          ? Designs(page)
          : page == 'Stylists'
              ? Stylists()
              : page == 'Colors'
                  ? ColorsPage()
                  : page == 'Preferences'
                      ? Preferences()
                      : page == 'Orders'
                          ? Orders()
                          : page == 'Body'
                              ? Body()
                              : page == 'Upload'
                                  ? Designs(page)
                                  : Home(),
      /*floatingActionButton: FloatingActionButton(
        onPressed: (){},
        tooltip: 'Chat',
        child: const Icon(Icons.message),
      ),*/ // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
