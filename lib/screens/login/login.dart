import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:twitter/screens/login/signin2.dart';
import 'signin.dart';
import '../register/register.dart';

class Login extends StatefulWidget {
  const Login({Key? key}) : super(key: key);

  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        title: SizedBox(
          height: 20,
          child: Image.asset('img/twitter.png', fit: BoxFit.cover),
        ),
        centerTitle: true,
        iconTheme: const IconThemeData(color: Colors.lightBlue),
        backgroundColor: Colors.black87,
      ),
      body: Container(
        color: Colors.black87,
        child: SizedBox(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const Flexible(
                  flex: 6,
                  child: Center(
                    child: Padding(
                      padding: EdgeInsets.all(40.0),
                      child: Text(
                        "See what's happening in the world right now.",
                        style: TextStyle(
                            color: Colors.white70,
                            fontSize: 25,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                  )),
              Flexible(
                flex: 0,
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(30.0, 0, 30, 0),
                  child: Column(
                    children: [
                      TextButton(
                          style: ButtonStyle(
                            shape: MaterialStateProperty.all<
                                RoundedRectangleBorder>(
                              RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(36.0),
                                  side: const BorderSide(color: Colors.grey)),
                            ),
                            padding: MaterialStateProperty.all(
                                const EdgeInsets.all(8.0)),
                            textStyle: MaterialStateProperty.all(
                                const TextStyle(
                                    fontSize: 15,
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold)),
                            foregroundColor:
                                MaterialStateProperty.all<Color>(Colors.white),
                            backgroundColor:
                                MaterialStateProperty.all<Color>(Colors.grey),
                          ),
                          onPressed: () {
                            Navigator.push(
                                context,
                                CupertinoPageRoute(
                                    builder: (context) => const Register()));
                          },
                          child: const SizedBox(
                            width: 300,
                            height: 25,
                            child: Center(child: Text('Login with Google')),
                          )),
                      const Divider(
                        color: Colors.white60,
                      ),
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
                            foregroundColor:
                                MaterialStateProperty.all<Color>(Colors.white),
                            backgroundColor: MaterialStateProperty.all<Color>(
                                Colors.lightBlue),
                          ),
                          onPressed: () {
                            Navigator.push(
                                context,
                                CupertinoPageRoute(
                                    builder: (context) => const Register()));
                          },
                          child: const SizedBox(
                            width: 300,
                            height: 25,
                            child: Center(child: Text('Create Account')),
                          )),
                      Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            const Text(
                              'By signing up, you agree to our',
                              style:
                                  TextStyle(color: Colors.white60, fontSize: 8),
                            ),
                            TextButton(
                                onPressed: () {},
                                child: const Text(
                                  'Terms, Privacy Policy',
                                  style: const TextStyle(
                                      color: Colors.lightBlue, fontSize: 8),
                                )),
                            const Text(
                              'and',
                              style:
                                  TextStyle(color: Colors.white60, fontSize: 8),
                            ),
                            TextButton(
                                onPressed: () {},
                                child: const Text(
                                  'Cookie Use.',
                                  style: const TextStyle(
                                      color: Colors.lightBlue, fontSize: 8),
                                )),
                          ]),
                      Row(children: [
                        const Text(
                          "Have an account already? ",
                          style: TextStyle(color: Colors.white60, fontSize: 15),
                        ),
                        TextButton(
                            onPressed: () {
                              Navigator.push(
                                  context,
                                  CupertinoPageRoute(
                                      builder: (context) => const SignIn()));
                            },
                            child: const Text(
                              'Log in',
                              style: const TextStyle(
                                  color: Colors.lightBlue, fontSize: 15),
                            )),
                      ])
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
