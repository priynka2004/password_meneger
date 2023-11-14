import 'package:flutter/material.dart';
import 'package:password_meneger/util/strings.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AddPasswordScreen extends StatefulWidget {
  const AddPasswordScreen({Key? key}) : super(key: key);

  @override
  AddPasswordScreenState createState() => AddPasswordScreenState();
}

class AddPasswordScreenState extends State<AddPasswordScreen> {
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
  String password = '';
  String email = '';

  @override
  void initState() {
    super.initState();
    data();
  }

  Future<void> data() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    String? password1 = sharedPreferences.getString('$currentValue password');
    String? email1 = sharedPreferences.getString('$currentValue email');
    setState(() {
      password = password1 ?? Strings.passwordText;
      email = email1 ?? Strings.emailText;
    });
  }

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
                  onChanged: (value) {
                    setState(() async {
                      currentValue = value!;
                      data();
                    });
                  },
                  items: list.map((e) {
                    return DropdownMenuItem(
                      value: e,
                      child: Text(e),
                    );
                  }).toList(),
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
