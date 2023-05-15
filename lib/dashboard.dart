import 'package:feemanage/students.dart';
import 'package:flutter/material.dart';

class DashBoardPage extends StatefulWidget {
  const DashBoardPage({super.key});

  @override
  State<DashBoardPage> createState() => _DashBoardPageState();
}

class _DashBoardPageState extends State<DashBoardPage> {
  List<Student>? lstStudents;
  TextEditingController accountId = TextEditingController();
  TextEditingController bill = TextEditingController();

  final pinKey = GlobalKey<FormState>();

  int trasnferr = 0;

  @override
  void didChangeDependencies() {
    lstStudents = ModalRoute.of(context)!.settings.arguments as List<Student>;
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Dashboard'),
        centerTitle: true,
      ),
      body: Form(
        key: pinKey,
        child: ListView(
          children: [
            for (var student in lstStudents!) ...{
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: ListTile(
                  title: Text('Balance : ${student.balance}'),
                  subtitle: Text('${student.fname} ${student.lname}'),
                  trailing: const Icon(Icons.money),
                ),
              ),
            },
            for (var student in lstStudents!) ...{
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: TextFormField(
                  controller: accountId,
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Enter valid number';
                    }
                    if (int.parse(value) != student.phone) {
                      return 'Phone number does not match';
                    }
                    return null;
                  },
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    focusedBorder: const OutlineInputBorder(
                      borderSide: BorderSide(
                          color: Color.fromARGB(255, 243, 7, 7), width: 2.0),
                    ),
                    hintText: 'Phone',
                    labelText: 'Phone',
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: TextFormField(
                  controller: bill,
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Enter valid amount';
                    }
                    return null;
                  },
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    focusedBorder: const OutlineInputBorder(
                      borderSide: BorderSide(
                          color: Color.fromARGB(255, 240, 24, 8), width: 2.0),
                    ),
                    hintText: 'Amount',
                    labelText: 'Amount',
                  ),
                ),
              ),
            },
            for (var student in lstStudents!) ...{
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: () {
                      setState(() {
                        if (pinKey.currentState!.validate()) {
                          student.balance =
                              student.balance - int.parse(bill.text);
                          trasnferr = trasnferr + int.parse(bill.text);
                        }
                        accountId.clear();
                        bill.clear();
                      });
                    },
                    child: const Text('Transfer'),
                  ),
                ),
              ),
            },
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: ListTile(
                title: Text('Transferred balance : $trasnferr'),
                subtitle: const Text('Rohit Jha'),
                trailing: const Icon(Icons.money),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
