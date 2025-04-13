import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  bool _obscureText = true;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: SafeArea(
          // make the content start at the top of the page not outsize it
          child: SizedBox(
            width: MediaQuery.sizeOf(context).width,
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 16),
              child: Column(
                children: [
                  SizedBox(height: 50),
                  Image.asset(
                    'assets/logo.png',
                    width: 100,
                    height: 100,
                    fit: BoxFit.cover,
                  ),
                  SizedBox(height: 16),
                  Text(
                    'Welcome to Lafyuu',
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 7),
                  Text('Sign in to Continue', style: TextStyle(fontSize: 14)),
                  SizedBox(height: 30),
                  TextFormField(
                    decoration: InputDecoration(
                      hintText: 'Enter your Email',
                      border: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.lightBlueAccent),
                        borderRadius: BorderRadius.circular(8),
                      ),
                      prefixIcon: Icon(
                        Icons.email_outlined,
                        color: Color(0xff9098B1),
                      ),
                    ),
                  ),
                  SizedBox(height: 15),
                  TextFormField(
                    obscureText: _obscureText,
                    decoration: InputDecoration(
                      hintText: 'Enter Password',
                      border: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.lightBlueAccent),
                        borderRadius: BorderRadius.circular(8),
                      ),
                      prefixIcon: Icon(
                        Icons.lock_outline,
                        color: Color(0xff9098B1),
                      ),
                      suffixIcon: IconButton(
                        icon: Icon(
                          _obscureText
                              ? Icons.visibility_outlined
                              : Icons.visibility_off_outlined,
                          color: Color(0xff9098B1),
                        ),
                        onPressed: () {
                          setState(() {
                            _obscureText = !_obscureText;
                          });
                        },
                      ),
                    ),
                  ),
                  SizedBox(height: 16),
                  SignInButton(text: "Sign In"),
                  SizedBox(height: 30),
                  ORWordWithDivider(),
                  SizedBox(height: 16),
                  DefaultButton(
                    text: "Login with Google",
                    assets: 'assets/google_logo.png',
                  ),
                  SizedBox(height: 16),
                  DefaultButton(
                    text: "Login with Facebook",
                    assets: 'assets/facebook_logo.png',
                  ),
                  SizedBox(height: 16),

                  TextButton(
                    child: Text(
                      "Forgot password?",
                      style: TextStyle(color: Color(0xFF40BFFF)),
                    ),
                    onPressed: () {},
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text("Don't have an account?"),
                      TextButton(
                        child: Text(
                          "Register",
                          style: TextStyle(color: Color(0xFF40BFFF)),
                        ),
                        onPressed: () {},
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class SignInButton extends StatelessWidget {
  final String text;

  const SignInButton({super.key, required this.text});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.sizeOf(context).width,
      height: 48,
      child: OutlinedButton(
        style: OutlinedButton.styleFrom(
          backgroundColor: Color(0xFF40BFFF),
          side: BorderSide.none,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
        ),
        onPressed: () {},
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [Text(text, style: TextStyle(color: Colors.white))],
        ),
      ),
    );
  }
}

class DefaultButton extends StatelessWidget {
  final String text;
  final String assets;

  const DefaultButton({super.key, required this.text, required this.assets});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.sizeOf(context).width,
      height: 48,
      child: OutlinedButton(
        onPressed: () {},
        style: OutlinedButton.styleFrom(
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Image.asset(assets, width: 25, height: 25),
            Text(text),
            SizedBox()
          ],
        ),
      ),
    );
  }
}

class ORWordWithDivider extends StatelessWidget {
  const ORWordWithDivider({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.sizeOf(context).width,
      child: Row(
        children: [
          Expanded(child: Divider(thickness: 1, color: Colors.black12)),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 12),
            child: Text(
              "OR",
              style: TextStyle(
                color: Color(0xFF9098B1),
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          Expanded(child: Divider(thickness: 1, color: Colors.black12)),
        ],
      ),
    );
  }
}
