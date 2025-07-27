import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import '../../firebase_options.dart'; // Firebase CLI로 생성된 옵션 파일

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Firebase Auth (No Email Verification)',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: AuthWidget(),
    );
  }
}

class AuthWidget extends StatefulWidget {
  const AuthWidget({super.key});

  @override
  State<AuthWidget> createState() => AuthWidgetState();
}

class AuthWidgetState extends State<AuthWidget> {
  final _formKey = GlobalKey<FormState>();
  late String email;
  late String password;
  bool isInput = true;
  bool isSignIn = true;

  void showMessage(BuildContext context, String msg) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text(msg), duration: Duration(seconds: 2)),
    );
  }

  Future<void> signIn() async {
    try {
      final userCredential = await FirebaseAuth.instance
          .signInWithEmailAndPassword(email: email, password: password);

      setState(() => isInput = false);
    } on FirebaseAuthException catch (e) {
      showMessage(context, '❌ ${e.message ?? '로그인 실패'}');
    }
  }

  Future<void> signUp() async {
    try {
      final userCredential = await FirebaseAuth.instance
          .createUserWithEmailAndPassword(email: email, password: password);

      setState(() => isInput = false);
    } on FirebaseAuthException catch (e) {
      showMessage(context, '❌ ${e.message ?? '회원가입 실패'}');
    }
  }

  Future<void> signOut() async {
    await FirebaseAuth.instance.signOut();
    setState(() => isInput = true);
  }

  List<Widget> getInputWidget() {
    return [
      Padding(
        padding: const EdgeInsets.all(16.0),
        child: Text(
          isSignIn ? "Sign In" : "Sign Up",
          style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
          textAlign: TextAlign.center,
        ),
      ),
      Form(
        key: _formKey,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24),
          child: Column(
            children: [
              TextFormField(
                decoration: InputDecoration(labelText: "Email"),
                validator: (value) =>
                    value!.isEmpty ? 'Please enter email' : null,
                onSaved: (value) => email = value ?? "",
              ),
              SizedBox(height: 16),
              TextFormField(
                decoration: InputDecoration(labelText: "Password"),
                obscureText: true,
                validator: (value) =>
                    value!.isEmpty ? 'Please enter password' : null,
                onSaved: (value) => password = value ?? "",
              ),
              SizedBox(height: 24),
              ElevatedButton(
                onPressed: () {
                  if (_formKey.currentState?.validate() ?? false) {
                    _formKey.currentState?.save();
                    isSignIn ? signIn() : signUp();
                  }
                },
                child: Text(isSignIn ? "Sign In" : "Sign Up"),
              ),
              SizedBox(height: 12),
              RichText(
                text: TextSpan(
                  text: isSignIn ? "Don't have an account? " : "Already signed up? ",
                  style: Theme.of(context).textTheme.bodyLarge,
                  children: [
                    TextSpan(
                      text: isSignIn ? "Sign Up" : "Sign In",
                      style: TextStyle(
                          color: Colors.blue,
                          decoration: TextDecoration.underline,
                          fontWeight: FontWeight.bold),
                      recognizer: TapGestureRecognizer()
                        ..onTap = () {
                          setState(() {
                            isSignIn = !isSignIn;
                          });
                        },
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    ];
  }

  List<Widget> getResultWidget() {
    String resultEmail = FirebaseAuth.instance.currentUser?.email ?? '';
    return [
      Padding(
        padding: const EdgeInsets.all(24.0),
        child: Text(
          "✅ $resultEmail 로 ${isSignIn ? '로그인' : '회원가입'} 하셨습니다!",
          style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          textAlign: TextAlign.center,
        ),
      ),
      ElevatedButton(
        onPressed: () {
          if (isSignIn) {
            signOut();
          } else {
            setState(() {
              isInput = true;
              isSignIn = true;
            });
          }
        },
        child: Text(isSignIn ? "Sign Out" : "Back to Sign In"),
      ),
    ];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Firebase Auth Sample'),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: isInput ? getInputWidget() : getResultWidget(),
        ),
      ),
    );
  }
}
