import 'package:career_compass/screens/company_screens/otp_company.dart';
import 'package:career_compass/services/company/auth_company.dart';
import 'package:career_compass/style/app_colors.dart';
import 'package:career_compass/widgets/buttom.dart';
import 'package:career_compass/widgets/flash_message.dart';

import 'package:career_compass/widgets/textfield.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ResisterCompanyScreen extends StatefulWidget {
  final String email;
  final String password;
  const ResisterCompanyScreen(
      {super.key, required this.email, required this.password});

  @override
  State<ResisterCompanyScreen> createState() => _ResisterCompanyScreenState();
}

class _ResisterCompanyScreenState extends State<ResisterCompanyScreen> {
  final TextEditingController _companyName = TextEditingController();
  final TextEditingController _companyPhone = TextEditingController();
  final TextEditingController _describtion = TextEditingController();
  final TextEditingController _address = TextEditingController();

  String city = 'Select location';

  @override
  Widget build(BuildContext context) {
    String address = '$city${_address.text}';
    return Scaffold(
      appBar: AppBar(
        elevation: 15,
        backgroundColor: AppColors.mainColor,
        title: const Text(
          'COMPANY\n I N F O R M A T I O N',
          style: TextStyle(color: Colors.white),
          textAlign: TextAlign.center,
        ),
        centerTitle: true,
        shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(90),
          bottomRight: Radius.circular(90),
        )),
        bottom: const PreferredSize(
            preferredSize: Size.fromHeight(65), child: SizedBox()),
      ),
      body: Padding(
        padding: const EdgeInsets.all(10),
        child: SingleChildScrollView(
          child: Column(
            children: [
              const SizedBox(
                height: 20,
              ),
              CustomTextField(
                title: 'Company Name',
                //hint: 'Type Here please',
                maxLines: 1,
                borderColor: AppColors.amber,
                controller: _companyName,
                border: 10,
                validateMessage: 'plaese enter company name',
              ),
              const SizedBox(
                height: 20,
              ),
              CustomTextField(
                title: 'Company Phone',
                maxLines: 1,
                borderColor: AppColors.amber,
                controller: _companyPhone,
                border: 10,
                validateMessage: 'please enter company phone',
              ),
              const SizedBox(
                height: 20,
              ),
              GestureDetector(
                onTap: () {
                  showModalBottomSheet(
                      shape: const BeveledRectangleBorder(
                          borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(50),
                              topRight: Radius.circular(50))),
                      context: context,
                      builder: (BuildContext context) {
                        return Container(
                          decoration: const BoxDecoration(
                              color: Color.fromARGB(255, 222, 219, 219),
                              borderRadius: BorderRadius.only(
                                  topLeft: Radius.circular(50),
                                  topRight: Radius.circular(50))),
                          child: Padding(
                            padding: const EdgeInsets.all(10.0),
                            child: ListView(
                              children: <Widget>[
                                ListTile(
                                  title: const Text(
                                    'Damascus',
                                    textAlign: TextAlign.center,
                                  ),
                                  onTap: () {
                                    setState(() {
                                      city = 'Damascus';
                                    });
                                    Navigator.pop(context);
                                  },
                                ),
                                ListTile(
                                  title: const Text(
                                    'Lattakia',
                                    textAlign: TextAlign.center,
                                  ),
                                  onTap: () {
                                    setState(() {
                                      city = 'Lattakia';
                                    });
                                    Navigator.pop(context);
                                  },
                                ),
                                ListTile(
                                  title: const Text(
                                    'Homs',
                                    textAlign: TextAlign.center,
                                  ),
                                  onTap: () {
                                    setState(() {
                                      city = 'Homs';
                                    });
                                    Navigator.pop(context);
                                  },
                                ),
                                ListTile(
                                  title: const Text(
                                    'Hama',
                                    textAlign: TextAlign.center,
                                  ),
                                  onTap: () {
                                    setState(() {
                                      city = 'Hama';
                                    });
                                    Navigator.pop(context);
                                  },
                                ),
                                ListTile(
                                  title: const Text(
                                    'Aleppo',
                                    textAlign: TextAlign.center,
                                  ),
                                  onTap: () {
                                    setState(() {
                                      city = 'Aleppo';
                                    });
                                    Navigator.pop(context);
                                  },
                                ),
                                ListTile(
                                  title: const Text(
                                    'Tartous',
                                    textAlign: TextAlign.center,
                                  ),
                                  onTap: () {
                                    setState(() {
                                      city = 'Tartous';
                                    });
                                    Navigator.pop(context);
                                  },
                                ),
                                ListTile(
                                  title: const Text(
                                    'Daraa',
                                    textAlign: TextAlign.center,
                                  ),
                                  onTap: () {
                                    setState(() {
                                      city = 'Daraa';
                                    });
                                    Navigator.pop(context);
                                  },
                                ),
                              ],
                            ),
                          ),
                        );
                      });
                },
                child: Container(
                  height: 80,
                  width: double.infinity,
                  decoration: BoxDecoration(
                      color: const Color.fromARGB(255, 238, 230, 230),
                      borderRadius: BorderRadius.circular(10)),
                  child: ListTile(
                    title: const Text(
                      'City',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    subtitle: Text(city),
                  ),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              CustomTextField(
                title: 'Address',
                maxLines: 1,
                borderColor: AppColors.amber,
                controller: _address,
                border: 10,
                validateMessage: 'please enter company address',
              ),
              const SizedBox(
                height: 40,
              ),
              CustomTextField(
                title: 'Describe your company',
                minLines: 3,
                maxLines: 4,
                borderColor: AppColors.amber,
                controller: _describtion,
                border: 10,
                validateMessage:
                    'please describe your company at least in one line ',
              ),
              const SizedBox(
                height: 10,
              ),
              Consumer<AuthCompany>(
                builder: (context, auth, child) {
                  return customButton(
                      tap: () async {
                        print('1155');
                        bool isR = await auth.register(
                            _companyName.text,
                            widget.email,
                            widget.password,
                            _companyPhone.text,
                            address,
                            _describtion.text);
                        print('11');

                        if (!isR) {
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(
                              elevation: 0,
                              content: FlashMessage(
                                errorText: auth.resMessage,
                              ),
                              behavior: SnackBarBehavior.floating,
                              backgroundColor: Colors.transparent,
                            ),
                          );
                        } else {
                          print('22');
                          Navigator.push(context,
                              MaterialPageRoute(builder: (context) {
                            return OtpCompany(
                              email: widget.email,
                            );
                          }));
                        }
                      },
                      text: 'Register',
                      context: context,
                      width: double.infinity);
                },
              )
              // GestureDetector(
              //   onTap: () async{
              //    bool r=await Provider.of<AuthCompany>(context, listen: false).register(
              //         _companyName.text,
              //         widget.email,
              //         widget.password,
              //         _companyPhone.text,
              //         address,
              //         _describtion.text);

              //     //     Navigator.push(context,
              //     //         MaterialPageRoute(builder: (context) {
              //     //       return OtpCompany(
              //     //         email: widget.email,
              //     //       );
              //     //     })
              //     // );
              //   },
              //   child: Container(
              //     width: 100,
              //     height: 40,
              //     decoration: BoxDecoration(
              //         color: AppColors.mainColor,
              //         borderRadius: BorderRadius.circular(50)),
              //     child: const Center(
              //       child: Text(
              //         'Register',
              //         style: TextStyle(
              //           color: Colors.white,
              //         ),
              //       ),
              //     ),
              //   ),
              // ),
            ],
          ),
        ),
      ),
    );
  }
}
