import 'dart:async';

import 'package:flutter/material.dart';
import 'package:nfc_manager/nfc_manager.dart';

class NFCService {
  // Check if NFC is available on the device
  Future<bool> isNfcAvailable() async {
    bool isAvailable = await NfcManager.instance.isAvailable();
    return isAvailable;
  }

  // Read NFC Tag
  Future<Map<String, dynamic>> readNfcTag() async {
    try {
      // Start NFC Session
      Completer<Map<String, dynamic>> completer = Completer();

      NfcManager.instance.startSession(
        onDiscovered: (NfcTag tag) async {
          // Extract NDEF records if available
          var ndef = Ndef.from(tag);
          if (ndef != null) {
            final records = ndef.cachedMessage?.records ?? [];
            List<String> messages = [];

            for (var record in records) {
              // Convert record payload to string
              String payload = String.fromCharCodes(record.payload);
              messages.add(payload);
            }

            // Stop the session
            NfcManager.instance.stopSession();

            completer
                .complete({'id': tag.data.toString(), 'messages': messages});
          }
        },

        // Handle any errors during NFC reading
        onError: (error) {
          NfcManager.instance.stopSession(errorMessage: error.toString());
          completer.completeError(error);
          return Future.value();
        },
      );

      return completer.future;
    } catch (e) {
      // Handle any exceptions
      print('NFC Read Error: $e');
      rethrow;
    }
  }

  // Write to NFC Tag
  Future<bool> writeToNfcTag(String message) async {
    try {
      Completer<bool> completer = Completer();

      NfcManager.instance.startSession(
        onDiscovered: (NfcTag tag) async {
          var ndef = Ndef.from(tag);

          if (ndef == null || !ndef.isWritable) {
            NfcManager.instance
                .stopSession(errorMessage: 'Tag is not NDEF writable');
            completer.complete(false);
            return;
          }

          // Create NDEF record
          final record = NdefRecord.createText(message);

          // Write record to tag
          try {
            //await ndef.write([record]);
            await ndef.write(NdefMessage([record]));
            NfcManager.instance.stopSession();
            completer.complete(true);
          } catch (e) {
            NfcManager.instance.stopSession(errorMessage: e.toString());
            completer.complete(false);
          }
        },
        onError: (error) {
          NfcManager.instance.stopSession(errorMessage: error.toString());
          completer.completeError(error);
          return Future.value();
        },
      );

      return completer.future;
    } catch (e) {
      print('NFC Write Error: $e');
      return false;
    }
  }
}

// Example Usage in a Widget
class NFCPage2 extends StatefulWidget {
  const NFCPage2({super.key});

  @override
  _NFCPage2State createState() => _NFCPage2State();
}

class _NFCPage2State extends State<NFCPage2> {
  final NFCService _nfcService = NFCService();
  String _nfcResult = 'Tap to read/write NFC';
  final TextEditingController _writeController = TextEditingController();

  @override
  void initState() {
    super.initState();
    _checkNfcAvailability();
  }

  Future<void> _checkNfcAvailability() async {
    bool isAvailable = await _nfcService.isNfcAvailable();
    if (!isAvailable) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('NFC is not available on this device'),
        ),
      );
    }
  }

  Future<void> _readNfcTag() async {
    try {
      var result = await _nfcService.readNfcTag();
      setState(() {
        _nfcResult = 'Read Tag ID: ${result['id']}\n'
            'Messages: ${result['messages']}';
      });
    } catch (e) {
      setState(() {
        _nfcResult = 'Error reading NFC tag: $e';
      });
    }
  }

  Future<void> _writeNfcTag() async {
    if (_writeController.text.isEmpty) {
      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text('Please enter a message')));
      return;
    }

    try {
      bool success = await _nfcService.writeToNfcTag(_writeController.text);
      setState(() {
        _nfcResult = success
            ? 'Successfully wrote to NFC tag'
            : 'Failed to write to NFC tag';
      });
    } catch (e) {
      setState(() {
        _nfcResult = 'Error writing NFC tag: $e';
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('NFC Reader/Writer')),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextField(
              controller: _writeController,
              decoration: InputDecoration(
                  labelText: 'Message to Write', border: OutlineInputBorder()),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: _writeNfcTag,
              child: Text('Write to NFC Tag'),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: _readNfcTag,
              child: Text('Read NFC Tag'),
            ),
            SizedBox(height: 20),
            Text(
              _nfcResult,
              style: TextStyle(fontSize: 16),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }
}
