import 'package:flutter/material.dart';

class InputPinWidget extends StatefulWidget {
  const InputPinWidget({
    super.key,
    required this.onPinEntered,
  });

  final void Function(String) onPinEntered;

  @override
  State<StatefulWidget> createState() => _InputPinWidgetState();
}

class _InputPinWidgetState extends State<InputPinWidget> {
  final List<TextEditingController> _pinControllers =
      List.generate(4, (_) => TextEditingController());
  static const List<String> keypadValues = [
    '1',
    '2',
    '3',
    '4',
    '5',
    '6',
    '7',
    '8',
    '9',
    '',
    '0',
    'delete'
  ];

  @override
  void dispose() {
    for (var controller in _pinControllers) {
      controller.dispose();
    }
    super.dispose();
  }

  void _handleKeyPress(String value) {
    if (value == 'delete') {
      for (var i = _pinControllers.length - 1; i >= 0; i--) {
        if (_pinControllers[i].text.isNotEmpty) {
          setState(() {
            _pinControllers[i].clear();
          });
          break;
        }
      }
    } else {
      for (var i = 0; i < _pinControllers.length; i++) {
        if (_pinControllers[i].text.isEmpty) {
          setState(() {
            _pinControllers[i].text = value;
          });
          if (i == _pinControllers.length - 1) {
            // If last pin box is filled, trigger pin entered callback
            widget.onPinEntered(
                _pinControllers.map((controller) => controller.text).join());
          }
          break;
        }
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Expanded(
      //color: Colors.blueAccent,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          // Pin Input TextField
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 10.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: _pinControllers.map((controller) {
                return Container(
                  width: 76,
                  height: 48,
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    color: Colors.white12,
                    border: Border.all(color: Colors.white12),
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: TextField(
                    controller: controller,
                    keyboardType: TextInputType.number,
                    maxLength: 1,
                    obscureText: true,
                    obscuringCharacter: '*',
                    textAlign: TextAlign.center,
                    style: const TextStyle(
                      fontSize: 24,
                      color: Colors.black,
                      fontWeight: FontWeight.w500,
                    ),
                    decoration: const InputDecoration(
                      counterText: '',
                      border: InputBorder.none,
                    ),
                  ),
                );
              }).toList(),
            ),
          ),

          // Pin Input Keypad
          GridView.count(
            crossAxisCount: 3,
            shrinkWrap: true,
            //padding: const EdgeInsets.only(),
            crossAxisSpacing: 8.0,
            children: keypadValues.map((value) {
              return InkWell(
                onTap: () => _handleKeyPress(value),
                child: Container(
                  alignment: Alignment.center,
                  child: value == 'delete'
                      ? const Icon(Icons.backspace_outlined)
                      : Text(
                          value,
                          style: const TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w500,
                            color: Colors.black,
                          ),
                        ),
                ),
              );
            }).toList(),
          ),
        ],
      ),
    );
  }
}
