import 'package:feemanage/students.dart';
import 'package:flutter/material.dart';

class LoginPages extends StatefulWidget {
  const LoginPages({super.key});

  @override
  State<LoginPages> createState() => _LoginPagesState();
}

class _LoginPagesState extends State<LoginPages> {
  TextEditingController stdid = TextEditingController();
  TextEditingController passcode = TextEditingController();

  final formKey = GlobalKey<FormState>();

  List<Student>? lstStudents;

  @override
  void didChangeDependencies() {
    lstStudents = ModalRoute.of(context)!.settings.arguments as List<Student>;
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('LOGIN'),
        centerTitle: true,
      ),
      body: Card(
        child: Form(
          key: formKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              for (var student in lstStudents!) ...{
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextFormField(
                    controller: stdid,
                    validator: (text) {
                      if (text!.isEmpty) {
                        return 'Please Enter Account ID';
                      }
                      if (int.parse(text) != student.accountId) {
                        return 'Enter Valid Account ID';
                      }
                      return null;
                    },
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(15.0),
                      ),
                      focusedBorder: const OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.blue, width: 2.0),
                      ),
                      hintText: 'Enter Account ID',
                      labelText: 'Account ID',
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextFormField(
                    controller: passcode,
                    validator: (text) {
                      if (text!.isEmpty) {
                        return 'Please Enter Details';
                      }
                      if (int.parse(text) != student.phone) {
                        return 'Enter Valid Phone No';
                      }
                      return null;
                    },
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(15.0),
                      ),
                      focusedBorder: const OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.blue, width: 2.0),
                      ),
                      hintText: 'Enter Phone Number',
                      labelText: 'Phone No',
                    ),
                  ),
                ),
              },
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: SizedBox(
                  height: 50.0,
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: () {
                      setState(() {
                        if (formKey.currentState!.validate()) {
                          Navigator.pushNamed(context, '/dashboard',
                              arguments: lstStudents);
                        }
                      });
                    },
                    child: const Text('LOGIN'),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: SizedBox(
                  height: 50.0,
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: () {
                      setState(() {
                        Navigator.pushNamed(context, '/');
                      });
                    },
                    child: const Text('REGISTER'),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
