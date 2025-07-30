import 'package:flutter/material.dart';
import 'package:nfc_manager/nfc_manager.dart';
import 'package:study_flutter/screens/nfc_feature/nfc_logic.dart';

class NfcPage1 extends StatefulWidget {
  const NfcPage1({super.key});

  @override
  State<NfcPage1> createState() => _NfcPage1State();
}

class _NfcPage1State extends State<NfcPage1> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("NFC App"),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          ElevatedButton(
            onPressed: () async {
              bool isAvailable = await NfcManager.instance.isAvailable();
              if (!isAvailable) {
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(
                    content: Text('NFC is not available on this device'),
                  ),
                );
              }
            },
            child: Text("Check if NFC available"),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ElevatedButton(
                onPressed: () async {
                  await writeNfc('Hello NFC World!');
                },
                child: const Text('Write to NFC'),
              ),
              SizedBox(width: 16),
              ElevatedButton(
                onPressed: () async {
                  await readNfc();
                },
                child: const Text('Read from NFC'),
              ),
            ],
          )
        ],
      ),
    );
  }
}
