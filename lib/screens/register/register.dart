import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/cupertino.dart';
import 'package:twitter/screens/home/home.dart';
import '../../services/auth.dart';

class Register extends StatefulWidget {
  const Register({Key? key}) : super(key: key);

  @override
  _RegisterState createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _nameController = TextEditingController();
  final AuthService _authService = AuthService();

  bool _passwordVisible = false;
  @override
  Widget build(BuildContext context) {
    return (Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back_outlined,
            size: 20,
          ),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
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
        child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Flexible(
                flex: 2,
                child: Padding(
                  padding: EdgeInsets.fromLTRB(24.0, 0, 0, 0),
                  child: Text(
                    'Create your account',
                    style: TextStyle(
                        color: Colors.white70,
                        fontSize: 25,
                        fontWeight: FontWeight.bold),
                  ),
                ),
              ),
              Flexible(
                flex: 4,
                child: Form(
                  child: Column(
                    children: [
                      Padding(
                        padding:
                            const EdgeInsets.fromLTRB(16.0, 8.0, 16.0, 8.0),
                        child: TextFormField(
                          style: const TextStyle(color: Colors.white70),
                          controller: _nameController,
                          maxLength: 50,
                          maxLengthEnforcement: MaxLengthEnforcement.enforced,
                          decoration: const InputDecoration(
                              counterStyle: TextStyle(color: Colors.white60),
                              enabledBorder: UnderlineInputBorder(
                                  borderSide:
                                      BorderSide(color: Colors.white60)),
                              hintStyle: TextStyle(color: Colors.white60),
                              hintText: "Name"),
                        ),
                      ),
                      Padding(
                        padding:
                            const EdgeInsets.fromLTRB(16.0, 8.0, 16.0, 8.0),
                        child: TextFormField(
                          style: const TextStyle(color: Colors.white60),
                          controller: _emailController,
                          decoration: const InputDecoration(
                              enabledBorder: UnderlineInputBorder(
                                  borderSide:
                                      BorderSide(color: Colors.white60)),
                              hintStyle: TextStyle(color: Colors.white60),
                              hintText: "Phone number or email adress"),
                        ),
                      ),
                      Padding(
                        padding:
                            const EdgeInsets.fromLTRB(16.0, 8.0, 16.0, 8.0),
                        child: TextFormField(
                          obscureText: _passwordVisible ? false : true,
                          style: const TextStyle(color: Colors.white60),
                          controller: _passwordController,
                          decoration: InputDecoration(
                              suffix: IconButton(
                                icon: Icon(
                                  _passwordVisible
                                      ? Icons.visibility_off
                                      : Icons.visibility,
                                  color: Colors.white60,
                                ),
                                onPressed: () {
                                  setState(() {
                                    _passwordVisible = !_passwordVisible;
                                  });
                                },
                              ),
                              enabledBorder: UnderlineInputBorder(
                                  borderSide:
                                      BorderSide(color: Colors.white60)),
                              hintStyle: TextStyle(color: Colors.white60),
                              hintText: "Password"),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ]),
      ),
      bottomNavigationBar: BottomAppBar(
        color: Colors.black87,
        elevation: 0,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
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
                    try {
                      dynamic user = await _authService.registerEmail(
                          _emailController.text,
                          _passwordController.text,
                          _nameController.text);
                      if (user == null) {
                      } else {
                        Navigator.push(
                            context,
                            CupertinoPageRoute(
                                builder: (context) =>
                                    const MyHomePage(title: 'twitter')));
                      }
                    } catch (e) {
                      print(e);
                    }
                  },
                  child: const Text('Next')),
            )
          ],
        ),
      ),
    ));
  }
}
