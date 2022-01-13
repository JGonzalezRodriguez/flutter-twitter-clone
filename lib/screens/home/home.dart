import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:twitter/screens/login/login.dart';
import 'package:twitter/screens/register/register.dart';
import 'package:twitter/services/auth.dart';
import '../../widgets/tweet.dart';
import 'package:flutter/services.dart';

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
  final AuthService _authService = AuthService();

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
    return DefaultTabController(
      length: 4,
      child: Scaffold(
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
                        const CircleAvatar(
                          backgroundColor: Colors.grey,
                        ),
                        Container(
                          margin: const EdgeInsets.fromLTRB(0, 8, 0, 0),
                          child: Text(
                            _authService.getUsername() ?? "Nombre de Usuario",
                            style: const TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 15,
                            ),
                          ),
                        ),
                        Container(
                          margin: const EdgeInsets.fromLTRB(0, 0, 0, 0),
                          child: Text(
                            _authService.getUsername()?.replaceAll(" ", "") ??
                                "@username",
                            style: const TextStyle(
                              color: Colors.grey,
                              fontSize: 15,
                            ),
                          ),
                        ),
                        Container(
                            margin: const EdgeInsets.fromLTRB(0, 15, 0, 0),
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.end,
                              children: const [
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
                drawerListItem(
                    const Icon(Icons.person), const Text('My Account')),
                drawerListItem(
                    const Icon(Icons.fact_check_outlined), const Text('Lists')),
                drawerListItem(
                    const Icon(Icons.chat_outlined), const Text('Topics')),
                drawerListItem(const Icon(Icons.bookmark_border_outlined),
                    const Text('Bookmarks')),
                drawerListItem(
                    const Icon(Icons.bolt_outlined), const Text('Moments')),
                drawerListItem(const Icon(Icons.monetization_on_outlined),
                    const Text('Monetization')),
                Divider(
                  color: Colors.grey[300],
                ),
                drawerListItem(const Icon(Icons.work_outline_outlined),
                    const Text('Twitter for Professionals'))
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
          iconTheme: const IconThemeData(color: Colors.lightBlue),
          backgroundColor: Colors.white,
          actions: <Widget>[
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: IconButton(
                icon: const Icon(
                  Icons.auto_awesome_outlined,
                  color: Colors.lightBlue,
                  size: 30,
                ),
                onPressed: () {},
              ),
            ),
          ],
        ),
        body: TabBarView(children: [
          RefreshIndicator(
              onRefresh: () async {
                setState(() {});
              },
              child: getTweets()),
          Center(
            child: TextButton(
                style: ButtonStyle(
                  shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                    RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(36.0),
                        side: const BorderSide(color: Colors.lightBlue)),
                  ),
                  padding: MaterialStateProperty.all(const EdgeInsets.all(8.0)),
                  textStyle: MaterialStateProperty.all(const TextStyle(
                      fontSize: 15,
                      color: Colors.white,
                      fontWeight: FontWeight.bold)),
                  foregroundColor:
                      MaterialStateProperty.all<Color>(Colors.white),
                  backgroundColor:
                      MaterialStateProperty.all<Color>(Colors.grey),
                ),
                onPressed: () {
                  _authService.Logout();
                  Navigator.pushAndRemoveUntil(
                    context,
                    MaterialPageRoute(
                      builder: (BuildContext context) => const Login(),
                    ),
                    (route) => false,
                  );
                },
                child: const SizedBox(
                  width: 300,
                  height: 25,
                  child: Center(child: Text('Logout')),
                )),
          ),
          Container(),
          Container(),
        ]),
        floatingActionButton: FloatingActionButton(
          elevation: 1,
          onPressed: () {
            _newTweet();
          },
          tooltip: 'Increment',
          child: const Icon(Icons.add),
        ), // This trailing comma makes auto-formatting nicer for build methods.
        bottomNavigationBar: const BottomAppBar(
          child: TabBar(
            indicatorColor: Colors.transparent,
            labelColor: Colors.lightBlue,
            unselectedLabelColor: Colors.grey,
            tabs: [
              Tab(
                  icon: Icon(
                Icons.home,
                // color: Colors.grey,
              )),
              Tab(
                  icon: Icon(
                Icons.search,
                // color: Colors.grey,
              )),
              Tab(
                  icon: Icon(
                Icons.notifications_outlined,
                // color: Colors.grey,
              )),
              Tab(
                  icon: Icon(
                Icons.mail_outline,
                // color: Colors.grey,
              )),
            ],
          ),
        ),
      ),
    );
  }

  Widget getTweets() {
    FirebaseFirestore firestore = FirebaseFirestore.instance;
    CollectionReference tweets = firestore.collection('tweets');
    return FutureBuilder<QuerySnapshot>(
        future: tweets.orderBy('createdOn', descending: true).get(),
        builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Container();
          }
          List<Widget> _widgets = snapshot.data!.docs.map((doc) {
            DateTime createdOn =
                DateTime.parse(doc['createdOn'].toDate().toString());
            Duration deltaT = DateTime.now().difference(createdOn);
            return Padding(
              padding: const EdgeInsets.fromLTRB(0, 8.0, 0, 0),
              child: Column(
                children: [
                  tweet(doc['body'], doc['username'], doc['handle'],
                      doc['replies'], doc['shares'], doc['favs'], deltaT),
                  const Divider(),
                ],
              ),
            );
          }).toList();

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
                              icon: const Icon(
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
                            onPressed: () async {
                              if (_textEditingController.text.isEmpty) {
                              } else {
                                Navigator.of(context).pop();
                                await FirebaseFirestore.instance
                                    .collection('tweets')
                                    .add({
                                  'username': _authService.getUsername(),
                                  'handle': _authService.getUsername(),
                                  'body': _textEditingController.text,
                                  'favs': 0,
                                  'shares': 0,
                                  'replies': 0,
                                  'createdOn': FieldValue.serverTimestamp()
                                });
                                setState(() {});
                              }
                            },
                          )
                        ],
                      ),
                    ),
                    Container(
                        padding: const EdgeInsets.all(18.0),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            const CircleAvatar(
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
                                decoration: const InputDecoration(
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
