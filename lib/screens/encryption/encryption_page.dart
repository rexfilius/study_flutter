import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:study_flutter/screens/encryption/request_json.dart';

class EncryptionPage extends StatefulHookConsumerWidget {
  const EncryptionPage({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _EncryptionPageState();
}

class _EncryptionPageState extends ConsumerState<EncryptionPage> {
  RequestJson requestJson = const RequestJson(
    name: 'Giannis',
    password: 'Lakers32',
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Encryption'),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: ListView(
          children: [
            const Text('Text to encrypt below 👇🏾'),
            const SizedBox(height: 10),
            Text(requestJson.toString()),
            const SizedBox(height: 10),
            ElevatedButton(
              onPressed: () {},
              child: const Text('Encrypt Text'),
            )
          ],
        ),
      ),
    );
  }
}
