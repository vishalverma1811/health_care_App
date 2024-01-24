import 'package:flutter/material.dart';
import 'cart.dart';

class TestList extends StatefulWidget {
  const TestList({super.key});

  @override
  State<TestList> createState() => _TestListState();
}

class _TestListState extends State<TestList> {
  //function to build to test card
  Card testsCard(var heading, var subheading, var supportingText, var discountPrice, var originalPrice) {
    return Card(
      elevation: 4.0,
      child: SizedBox(
        width: MediaQuery.of(context).size.width / 2.3,
        child: Column(
          children: [
            Container(
              height: 25,
              width: MediaQuery.of(context).size.width / 2.3,
              decoration: BoxDecoration(
                color: Color(0xFF404D97),
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(8.0),
                  topRight: Radius.circular(8.0),
                ),
              ),
              child: Center(
                child: Text(
                  heading,
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
                  padding: const EdgeInsets.all(8.0),
                  child: Text(subheading),
                ),
                Spacer(),
                IconButton(
                  onPressed: () {
                    // Your onPressed logic here
                  },
                  icon: Image.asset(
                    'assets/secure.png',
                    width: 24,
                    height: 24,
                  ),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.only(left: 8.0),
              child: Align(alignment:Alignment.topLeft,
              child: Text(supportingText, style: TextStyle(fontSize: 8),)),
            ),
            Row(
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 8.0),
                  child: Align(alignment:Alignment.topLeft,
                      child: Text(discountPrice, style: TextStyle(fontSize: 16,color: Color(0xFF10217D),),)),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 8.0),
                  child: Align(alignment:Alignment.topLeft,
                      child: Text(originalPrice, style: const TextStyle(
                        fontSize: 8,
                        color: Colors.grey,
                          decoration: TextDecoration.lineThrough
                      ),)),
                ),
              ],
            ),
            ButtonBar(
              children: [
                ButtonBar(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(bottom: 4.0),
                      child: Container(
                        height: 40,
                        width: MediaQuery.of(context).size.width / 2.3,
                        decoration: BoxDecoration(
                          color: Color(0xFF404D97),
                          borderRadius: BorderRadius.circular(8.0),
                        ),
                        child: TextButton(
                          child: const Text('Add To Cart',style: TextStyle(color: Colors.white),),
                          onPressed: () {
                            Navigator.push(context, MaterialPageRoute(builder: (context)=>MyCart(heading: heading, discountPrice: discountPrice, originalPrice: originalPrice)));
                          },
                        ),
                      ),
                    ),
                    Container(
                      height: 40,
                      width: MediaQuery.of(context).size.width / 2.3,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(8.0),
                      ),
                      child: TextButton(
                        child: const Text('View Details',style: TextStyle(color: Color(0xFF404D97),),),
                        onPressed: () {/* ... */},
                      ),
                    )
                  ],
                ),
              ],
            )
          ],
        ),
      ),
    );
  }

  //function to build package card
  Card packageCard() {
    var heading = 'Full Body Checkup';
    var subheading = 'Include 92 tests';
    var price = '₹ 2000';
    return Card(
      elevation: 4.0,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 20.0, left: 8.0),
                  child: IconButton(
                    onPressed: () {
                      // Your onPressed logic here
                    },
                    icon: Image.asset(
                      'assets/medicine-jar.png',
                      width: 52,
                      height: 52,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(right: 8.0, top: 16.0),
                  child: Container(
                    padding: EdgeInsets.only(right: 8.0),
                    decoration: BoxDecoration(
                      color: Color(0xFF16C2D5),
                      borderRadius: BorderRadius.circular(4.0),
                    ),
                    child: Row(
                      children: [
                        Image.asset(
                          'assets/secure.png',
                          width: 24,
                          height: 24,
                        ),
                        Text(
                          'Safe',
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.only(left: 16.0, top: 8.0),
              child: Align(alignment: Alignment.topLeft,
                  child: Text(heading, style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                  )),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 16.0),
              child: Align(alignment: Alignment.topLeft,
                  child: Text(subheading, style: TextStyle(fontSize: 14, color: Colors.grey),
                  )),
            ),
            Text.rich(
              TextSpan(
                children: [
                  WidgetSpan(
                    alignment: PlaceholderAlignment.middle,
                    child: Padding(
                      padding: const EdgeInsets.only(left: 8.0),
                      child: Icon(Icons.fiber_manual_record, size: 10, color: Colors.grey,),
                    ),
                  ),
                  TextSpan(
                    text: ' Blood Glucose Fasting\n', style: TextStyle(color: Colors.grey),
                  ),
                  WidgetSpan(
                    alignment: PlaceholderAlignment.middle,
                    child: Padding(
                      padding: const EdgeInsets.only(left: 8.0),
                      child: Icon(Icons.fiber_manual_record, size: 10, color: Colors.grey,),
                    ),
                  ),
                  TextSpan(
                    text: ' Liver Function Test', style: TextStyle(color: Colors.grey),
                  ),
                ],
              ),
            ),
            Align(alignment: Alignment.topLeft,
                child: TextButton(onPressed: (){}, child: Text('View More',
                    style: TextStyle(fontSize: 14, color: Colors.grey, decoration: TextDecoration.underline)),
                )),
            Padding(
              padding: const EdgeInsets.only(bottom: 8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Text(price, style: TextStyle(fontSize: 32, color: Color(0xFF16C2D5)),),
                  Container(
                    height: 40,
                    width: MediaQuery.of(context).size.width / 2.3,
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(8.0),
                        border: Border.all(color: Color(0xFF404D97))
                    ),
                    child: TextButton(
                      child: const Text('Add To Cart',style: TextStyle(color: Color(0xFF404D97),),),
                      onPressed: () {/* ... */},
                    ),
                  )
                ],
              ),
            )
          ],
        ));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Icon(Icons.account_circle_outlined),
        title: Text('Hello User'),
        actions: [
          IconButton(onPressed: (){
            Navigator.push(context, MaterialPageRoute(builder: (context) => MyCart(heading: '', discountPrice: null, originalPrice: null,)));
          }, icon: Icon(Icons.shopping_cart_outlined))
        ],
        elevation: 5,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: Text('Popular Lab Tests', style: TextStyle(
                    fontSize: 24,
                    color: Color(0xFF10217D)
                  ),),
                ),
                Spacer(),
                Padding(
                  padding: const EdgeInsets.only(top: 12.0, left: 12.0, bottom: 12.0),
                  child: Text('View More', style: TextStyle(
                    color: Color(0xFF10217D),
                    fontSize: 16,
                    decoration: TextDecoration.underline
                  ),),
                ),
                Padding(
                  padding: const EdgeInsets.only(right: 8.0),
                  child: Icon(Icons.arrow_right_alt, color: Color(0xFF10217D), size: 16,),
                )
              ],
            ),
            Row(
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 8.0),
                  child: testsCard('Thyroid Test', 'Include 3 Tests', 'Get Reports In 24 Hrs','₹ 600', '₹ 900'),
                ),
                Spacer(),
                Padding(
                  padding: const EdgeInsets.only(right: 8.0),
                  child: testsCard('Iron Study Test', 'Include 5 Tests', 'Get Reports In 24 Hrs', '₹ 900', '₹ 1500'),
                ),
              ],
            ),
            Row(
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 8.0),
                  child: testsCard('Thyroid Test', 'Include 3 Tests', 'Get Reports In 24 Hrs','₹ 600', '₹ 900'),
                ),
                Spacer(),
                Padding(
                  padding: const EdgeInsets.only(right: 8.0),
                  child: testsCard('Iron Study Test', 'Include 5 Tests', 'Get Reports In 24 Hrs', '₹ 900', '₹ 1500'),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.all(12.0),
              child: Align(
                alignment: Alignment.topLeft,
                child: Text('Popular Packages', style: TextStyle(
                    fontSize: 24,
                    color: Color(0xFF10217D)
                ),),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 8.0, right: 8.0, bottom: 8.0),
              child: packageCard(),
            )
          ],
        ),
      ),
    );
  }
}
