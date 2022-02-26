import 'package:flutter/material.dart';
import 'package:project/services/fireBase_phone_auth_service.dart';
import 'package:project/view/screens/current_screen.dart';

class VerifyCodePage extends StatelessWidget {
  VerifyCodePage({Key? key}) : super(key: key);
  final TextEditingController _sentCode = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        children: [
          TextFormField(
            controller: _sentCode,
            decoration: InputDecoration(
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20.0))),
          ),
          ElevatedButton(
            child: const Text("Send"),
            onPressed: () {
              LoginWithPhone.verifyOTP(_sentCode.text);
              Navigator.pushAndRemoveUntil(
                  context,
                  MaterialPageRoute(builder: (context) => CurrentScreen()),
                  (route) => false);
            },
          ),
        ],
      ),
    );
  }
}
