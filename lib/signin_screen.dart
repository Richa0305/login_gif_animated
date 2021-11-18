import 'package:flutter/material.dart';

class SignInScreen extends StatefulWidget {
  const SignInScreen({Key? key}) : super(key: key);

  @override
  _SignInScreenState createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          decoration: const BoxDecoration(
            image: DecorationImage(
              image: AssetImage(
                "assets/gif/bg.gif",
              ),
              fit: BoxFit.cover,
            ),
          ),
          child: SingleChildScrollView(
            child: Padding(
              padding: EdgeInsets.fromLTRB(20, MediaQuery.of(context).size.height * 0.2, 20, 0),
              child: Column(
                children: <Widget>[
                  Image.asset(
                    "assets/images/logo1.png",
                    fit: BoxFit.fitWidth,
                    width: 200,
                    height: 200,
                    color: Colors.white,
                  ),
                  const Padding(
                    padding: EdgeInsets.fromLTRB(0, 0, 0, 30),
                    child: Text(
                      "Health First",
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 30,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(0, 30, 0, 20),
                    child: reusableTextField(
                        "Enter Email", Icons.person_outline, false),
                  ),
                  reusableTextField("Enter Password", Icons.lock_outline, true),
                  Container(
                    width: MediaQuery.of(context).size.width,
                    height: 35,
                    alignment: Alignment.bottomRight,
                    child: TextButton(
                      child: const Text(
                        "Forgot password?",
                        textAlign: TextAlign.right,
                        style: TextStyle(color: Colors.white70),
                      ),
                      onPressed: () {},
                    ),
                  ),
                  Container(
                    width: MediaQuery.of(context).size.width,
                    height: 50,
                    margin: const EdgeInsets.fromLTRB(0, 10, 0, 20),
                    decoration:
                        BoxDecoration(borderRadius: BorderRadius.circular(20)),
                    child: ElevatedButton(
                        onPressed: () {},
                        style: ButtonStyle(backgroundColor:
                            MaterialStateProperty.resolveWith((states) {
                          if (states.contains(MaterialState.pressed)) {
                            return Colors.black26;
                          }
                          return Colors.white70;
                        })),
                        child: const Text(
                          "LOG IN",
                          style: TextStyle(
                              color: Colors.black87,
                              fontWeight: FontWeight.bold,
                              fontSize: 16),
                        )),
                  ),
                ],
              ),
            ),
          )),
    );
  }

  TextField reusableTextField(String text, IconData icon, bool isPasswordType) {
    return TextField(
      obscureText: isPasswordType ? true : false,
      enableSuggestions: isPasswordType ? false : true,
      autocorrect: isPasswordType ? false : true,
      cursorColor: Colors.white38,
      style: TextStyle(color: Colors.white.withOpacity(0.9)),
      decoration: InputDecoration(
        prefixIcon: Icon(
          icon,
          color: Colors.white70,
        ),
        labelText: text,
        labelStyle: TextStyle(color: Colors.white.withOpacity(0.9)),
        filled: true,
        floatingLabelBehavior: FloatingLabelBehavior.never,
        fillColor: Colors.white.withOpacity(0.1),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10.0),
          borderSide: const BorderSide(
            width: 0,
            style: BorderStyle.none,
          ),
        ),
      ),
      keyboardType: isPasswordType
          ? TextInputType.visiblePassword
          : TextInputType.emailAddress,
    );
  }
}
