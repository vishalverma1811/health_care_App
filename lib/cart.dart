import 'package:flutter/material.dart';
import 'package:health_checkup/success_page.dart';
import 'package:intl/intl.dart';

class MyCart extends StatefulWidget {
  var heading;
  var discountPrice;
  var originalPrice;

  MyCart({
    required this.heading,
    required this.discountPrice,
    required this.originalPrice,
  });

  @override
  State<MyCart> createState() => _MyCartState();
}

class _MyCartState extends State<MyCart> {
  TextEditingController dateTimeController = TextEditingController();

  DateTime? selectedDate;
  TimeOfDay? selectedTime;
  bool isDateSelected = false;

  Future<void> _selectDate(BuildContext context) async {
    final DateTime currentDate = DateTime.now();
    final DateTime firstDate = DateTime(currentDate.year, currentDate.month);
    final DateTime? pickedDate = await showDatePicker(
      context: context,
      initialDate: currentDate,
      firstDate: firstDate,
      lastDate: DateTime(2100),
      selectableDayPredicate: (DateTime date) => date.isAfter(currentDate.subtract(Duration(days: 1))),
    );
    if (pickedDate != null) {
      final TimeOfDay? pickedTime = await showDialog<TimeOfDay>(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text('Select Time'),
            content: SizedBox(
              width: double.maxFinite,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  SizedBox(height: 8),
                  Text('Select a time slot:'),
                  SizedBox(height: 8),
                  Expanded(
                    child: ListView.builder(
                      shrinkWrap: true,
                      itemCount: 10,
                      itemBuilder: (BuildContext context, int index) {
                        final int hour = index + 9;
                        final String timeSlot = '${hour.toString().padLeft(2, '0')}:00 - ${(hour + 1).toString().padLeft(2, '0')}:00';
                        return ListTile(
                          title: Text(timeSlot),
                          onTap: () => Navigator.of(context).pop(TimeOfDay(hour: hour, minute: 0)),
                        );
                      },
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      );
      if (pickedTime != null) {
        final DateTime pickedDateTime = DateTime(
          pickedDate.year,
          pickedDate.month,
          pickedDate.day,
          pickedTime.hour,
          pickedTime.minute,
        );
        setState(() {
          selectedDate = pickedDateTime;
          selectedTime = pickedTime;
          isDateSelected = true;
        });
        setState(() {
          dateTimeController.text = DateFormat('yyyy-MM-dd HH:mm').format(selectedDate!);
        });
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    bool isChecked = true;
    bool isCartEmpty = widget.heading == '' && widget.discountPrice == null && widget.originalPrice == null;
    var discount =  600;
    return Scaffold(
      appBar: AppBar(
        title: Text('My Cart'),
      ),
      body: isCartEmpty == true ?
          Center(
            child: Text('Cart is empty', style: TextStyle(fontSize: 16),),
          ):
        SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.all(12.0),
              child: Align(
                alignment: Alignment.topLeft,
                child: Text('Order Overview', style: TextStyle(
                    fontSize: 24,
                    color: Color(0xFF10217D)
                ),),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 8.0, right: 8.0),
              child: Card(
                elevation: 4.0,
                child: SizedBox(
                  width: MediaQuery.of(context).size.width,
                  child: Column(
                    children: [
                      Container(
                        margin: EdgeInsets.zero,
                        height: 25,
                        width: MediaQuery.of(context).size.width,
                        decoration: BoxDecoration(
                          color: Color(0xFF404D97),
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(8.0),
                            topRight: Radius.circular(8.0),
                          ),
                        ),
                        child: Center(
                          child: Text(
                            'Pathology Tests',
                            style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),
                      Row(
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(left: 12.0),
                            child: Text(widget.heading, style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),),
                          ),
                          Spacer(),
                          Column(
                            children: [
                              Text(widget.discountPrice + '/-', style: TextStyle(fontSize: 32, color: Color(0xFF16C2D5)),),
                              Text(widget.originalPrice,
                                  style: TextStyle(fontSize: 14, color: Colors.grey, decoration: TextDecoration.lineThrough)),
                            ],
                          ),
                        ],
                      ),
                      Align(
                        alignment: Alignment.topLeft,
                        child: Padding(
                          padding: const EdgeInsets.only(left: 28.0, bottom: 8.0),
                          child: Container(
                            height: 40,
                            width: MediaQuery.of(context).size.width / 2.8,
                            decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(28.0),
                                border: Border.all(color: Color(0xFF404D97))
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                Icon(Icons.delete_outline_sharp,color: Color(0xFF404D97),),
                                TextButton(
                                  child: const Text('Remove',style: TextStyle(color: Color(0xFF404D97),),),
                                  onPressed: () {/* ... */},
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                      Align(
                        alignment: Alignment.topLeft,
                        child: Padding(
                          padding: const EdgeInsets.only(left: 28.0, bottom: 12.0),
                          child: Container(
                            height: 40,
                            width: MediaQuery.of(context).size.width / 1.4,
                            decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(28.0),
                                border: Border.all(color: Color(0xFF404D97))
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                Icon(Icons.delete_outline_sharp,color: Color(0xFF404D97),),
                                TextButton(
                                  child: const Text('Upload prescription (optional)',style: TextStyle(color: Color(0xFF404D97),),),
                                  onPressed: () {/* ... */},
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 8.0, right: 8.0, top: 16),
              child: Card(
                elevation: 4.0,
                child: SizedBox(
                  height: 50,
                  width: MediaQuery.of(context).size.width,
                  child: Row(
                    children: [
                      GestureDetector(
                        onTap: () async {
                          _selectDate(context);
                        },
                        child: Row(
                          children: [
                            Padding(
                              padding: EdgeInsets.only(left: 8.0),
                                child: Icon(Icons.date_range, color: Colors.black,size: 26,)
                            ),
                            SizedBox(width: 16),
                            Container(
                              width: MediaQuery.of(context).size.width / 1.5,
                              height: 20,
                              child: TextFormField(
                                controller: dateTimeController,
                                readOnly: true,
                                decoration: InputDecoration(
                                  hintText: 'Select a Date and Time',
                                ),
                              ),
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
              padding: const EdgeInsets.only(left: 8.0, right: 8.0, top: 16),
              child: Card(
                elevation: 4.0,
                child: SizedBox(
                  width: MediaQuery.of(context).size.width,
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(top: 24.0, left: 8.0, right: 8.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text('M.R.P Total', style: TextStyle(fontSize: 12, color: Colors.grey),),
                            Text(widget.originalPrice, style: TextStyle(fontSize: 12, color: Colors.grey),),
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 8.0, left: 8.0, right: 8.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text('Discount', style: TextStyle(fontSize: 12, color: Colors.grey),),
                            Text(discount.toString(), style: TextStyle(fontSize: 12, color: Colors.grey),),
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 8.0, left: 8.0, right: 8.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text('Amount to be paid', style: TextStyle(fontSize: 18, color: Color(0xFF10217D), fontWeight: FontWeight.bold),),
                            Text(widget.discountPrice + '/-', style: TextStyle(fontSize: 18, color: Color(0xFF10217D), fontWeight: FontWeight.bold),),
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 8.0, left: 8.0, right: 8.0, bottom: 16.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text('Total Savings', style: TextStyle(fontSize: 14, color: Colors.grey, fontWeight: FontWeight.bold),),
                            Text(discount.toString(), style: TextStyle(fontSize: 18, color: Color(0xFF10217D), fontWeight: FontWeight.bold),),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 8.0, right: 8.0, top: 16),
              child: Card(
                elevation: 4.0,
                child: SizedBox(
                  width: MediaQuery.of(context).size.width,
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(left: 8.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            IconButton(
                              icon: Icon(
                                isChecked ? Icons.check_box : Icons.check_box_outline_blank,
                                color: isChecked ? Color(0xFF10217D) : Colors.grey,
                              ),
                              onPressed: () {
                                setState(() {
                                  if(isChecked == true){
                                    isChecked = false;
                                  }
                                  else{
                                    isChecked = true;
                                  }
                                });
                              },
                            ),
                            Text('Hard copy of reports', style: TextStyle(fontSize: 14, color: Colors.black),)
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 20.0, bottom: 8.0),
                        child: Text('Reports will be delivered within 3-4 working days. Hard copy charges are non refundable once the reports have been dispatched',
                          style: TextStyle(fontSize: 12, color: Colors.grey),),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: ElevatedButton(
                onPressed: () {
                  if (isDateSelected) {
                    Navigator.push(context, MaterialPageRoute(builder: (context)=>SuccessPage(
                      selectedDate: selectedDate!,
                      selectedTime: selectedTime!,
                    )));
                  } else {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content: Text('Please select a date'),
                      ),
                    );
                  }
                },
                style: ElevatedButton.styleFrom(
                  fixedSize: Size(MediaQuery.of(context).size.width, 50),
                  primary: isDateSelected ? Color(0xFF10217D) : Colors.grey,
                ),
                child: Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: Text(
                    'Schedule',
                    style: TextStyle(fontSize: 18, color: Colors.white),
                  ),
                ),
              ),
            ),
          ],
          ),
        )
    );
  }
}
