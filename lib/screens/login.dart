import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'signup.dart';

class LoginScreen extends StatefulWidget {
  final SharedPreferences prefs;
  const LoginScreen({super.key, required this.prefs});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _formKey = GlobalKey<FormState>();
  final _usernameCtrl = TextEditingController();
  final _passwordCtrl = TextEditingController();
  String? _error;

  void _login() {
    final u = widget.prefs.getString('username');
    final p = widget.prefs.getString('password');
    if (u == null || p == null) {
      setState(() => _error = 'No user registered. Please Sign Up first.');
      return;
    }
    if (_usernameCtrl.text == u && _passwordCtrl.text == p) {
      Navigator.of(context).pushReplacementNamed('/home');
    } else {
      setState(() => _error = 'Invalid username or password');
    }
  }

  @override
  void dispose() {
    _usernameCtrl.dispose();
    _passwordCtrl.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Login')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            if (_error != null)
              Padding(
                padding: const EdgeInsets.only(bottom: 12.0),
                child: Text(_error!, style: const TextStyle(color: Colors.red)),
              ),
            Form(
              key: _formKey,
              child: Column(children: [
                TextFormField(
                  controller: _usernameCtrl,
                  decoration: const InputDecoration(labelText: 'Username'),
                  validator: (v) => (v == null || v.isEmpty) ? 'Enter username' : null,
                ),
                const SizedBox(height: 8),
                TextFormField(
                  controller: _passwordCtrl,
                  decoration: const InputDecoration(labelText: 'Password'),
                  obscureText: true,
                  validator: (v) => (v == null || v.isEmpty) ? 'Enter password' : null,
                ),
                const SizedBox(height: 16),
                ElevatedButton(
                  onPressed: () {
                    if (_formKey.currentState!.validate()) _login();
                  },
                  child: const Text('Login'),
                ),
              ]),
            ),
            const SizedBox(height: 16),
            TextButton(
              onPressed: () async {
                // go to signup and get the created username back (if provided)
                final result = await Navigator.of(context).push(MaterialPageRoute(builder: (_) => SignUpScreen(prefs: widget.prefs)));
                if (result is String && result.isNotEmpty) {
                  _usernameCtrl.text = result;
                }
                // after coming back, clear any error
                setState(() => _error = null);
              },
              child: const Text('Don\'t have an account? Sign Up'),
            )
          ],
        ),
      ),
    );
  }
}
