import 'package:flutter/material.dart';
import 'package:password_meneger/ui/add_password_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';

class PasswordSaveScreen extends StatefulWidget {
  const PasswordSaveScreen({super.key});

  @override
  State<PasswordSaveScreen> createState() => _PasswordSaveScreenState();
}

class _PasswordSaveScreenState extends State<PasswordSaveScreen> {
  String currentValue = 'Facebook';
  List<String> list = [
    'Facebook',
    'Gmail',
    'Github',
    'Instagram',
    'Telegram',
  ];
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(),
        body: Center(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              children: [
                DropdownButton<String>(
                  value: currentValue,
                  onChanged: (String? item) {
                    passwordController.clear();
                    currentValue = item!;
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
                TextField(
                  controller: emailController,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8)),
                    hintText: 'Enter Email',
                  ),
                ),
                const SizedBox(
                  height: 18,
                ),
                TextField(
                  controller: passwordController,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8)),
                    hintText: 'Enter Password',
                  ),
                ),
                const SizedBox(
                  height: 18,
                ),
                ElevatedButton(
                  onPressed: () async {
                    String email = emailController.text;
                    String password = passwordController.text;
                    SharedPreferences pref =
                        await SharedPreferences.getInstance();
                    pref.setString('email', email);
                    pref.setString('password', password);
                    passwordController.clear();
                    emailController.clear();
                  },
                  child: const Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text('Save'),
                    ],
                  ),
                ),

                const SizedBox(
                  height: 18,
                ),
                TextButton(
                  style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all(Colors.green),
                    minimumSize: MaterialStateProperty.all(const Size(500, 50)),
                  ),
                  onPressed: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) {
                      return const AddPasswordScreen();
                    }));
                  },
                  child: const Text(
                    'goto',
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
