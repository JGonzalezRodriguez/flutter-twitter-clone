import 'package:flutter/material.dart';
import 'package:twitter/screens/home/home.dart';
import 'package:flutter/cupertino.dart';
import '../../services/auth.dart';

class SignIn2 extends StatefulWidget {
  const SignIn2({Key? key, required this.username}) : super(key: key);

  final String username;
  @override
  _signInState createState() => _signInState();
}

class _signInState extends State<SignIn2> {
  final AuthService _authService = AuthService();
  bool _passwordVisible = false;

  @override
  Widget build(BuildContext context) {
    return (Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(
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
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          const Padding(
            padding: EdgeInsets.all(16.0),
            child: Text(
              'Enter your password',
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
                obscureText: _passwordVisible ? false : true,
                decoration: InputDecoration(
                    suffix: IconButton(
                      icon: Icon(
                        _passwordVisible
                            ? Icons.visibility_off
                            : Icons.visibility,
                        color: Colors.white70,
                      ),
                      onPressed: () {
                        setState(() {
                          _passwordVisible = !_passwordVisible;
                        });
                      },
                    ),
                    enabledBorder: const UnderlineInputBorder(
                        borderSide: BorderSide(color: Colors.white70)),
                    hintStyle: const TextStyle(color: Colors.white70),
                    hintText: "Password"),
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
            TextButton(onPressed: () {}, child: const Text('Forgot password?')),
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
                  onPressed: () async {
                    dynamic result =
                        _authService.loginEmail(widget.username, 'password');
                    if (result != null) {
                      Navigator.push(
                          context,
                          CupertinoPageRoute(
                              builder: (context) =>
                                  const MyHomePage(title: 'twitter')));
                    } else {
                      print('no se pudo loggear');
                    }
                  },
                  child: const Text('Log In')),
            )
          ],
        ),
      ),
    ));
  }
}
