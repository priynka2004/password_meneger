import 'package:flutter/material.dart';
import 'package:password_meneger/ui/add_password_screen.dart';
import 'package:password_meneger/util/strings.dart';
import 'package:shared_preferences/shared_preferences.dart';

class PasswordSaveScreen extends StatefulWidget {
  const PasswordSaveScreen({Key? key}) : super(key: key);

  @override
  State<PasswordSaveScreen> createState() => _PasswordSaveScreenState();
}

class _PasswordSaveScreenState extends State<PasswordSaveScreen> {
  String currentValue = Strings.currentValue;
  List<String> list = [
    Strings.list,
    Strings.list1,
    Strings.list2,
    Strings.list3,
    Strings.list4,
    Strings.list5,
    Strings.list6,
    Strings.list7,
    Strings.list8,
    Strings.list9,
    Strings.list10,
    Strings.list11,
    Strings.list12,
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
            child: SingleChildScrollView(
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
                      hintText: Strings.emailText1,
                    ),
                  ),
                  const SizedBox(
                    height: 18,
                  ),
                  TextField(
                    obscureText: true,
                    controller: passwordController,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(8)),
                      hintText: Strings.passwordText1,
                    ),
                  ),
                  const SizedBox(
                    height: 18,
                  ),
                  ElevatedButton(
                    style: ButtonStyle(
                      minimumSize: MaterialStateProperty.all(
                        const Size(500, 50),
                      ),
                    ),
                    onPressed: () async {
                      await saveData();
                    },
                    child: const Text(Strings.buttonText),
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
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) {
                            return const AddPasswordScreen();
                          },
                        ),
                      );
                    },
                    child: const Text(Strings.textButton),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Future<void> saveData() async {
    String email = emailController.text;
    String password = passwordController.text;
    SharedPreferences pref =
    await SharedPreferences.getInstance();
    pref.setString('$currentValue email', email);
    pref.setString('$currentValue password', password);
    passwordController.clear();
    emailController.clear();
  }
}
