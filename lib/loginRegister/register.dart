import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

final TextEditingController _controllerEmail =
    TextEditingController(/*text: 'david2@gmail.com'*/); //ToDo quit the default text
final TextEditingController _controllerPassword = TextEditingController();

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});

  @override
  State<RegisterPage> createState() => _RegisterPage();
}

class _RegisterPage extends State<RegisterPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: getBody(context),
      appBar: AppBar(
        elevation: 0,
        title: const Text("REGISTER"),
        centerTitle: true,
      ),
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
              Navigator.pop(context);
            },
            child: const Padding(
              padding:  EdgeInsets.only(top:8.0),
              child:  Text(
                "I have an account",
                style: TextStyle(fontWeight: FontWeight.bold, color: Colors.blue),
              ),
            ),
          ),
          const Spacer(flex: 15),
          Padding(
            padding: const EdgeInsets.only(top: 32.0),
            child: SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () {
                  FocusScopeNode currentFocus = FocusScope.of(
                      context); //Aquestes tres lines son de internet per amagar el keyaboard automaticament
                  if (!currentFocus.hasPrimaryFocus) {
                    currentFocus.unfocus();
                  }
                  registerAccount();
                },
                style: ElevatedButton.styleFrom(
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0)),
                ),
                child: const Text("CREATE ACCOUNT"),
              ),
            ),
          ),
          const Spacer(flex: 30),
        ],
      ),
    );
  }

  Future registerAccount() async {
    try {
      await FirebaseAuth.instance.createUserWithEmailAndPassword(
          email: _controllerEmail.text, password: _controllerPassword.text);
    } on FirebaseAuthException catch (e) {
      print(e);
      ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Invalid emial or password (maybe the email is used...)')));
      
    }
  }
}
