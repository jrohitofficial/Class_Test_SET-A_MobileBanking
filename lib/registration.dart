import 'package:feemanage/students.dart';
import 'package:flutter/material.dart';

class ResgiterPage extends StatefulWidget {
  const ResgiterPage({super.key});

  @override
  State<ResgiterPage> createState() => _ResgiterPageState();
}

class _ResgiterPageState extends State<ResgiterPage> {
  final finalKey = GlobalKey<FormState>();
  List<Student> lstStudent = [];
  TextEditingController accnt = TextEditingController();
  TextEditingController fname = TextEditingController();
  TextEditingController lname = TextEditingController();
  TextEditingController address = TextEditingController();
  TextEditingController phone = TextEditingController();

  Padding fieldss(String hintss, String labels, TextEditingController contr) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: TextFormField(
        controller: contr,
        validator: (value) {
          if (value!.isEmpty) {
            return 'Enter Proper Details';
          }
          return null;
        },
        decoration: InputDecoration(
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10.0),
          ),
          focusedBorder: const OutlineInputBorder(
            borderSide: BorderSide(color: Colors.blue, width: 2.0),
          ),
          hintText: hintss,
          labelText: labels,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Registration'),
        centerTitle: true,
      ),
      body: Card(
        child: Form(
          key: finalKey,
          child: ListView(
            children: <Widget>[
              fieldss('Enter Accout number', 'Account No', accnt),
              fieldss('Enter first name', 'First Name', fname),
              fieldss('Enter last name', 'lname', lname),
              fieldss('Enter address', 'address', address),
              fieldss('Enter phone', 'Phone', phone),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: SizedBox(
                  height: 50.0,
                  width: double.infinity,
                  child: ElevatedButton(
                    child: const Text('Register'),
                    onPressed: () {
                      setState(() {
                        if (finalKey.currentState!.validate()) {
                          Student student = Student(
                            int.parse(accnt.text),
                            fname.text.trim(),
                            lname.text.trim(),
                            int.parse(phone.text),
                            address.text.trim(),
                            2000,
                          );
                          lstStudent.add(student);
                          Navigator.pushNamed(context, '/login',
                              arguments: lstStudent);
                        }
                      });
                    },
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
