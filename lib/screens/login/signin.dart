import 'package:flutter/material.dart';
import 'package:twitter/screens/home/home.dart';
import 'package:flutter/cupertino.dart';
import 'package:twitter/screens/login/signin2.dart';

class SignIn extends StatefulWidget {
  const SignIn({Key? key}) : super(key: key);

  @override
  _signInState createState() => _signInState();
}

class _signInState extends State<SignIn> {
  final TextEditingController _emailController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return (Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(
            Icons.close_outlined,
            size: 25,
          ),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
        elevation: 0,
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: SizedBox(
          height: 30,
          child: Image.asset('img/twitter.png', fit: BoxFit.cover),
        ),
        centerTitle: true,
        iconTheme: const IconThemeData(color: Colors.lightBlue),
        backgroundColor: Colors.black87,
      ),
      body: Container(
        color: Colors.black87,
        child: Column(crossAxisAlignment: CrossAxisAlignment.center, children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Text(
              'To get started, first enter your name, email, or @username',
              style: TextStyle(
                  color: Colors.white70,
                  fontSize: 25,
                  fontWeight: FontWeight.bold),
            ),
          ),
          Form(
            child: Padding(
              padding: const EdgeInsets.fromLTRB(16.0, 8.0, 16.0, 8.0),
              child: TextFormField(
                style: const TextStyle(color: Colors.white70),
                controller: _emailController,
                decoration: const InputDecoration(
                    enabledBorder: UnderlineInputBorder(
                        borderSide: BorderSide(color: Colors.white70)),
                    hintStyle: TextStyle(color: Colors.white70),
                    hintText: "Phone, email or username"),
              ),
            ),
          ),
        ]),
      ),
      bottomNavigationBar: BottomAppBar(
        elevation: 0,
        color: Colors.black87,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            TextButton(onPressed: () {}, child: Text('Forgot password?')),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextButton(
                  style: ButtonStyle(
                    shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                      RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(36.0),
                          side: const BorderSide(color: Colors.lightBlue)),
                    ),
                    padding:
                        MaterialStateProperty.all(const EdgeInsets.all(8.0)),
                    textStyle: MaterialStateProperty.all(const TextStyle(
                        fontSize: 15,
                        color: Colors.white,
                        fontWeight: FontWeight.bold)),
                    foregroundColor:
                        MaterialStateProperty.all<Color>(Colors.white),
                    backgroundColor:
                        MaterialStateProperty.all<Color>(Colors.lightBlue),
                  ),
                  onPressed: () {
                    Navigator.push(
                        context,
                        CupertinoPageRoute(
                            builder: (context) =>
                                SignIn2(username: _emailController.text)));
                  },
                  child: Text('Next')),
            )
          ],
        ),
      ),
    ));
  }
}
