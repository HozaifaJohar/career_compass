import 'package:career_compass/screens/company_screens/add_job.dart';
import 'package:career_compass/style/app_colors.dart';
import 'package:career_compass/widgets/waves.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';

class HomePageCompany extends StatefulWidget {
  const HomePageCompany({super.key});

  @override
  State<HomePageCompany> createState() => _HomePageCompanyState();
}

class _HomePageCompanyState extends State<HomePageCompany> {
  int _currentPage = 0;
  List<Widget> widgetList = const [Text('home page'), Text('userspage')];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Stack(
              children: [
                Opacity(
                  opacity: 0.5,
                  child: ClipPath(
                    clipper: WaveClipper(),
                    child: Container(
                      height: 140,
                      color: AppColors.mainColor,
                    ),
                  ),
                ),
                ClipPath(
                  clipper: WaveClipper(),
                  child: Container(
                    height: 120,
                    color: AppColors.mainColor,
                  ),
                ),
              ],
            ),
            Image.asset('images/man.gif'),
            const SizedBox(
              height: 20,
            ),
            SizedBox(
              height: 50,
              width: 200,
              child: MaterialButton(
                color: AppColors.mainColor,
                onPressed: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => const AddJob()));
                },
                child: const Center(
                  child: Text(
                    'Add New Job',
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
      bottomNavigationBar: CurvedNavigationBar(
        height: 60,
        index: 1,
        backgroundColor: Colors.transparent,
        buttonBackgroundColor: AppColors.mainColor,
        color: AppColors.mainColor,
        animationDuration: const Duration(milliseconds: 300),
        items: const <Widget>[
          Icon(Icons.people, size: 26, color: Colors.white),
          Icon(Icons.home, size: 26, color: Colors.white),
          Icon(Icons.person, size: 26, color: Colors.white),
        ],
        onTap: (index) {
          setState(() {
            _currentPage = index;
          });
        },
      ),
    );
  }
}
