import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SignUpScreen extends StatefulWidget {
  final SharedPreferences prefs;
  const SignUpScreen({super.key, required this.prefs});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final _formKey = GlobalKey<FormState>();
  final _usernameCtrl = TextEditingController();
  final _passwordCtrl = TextEditingController();
  final _fullNameCtrl = TextEditingController();
  String? _message;

  Future<void> _signup() async {
    final username = _usernameCtrl.text.trim();
    final password = _passwordCtrl.text;
    final fullName = _fullNameCtrl.text.trim();
    await widget.prefs.setString('Kullanıcı Adı', username);
    await widget.prefs.setString('Şifre', password);
    await widget.prefs.setString('Tam Ad', fullName);
    if (!mounted) return;
    Navigator.of(context).pop(username);
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
      appBar: AppBar(title: const Text('Kayıt Ol')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
          if (_message != null) Padding(
            padding: const EdgeInsets.only(bottom: 12.0),
            child: Text(_message!, style: const TextStyle(color: Colors.green)),
          ),
          Form(
            key: _formKey,
            child: Column(children: [
              TextFormField(
                controller: _fullNameCtrl,
                decoration: const InputDecoration(labelText: 'Tam Ad'),
                validator: (v) => (v == null || v.isEmpty) ? 'Tam ad girin' : null,
              ),
              const SizedBox(height: 8),
              TextFormField(
                controller: _usernameCtrl,
                decoration: const InputDecoration(labelText: 'Kullanıcı Adı'),
                validator: (v) => (v == null || v.isEmpty) ? 'Kullanıcı adı girin' : null,
              ),
              const SizedBox(height: 8),
              TextFormField(
                controller: _passwordCtrl,
                decoration: const InputDecoration(labelText: 'Şifre'),
                obscureText: true,
                validator: (v) => (v == null || v.isEmpty) ? 'Şifre girin' : null,
              ),
              const SizedBox(height: 16),
              ElevatedButton(onPressed: () async {
                if (_formKey.currentState!.validate()) {
                  await _signup();
                }
              }, child: const Text('Kayıt Ol')),
            ]),
          ),
        ]),
      ),
    );
  }
}
