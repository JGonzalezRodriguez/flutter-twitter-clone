import 'package:flutter/material.dart';
import 'custom_icons/my_flutter_app_icons.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

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
                color: Colors.grey[400],
              ),
              Divider(
                color: Colors.grey[400],
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
                color: Colors.grey[400],
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
            child: Icon(
              Icons.auto_awesome_outlined,
              color: Colors.lightBlue,
              size: 30,
            ),
          ),
        ],
      ),
      body: Center(
        // Center is a layout widget. It takes a single child and positions it
        // in the middle of the parent.
        child: Column(
          // Column is also a layout widget. It takes a list of children and
          // arranges them vertically. By default, it sizes itself to fit its
          // children horizontally, and tries to be as tall as its parent.
          //
          // Invoke "debug painting" (press "p" in the console, choose the
          // "Toggle Debug Paint" action from the Flutter Inspector in Android
          // Studio, or the "Toggle Debug Paint" command in Visual Studio Code)
          // to see the wireframe for each widget.
          //
          // Column has various properties to control how it sizes itself and
          // how it positions its children. Here we use mainAxisAlignment to
          // center the children vertically; the main axis here is the vertical
          // axis because Columns are vertical (the cross axis would be
          // horizontal).
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              'You have pushed the button this many times:',
            ),
            Text(
              '$_counter',
              style: Theme.of(context).textTheme.headline4,
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
      bottomNavigationBar: BottomAppBar(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            IconButton(onPressed: () {}, icon: Icon(Icons.home)),
            IconButton(onPressed: () {}, icon: Icon(Icons.search)),
            IconButton(
                onPressed: () {}, icon: Icon(Icons.bubble_chart_outlined)),
            IconButton(
                onPressed: () {}, icon: Icon(Icons.notifications_outlined)),
            IconButton(onPressed: () {}, icon: Icon(Icons.mail_outline)),
          ],
        ),
      ),
    );
  }
}