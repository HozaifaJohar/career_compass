import 'package:career_compass/style/app_colors.dart';
import 'package:career_compass/widgets/custom_painter.dart';
import 'package:flutter/material.dart';

Widget NotificationCardCompany({String? tiltle, String? url}) {
  return Padding(
    padding: const EdgeInsets.all(8.0),
    child: Stack(children: [
      Container(
        height: 100,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(25),
          gradient: const LinearGradient(
              colors: [Color(0xFF5E72E2), Color.fromARGB(255, 115, 134, 239)]),
        ),
      ),
      Positioned(
          right: 0,
          bottom: 0,
          top: 0,
          child: CustomPaint(
            size: const Size(100, 100),
            painter: CustomCardPainter(
                10.0, Colors.blue, const Color.fromARGB(255, 115, 134, 239)),
          )),
      Padding(
        padding: const EdgeInsets.all(20.0),
        child: Row(
          children: [
            Container(
              height: 50,
              width: 50,
              decoration: const BoxDecoration(
                color: Color.fromARGB(255, 214, 210, 210),
                shape: BoxShape.circle,
                image: DecorationImage(
                    fit: BoxFit.fill,
                    image: NetworkImage(
                        'http://10.0.2.2:3000/uploadsimages/7a8297c03a45bcd96bae44a757969d46.png')
                    //           //  AssetImage('./images/profilePhoto.jpg'),
                    ),
              ),
            ),
            const SizedBox(
              width: 10,
            ),
            Column(
              // crossAxisAlignment: CrossAxisAlignment.center,

              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  tiltle!,
                  style: const TextStyle(
                      color: Colors.white, fontWeight: FontWeight.bold),
                ),
                // SizedBox(
                //   height: 5,
                // ),
              ],
            ),
          ],
        ),
      )
    ]),
  );
}
