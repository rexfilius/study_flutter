import 'package:nfc_manager/nfc_manager.dart';

Future<void> readNfc() async {
  bool isAvailable = await NfcManager.instance.isAvailable();
  if (!isAvailable) {
    print('NFC not available');
    return;
  }

  NfcManager.instance.startSession(
    onDiscovered: (NfcTag tag) async {
      print(tag.data); // This contains the NFC tag data
      NfcManager.instance.stopSession();
    },
  );
}

Future<void> writeNfc(String message) async {
  NfcManager.instance.startSession(
    onDiscovered: (NfcTag tag) async {
      var ndef = Ndef.from(tag);
      if (ndef == null || !ndef.isWritable) {
        print('Tag is not NDEF writable');
        NfcManager.instance.stopSession();
        return;
      }

      NdefMessage ndefMessage = NdefMessage([
        NdefRecord.createText(message),
      ]);

      try {
        await ndef.write(ndefMessage);
        print('Write successful');
      } catch (e) {
        print('Write failed: $e');
      }

      NfcManager.instance.stopSession();
    },
  );
}


