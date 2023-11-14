import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AddPasswordScreen extends StatefulWidget {
  const AddPasswordScreen({super.key});

  @override
  State<AddPasswordScreen> createState() => _AddPasswordScreenState();
}

class _AddPasswordScreenState extends State<AddPasswordScreen> {
  String currentValue = 'Facebook';
  List<String> list = ['Facebook', 'Gmail', 'Github','Telegram', 'Instagram'];
  String password = '';
  String email = '';

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
        ),
        body: Center(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              children: [
                DropdownButton<String>(
                  value: currentValue,
                  onChanged: (value) async {
                    currentValue = value!;
                    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
                    String? password1 = sharedPreferences.getString('$currentValue password');
                    String? email1 = sharedPreferences.getString('$currentValue email');
                    password = password1 ?? '';
                    email = email1 ?? '';
                    setState(() {});
                  },
                  items: list.map(
                        (e) {
                      return DropdownMenuItem(
                        value: e,
                        child: Text(e),
                      );
                    },
                  ).toList(),
                ),
                const SizedBox(
                  height: 18,
                ),
                Text(
                  'Password : $password',
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 18,
                  ),
                ),
                Text(
                  'Email : $email',
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 18,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

