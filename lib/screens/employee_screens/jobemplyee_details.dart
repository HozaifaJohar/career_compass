import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class EmployeJobDetails extends StatelessWidget {
  const EmployeJobDetails({super.key});

  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    double screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
        extendBodyBehindAppBar: true,
        appBar: AppBar(
          elevation: 0,
          backgroundColor: Colors.transparent,
          iconTheme: const IconThemeData(color: Colors.white),
        ),
        body: Container(
            decoration: const BoxDecoration(
              color: Color(0xFF5E72E2),
            ),
            child: Stack(
              children: [
                Stack(
                  children: [
                    Container(
                      width: screenWidth,
                      height: screenHeight / 5,
                      decoration: const BoxDecoration(color: Colors.white),
                    ),
                    Container(
                      width: screenWidth,
                      height: screenHeight / 5,
                      decoration: const BoxDecoration(
                        color: Color(0xFF5E72E2),
                        borderRadius:
                            BorderRadius.only(bottomRight: Radius.circular(70)),
                      ),
                      child: const Center(
                        child: Text(
                          'Job Details',
                          style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 40),
                        ),
                      ),
                    )
                  ],
                ),
                Align(
                  alignment: Alignment.bottomCenter,
                  child: Container(
                    width: screenWidth,
                    height: screenHeight / 1.5,
                    decoration: const BoxDecoration(color: Color(0xFF5E72E2)),
                  ),
                ),
                Align(
                  alignment: Alignment.bottomCenter,
                  child: Container(
                    width: screenWidth,
                    height: screenHeight / 1.25,
                    decoration: const BoxDecoration(
                        color: Color.fromARGB(255, 255, 255, 255),
                        borderRadius:
                            BorderRadius.only(topLeft: Radius.circular(70))),
                    child: Padding(
                      padding: const EdgeInsets.all(34.0),
                      child: Column(
                        children: [
                          SizedBox(
                            height: screenHeight / 5.5,
                          ),
                          const Row(
                            children: [
                              Icon(Icons.work,
                                  color: Color.fromARGB(107, 94, 114, 226)),
                              SizedBox(width: 20),
                              Text('Job Role:'),
                              SizedBox(width: 20),
                            ],
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          const Row(
                            children: [
                              Icon(Icons.bar_chart,
                                  color: Color.fromARGB(107, 94, 114, 226)),
                              SizedBox(width: 20),
                              Text('Job Level:'),
                              SizedBox(width: 20),
                            ],
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          const Row(
                            children: [
                              Icon(Icons.schedule,
                                  color: Color.fromARGB(107, 94, 114, 226)),
                              SizedBox(width: 20),
                              Text('Job Type:'),
                              SizedBox(width: 20),
                            ],
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          const Row(
                            children: [
                              Icon(Icons.location_city,
                                  color: Color.fromARGB(107, 94, 114, 226)),
                              SizedBox(width: 20),
                              Text('Work City:'),
                              SizedBox(width: 20),
                            ],
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          const Row(
                            children: [
                              Icon(Icons.text_decrease,
                                  color: Color.fromARGB(107, 94, 114, 226)),
                              SizedBox(width: 20),
                              Text('Discription:'),
                              SizedBox(width: 20),
                            ],
                          ),
                          const SizedBox(
                            height: 40,
                          ),
                          SizedBox(
                            height: 50,
                            width: 200,
                            child: MaterialButton(
                              onPressed: () {},
                              color: const Color.fromARGB(107, 94, 114, 226),
                              child: const Center(
                                child: Text(
                                  'Applay',
                                  style: TextStyle(color: Colors.white),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                )
              ],
            )));
  }
}





//  Padding(
//                       padding: const EdgeInsets.all(34.0),
//                       child: Column(
//                         children: [
//                           const Row(
//                             children: [
//                               Icon(Icons.work,
//                                   color: Color.fromARGB(107, 94, 114, 226)),
//                               SizedBox(width: 20),
//                               Text('Job Role:'),
//                               SizedBox(width: 20),
//                             ],
//                           ),
//                           const SizedBox(
//                             height: 20,
//                           ),
//                           const Row(
//                             children: [
//                               Icon(Icons.bar_chart,
//                                   color: Color.fromARGB(107, 94, 114, 226)),
//                               SizedBox(width: 20),
//                               Text('Job Level:'),
//                               SizedBox(width: 20),
//                             ],
//                           ),
//                           const SizedBox(
//                             height: 20,
//                           ),
//                           const Row(
//                             children: [
//                               Icon(Icons.schedule,
//                                   color: Color.fromARGB(107, 94, 114, 226)),
//                               SizedBox(width: 20),
//                               Text('Job Type:'),
//                               SizedBox(width: 20),
//                             ],
//                           ),
//                           const SizedBox(
//                             height: 20,
//                           ),
//                           const Row(
//                             children: [
//                               Icon(Icons.location_city,
//                                   color: Color.fromARGB(107, 94, 114, 226)),
//                               SizedBox(width: 20),
//                               Text('Work City:'),
//                               SizedBox(width: 20),
//                             ],
//                           ),
//                           const SizedBox(
//                             height: 20,
//                           ),
//                           const Row(
//                             children: [
//                               Icon(Icons.text_decrease,
//                                   color: Color.fromARGB(107, 94, 114, 226)),
//                               SizedBox(width: 20),
//                               Text('Discription:'),
//                               SizedBox(width: 20),
//                             ],
//                           ),
//                           const SizedBox(
//                             height: 40,
//                           ),
//                           SizedBox(
//                             height: 50,
//                             width: 200,
//                             child: MaterialButton(
//                               onPressed: () {},
//                               color: const Color.fromARGB(107, 94, 114, 226),
//                               child: const Center(
//                                 child: Text(
//                                   'Applay',
//                                   style: TextStyle(color: Colors.white),
//                                 ),
//                               ),
//                             ),
//                           ),
//                         ],
//                       ),
//                     ),