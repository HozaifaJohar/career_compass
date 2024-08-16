import 'package:career_compass/screens/company_screens/emailcodereset.dart';
import 'package:career_compass/services/company/activateotp_company.dart';
import 'package:career_compass/style/app_colors.dart';
import 'package:career_compass/widgets/textfield.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ResndCode extends StatefulWidget {
  const ResndCode({super.key});

  @override
  State<ResndCode> createState() => _ResndCodeState();
}

class _ResndCodeState extends State<ResndCode> {
  final TextEditingController _email = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 15,
        backgroundColor: AppColors.mainColor,
        title: const Text(
          'Email Company',
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
        child: Center(
          child: Column(
            children: [
              const SizedBox(
                height: 100,
              ),
              CustomTextField(
                title: 'Company Email',
                //hint: 'Type Here please',
                maxLines: 1,
                borderColor: AppColors.amber,
                controller: _email,
                border: 10,
                validateMessage: 'plaese enter company name',
              ),
              const SizedBox(
                height: 10,
              ),
              ElevatedButton(
                  onPressed: () async {
                    var isActive = await Provider.of<ActivicationCode>(context,
                            listen: false)
                        .resendcode(_email.text);
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) {
                      return CodeRest(
                        email: _email.text,
                      );
                    }));
                  },
                  child: const Text('Complete'))
            ],
          ),
        ),
      ),
    );
  }
}
