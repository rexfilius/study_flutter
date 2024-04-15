import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:study_flutter/screens/encryption2/encryption_util.dart';

class Encryption2Page extends ConsumerStatefulWidget {
  const Encryption2Page({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _Encryption2PageState();
}

class _Encryption2PageState extends ConsumerState<Encryption2Page> {
  String textToEncrypt = 'Hello Lora, my old friend';
  String encryptedData = '';
  String decryptedData = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Encryption'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(textToEncrypt),
          ElevatedButton(
            onPressed: () async {
              final ddd = await EncryptionUtil.encryptData(textToEncrypt);
              setState(() {
                encryptedData = ddd;
              });
            },
            child: const Text('Encrypt'),
          ),
          Flexible(child: Text(encryptedData)),
          ElevatedButton(
            onPressed: () async {
              final eee = await EncryptionUtil.decryptData(encryptedData);
              setState(() {
                decryptedData = eee;
              });
            },
            child: const Text('Decrypt'),
          ),
          Flexible(child: Text(decryptedData)),
        ],
      ),
    );
  }
}
