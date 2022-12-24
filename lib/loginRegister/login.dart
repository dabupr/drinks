import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

final TextEditingController _controllerEmail =
    TextEditingController(text: 'david2@gmail.com'); //ToDo quit the default text
final TextEditingController _controllerPassword = TextEditingController(text: '123456qQ');

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: getBody(context),
    );
  }

  bool _isObscure = true;
  Widget getBody(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        //mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Spacer(flex: 20),
          Container(
              decoration: BoxDecoration(
                borderRadius: const BorderRadius.all(Radius.circular(50)),
                color: Colors.white.withOpacity(0.8),
              ),
              child: const Padding(
                padding: EdgeInsets.all(16.0),
                child: Text("COCKTAILMATCH",
                    style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold)),
              )),
          const Spacer(flex: 30),
          TextField(
            controller: _controllerEmail,
            decoration: InputDecoration(
                filled: true,
                fillColor: Colors.black.withOpacity(0.3),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: BorderSide.none,
                ),
                prefixIcon: const Icon(Icons.mail)),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 32.0),
            child: TextField(
                autocorrect: false,
                enableSuggestions: false,
                obscureText: _isObscure,
                controller: _controllerPassword,
                decoration: InputDecoration(
                  filled: true,
                  fillColor: Colors.black.withOpacity(0.3),
                  //labelText: "Password",
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: BorderSide.none,
                  ),
                  prefixIcon: const Icon(Icons.lock),
                  suffixIcon: IconButton(
                    icon: Icon(
                      _isObscure ? Icons.visibility : Icons.visibility_off,
                    ),
                    onPressed: () {
                      setState(() {
                        _isObscure = !_isObscure;
                      });
                    },
                  ),
                )),
          ),
          GestureDetector(
            onTap: () {
              //Hem de canviar la pantalla
            },
            child: const Text(
              "I don't have an account",
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
          ),
          const Spacer(flex: 15),
          Padding(
            padding: const EdgeInsets.only(top: 32.0),
            child: SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () {
                  
                },
                style: ElevatedButton.styleFrom(
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0)),
                ),
                child: const Text("LOGIN"),
              ),
            ),
          ),
          const Spacer(flex: 30),
        ],
      ),
    );
  }
}
