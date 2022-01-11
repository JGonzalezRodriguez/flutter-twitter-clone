import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'widgets/tweet.dart';
import 'widgets/NavBar.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({Key? key}) : super(key: key);
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Twitter',
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
          primaryColorBrightness: Brightness.light),
      home: const MyHomePage(title: 'Twitter'),
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
  int _counter = 0;
  GlobalKey<FormState> _formkey = GlobalKey<FormState>();
  void _incrementCounter() {
    setState(() {
      // This call to setState tells the Flutter framework that something has
      // changed in this State, which causes it to rerun the build method below
      // so that the display can reflect the updated values. If we changed
      // _counter without calling setState(), then the build method would not be
      // called again, and so nothing would appear to happen.
      _counter++;
    });
  }

  Widget drawerListItem(Icon icon, Text text) {
    return ListTile(leading: icon, title: text);
  }

  @override
  Widget build(BuildContext context) {
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    return Scaffold(
      backgroundColor: Colors.white,
      drawer: Drawer(
          backgroundColor: Colors.white,
          child: ListView(
            shrinkWrap: true,
            children: [
              DrawerHeader(
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        // margin: const EdgeInsets.all(8.0),
                        child: CircleAvatar(
                          backgroundColor: Colors.grey,
                        ),
                      ),
                      Container(
                        margin: const EdgeInsets.fromLTRB(0, 8, 0, 0),
                        child: Text(
                          'Firstname Lastname',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 15,
                          ),
                        ),
                      ),
                      Container(
                        margin: const EdgeInsets.fromLTRB(0, 0, 0, 0),
                        child: Text(
                          '@username',
                          style: TextStyle(
                            color: Colors.grey,
                            fontSize: 15,
                          ),
                        ),
                      ),
                      Container(
                          margin: EdgeInsets.fromLTRB(0, 15, 0, 0),
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: [
                              Text(
                                '1,000',
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 14,
                                ),
                              ),
                              Text(
                                ' Following   ',
                                style: TextStyle(
                                  color: Colors.grey,
                                  fontSize: 12,
                                ),
                              ),
                              Text(
                                '100,000',
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 14,
                                ),
                              ),
                              Text(
                                ' Followers',
                                style: TextStyle(
                                  color: Colors.grey,
                                  fontSize: 12,
                                ),
                              ),
                            ],
                          ))
                    ]),
              ),
              Divider(
                color: Colors.grey[300],
              ),
              drawerListItem(Icon(Icons.person), Text('My Account')),
              drawerListItem(Icon(Icons.fact_check_outlined), Text('Lists')),
              drawerListItem(Icon(Icons.chat_outlined), Text('Topics')),
              drawerListItem(
                  Icon(Icons.bookmark_border_outlined), Text('Bookmarks')),
              drawerListItem(Icon(Icons.bolt_outlined), Text('Moments')),
              drawerListItem(
                  Icon(Icons.monetization_on_outlined), Text('Monetization')),
              Divider(
                color: Colors.grey[300],
              ),
              drawerListItem(Icon(Icons.work_outline_outlined),
                  Text('Twitter for Professionals'))
            ],
          )),
      appBar: AppBar(
        elevation: 1,
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: SizedBox(
          height: 30,
          child: Image.asset('img/twitter.png', fit: BoxFit.cover),
        ),
        centerTitle: true,
        iconTheme: IconThemeData(color: Colors.lightBlue),
        backgroundColor: Colors.white,
        actions: <Widget>[
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: IconButton(
              icon: Icon(
                Icons.auto_awesome_outlined,
                color: Colors.lightBlue,
                size: 30,
              ),
              onPressed: () {},
            ),
          ),
        ],
      ),
      body: getTweets(),
      floatingActionButton: FloatingActionButton(
        elevation: 1,
        onPressed: () {
          _newTweet();
        },
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
      bottomNavigationBar: NavBar(),
    );
  }

  Widget getTweets() {
    FirebaseFirestore firestore = FirebaseFirestore.instance;
    CollectionReference tweets = firestore.collection('tweets');
    return FutureBuilder<QuerySnapshot>(
        future: tweets.get(),
        builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Text("Loading");
          }
          List<Widget> _widgets = snapshot.data!.docs
              .map((doc) => Padding(
                    padding: const EdgeInsets.fromLTRB(0, 8.0, 0, 0),
                    child: Column(
                      children: [
                        tweet(doc['body'], doc['username'], doc['handle'],
                            doc['replies'], doc['shares'], doc['favs']),
                        const Divider(),
                      ],
                    ),
                  ))
              .toList();

          return ListView(
            children: _widgets,
          );
        });
  }

  void _newTweet() {
    showModalBottomSheet(
        isScrollControlled: true,
        context: context,
        builder: (BuildContext context) {
          final TextEditingController _textEditingController =
              TextEditingController();
          return Form(
            key: _formkey,
            child: Container(
                color: Colors.white,
                child: Column(
                  children: [
                    Container(
                      margin: const EdgeInsets.all(15),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          IconButton(
                              onPressed: () {
                                Navigator.pop(context);
                              },
                              icon: Icon(
                                Icons.close,
                                size: 30,
                              )),
                          TextButton(
                            style: ButtonStyle(
                              shape: MaterialStateProperty.all<
                                  RoundedRectangleBorder>(
                                RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(36.0),
                                    side: const BorderSide(
                                        color: Colors.lightBlue)),
                              ),
                              padding: MaterialStateProperty.all(
                                  const EdgeInsets.all(8.0)),
                              textStyle: MaterialStateProperty.all(
                                  const TextStyle(
                                      fontSize: 15,
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold)),
                              foregroundColor: MaterialStateProperty.all<Color>(
                                  Colors.white),
                              backgroundColor: MaterialStateProperty.all<Color>(
                                  Colors.lightBlue),
                            ),
                            child: const Text('Tweet'),
                            onPressed: () {
                              FirebaseFirestore.instance
                                  .collection('tweets')
                                  .add({
                                'username': 'prueba',
                                'handle': 'handleprueba',
                                'body': _textEditingController.text,
                                'favs': 0,
                                'shares': 0,
                                'replies': 0
                              });
                              Navigator.of(context).pop();
                            },
                          )
                        ],
                      ),
                    ),
                    Container(
                        padding: EdgeInsets.all(18.0),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            CircleAvatar(
                              backgroundColor: Colors.grey,
                            ),
                            Container(
                              height: 300,
                              width: 300,
                              child: TextFormField(
                                controller: _textEditingController,
                                maxLines: null,
                                maxLength: 280,
                                maxLengthEnforcement:
                                    MaxLengthEnforcement.enforced,
                                decoration: InputDecoration(
                                    border: InputBorder.none,
                                    hintText: "What's happening?"),
                              ),
                            ),
                          ],
                        ))
                  ],
                )),
          );
        });
  }
}
