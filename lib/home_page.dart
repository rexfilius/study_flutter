import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import 'package:study_flutter/app_routes.dart';
import 'package:study_flutter/custom_board/custom_keyboard.dart';
import 'package:study_flutter/custom_board/pin_theme.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  String theInput = '';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        children: [
          const Padding(
            padding: EdgeInsets.symmetric(
              horizontal: 35.0,
              vertical: 35.0,
            ),
            child: Text(
              "Enter PIN",
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.w700,
                fontSize: 18,
              ),
            ),
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.only(bottom: 8.0),
              child: CustomKeyBoard(
                pinTheme: PinTheme(
                  submitColor: Color(0xff151518), //Colors.green,
                  textColor: Color(0xff000000),
                  keysColor: Color(0xff000000),
                ),
                onChanged: (v) {
                  if (kDebugMode) {
                    print(v);
                  }
                  setState(() {
                    theInput = v;
                  });
                },
                onbuttonClick: () {
                  if (kDebugMode) {
                    print('clicked');
                  }
                  Navigator.of(context).pushNamed(
                    RouteName.receiveInput,
                    arguments: theInput,
                  );
                },
                maxLength: 4,
                submitLabel: const Text(
                  'Proceed',
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.w700,
                    fontSize: 18,
                  ),
                ),
                // submitLabel: ElevatedButton(
                //   onPressed: () {},
                //   child: const Text('Proceed'),
                // ),
              ),
            ),
          )
        ],
      ),
      // bottomNavigationBar: Container(
      //   height: MediaQuery.of(context).padding.bottom,
      //   color: Color(0xff151518),
      // ),
    );
  }
}
