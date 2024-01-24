import 'package:flutter/material.dart';
import 'package:health_checkup/testList.dart';
import 'package:intl/intl.dart';

class SuccessPage extends StatefulWidget {
  final DateTime selectedDate;
  final TimeOfDay selectedTime;

  SuccessPage({
    required this.selectedDate,
    required this.selectedTime,
  });

  @override
  State<SuccessPage> createState() => _SuccessPageState();
}

class _SuccessPageState extends State<SuccessPage> {
  @override
  Widget build(BuildContext context) {
    print(widget.selectedTime);
    print(widget.selectedDate);
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 8.0, right: 8.0, top: 16),
            child: Card(
              elevation: 4.0,
              child: SizedBox(
                height: MediaQuery.of(context).size.height/2,
                width: MediaQuery.of(context).size.width,
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(top: 38.0),
                      child: Image.asset(
                        'assets/calendar.png',
                        width: 224,
                        height: 224,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 12.0, left: 32.0, right: 12.0),
                      child: Text('Lab test have been scheduled successfully, You will receive mail for the same.',
                      style: TextStyle(fontSize: 18, color: Colors.black),),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 8.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Text(
                            DateFormat('yyyy-MM-dd').format(widget.selectedDate),
                            style: TextStyle(fontSize: 16, color: Colors.grey),
                          ),
                          Text('|'),
                          Text(
                            widget.selectedTime.format(context),
                            style: TextStyle(fontSize: 16, color: Colors.grey),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 8.0, right: 8.0, top: 20),
            child: Container(
              height: 60,
              width: MediaQuery.of(context).size.width,
              decoration: BoxDecoration(
                  color: Color(0xFF404D97),
                  borderRadius: BorderRadius.circular(8.0),
                  border: Border.all(color: Color(0xFF404D97))
              ),
              child: TextButton(
                child: const Text('Back To Home',style: TextStyle(color: Colors.white,),),
                onPressed: () {
                  Navigator.pop(context);
                  Navigator.pop(context);
                  Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=> TestList()));
                },
              ),
            ),
          )
        ],
      ),
    );
  }
}
