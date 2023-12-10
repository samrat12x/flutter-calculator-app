import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class CalculatorView extends StatefulWidget {
  CalculatorView({Key? key}) : super(key: key);

  @override
  _CalculatorViewState createState() => _CalculatorViewState();
}

class _CalculatorViewState extends State<CalculatorView> {
  // Define the custom ButtonStyle
  final numericFormatter =
      FilteringTextInputFormatter.allow(RegExp(r'^\d+\.?\d{0,2}'));

  final ButtonStyle outlineButtonStyle = OutlinedButton.styleFrom(
    foregroundColor: Colors.white,
    textStyle: const TextStyle(fontSize: 30),
    backgroundColor: Colors.black,
    minimumSize: const Size(48, 48), // Increase the size as needed
    padding: const EdgeInsets.symmetric(horizontal: 25),
    shape: const CircleBorder(),
  ).copyWith(
    side: MaterialStateProperty.resolveWith<BorderSide>(
      (Set<MaterialState> states) {
        if (states.contains(MaterialState.pressed)) {
          return const BorderSide(
            color: Color.fromARGB(255, 30, 29, 27), // Use the desired color
            width: 1,
          );
        }
        // Return a default BorderSide when not pressed
        return BorderSide.none; // or any other default BorderSide
      },
    ),
  );

  num? input1;
  num? input2;
  num? result;
  String? errorMessage1; // ie errorMesdsage1=null
  String? errorMessage2;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(32.0),
      child: Column(
        children: [
          TextField(
            onChanged: (text) {
              if (text.isNotEmpty) {
                setState(() {
                  input1 = num.parse(text);
                  errorMessage1 = null;
                });
              } else {
                setState(() {
                  input1 = null;
                  errorMessage1 = "enter a value";
                });
              }
            },
            keyboardType: TextInputType.number,
            inputFormatters: [numericFormatter], // Use the numeric formatter
            decoration: InputDecoration(
                labelText: "Input 1",
                errorText: errorMessage1,
                errorStyle: const TextStyle(color: Colors.black),
                enabledBorder: const OutlineInputBorder(
                  borderSide:
                      BorderSide(color: Color.fromARGB(255, 35, 32, 32)),
                  borderRadius: BorderRadius.all(Radius.circular(8.0)),
                )

                // ... (your existing decoration properties)
                ),
          ),
          const SizedBox(height: 15),
          TextField(
            onChanged: (text) {
              if (text.isNotEmpty) {
                setState(() {
                  input2 = num.parse(text);
                  errorMessage2 = null;
                });
              } else {
                setState(() {
                  input2 = null;
                  errorMessage2 = "please enter a value";
                });
              }
            },
            keyboardType: TextInputType.number,
            inputFormatters: [numericFormatter],
            decoration: InputDecoration(
                labelText: "Input 2",
                errorText: errorMessage2,
                errorStyle: const TextStyle(color: Colors.black),
                enabledBorder: const OutlineInputBorder(
                  borderSide:
                      BorderSide(color: Color.fromARGB(255, 35, 32, 32)),
                  borderRadius: BorderRadius.all(Radius.circular(8.0)),
                )

                // ... (your existing decoration properties)
                ),
          ),
          const SizedBox(height: 15),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              OutlinedButton(
                style: outlineButtonStyle,
                onPressed: () {
                  setState(() {
                    result = (input1 ?? 0) + (input2 ?? 0);
                  });
                },
                child: const Text('+'),
              ),
              OutlinedButton(
                style: outlineButtonStyle,
                onPressed: () {
                  setState(() {
                    result = (input1 ?? 0) - (input2 ?? 0);
                  });
                },
                child: const Text('-'),
              ),
              OutlinedButton(
                style: outlineButtonStyle,
                onPressed: () {
                  setState(() {
                    result = (input1 ?? 0) * (input2 ?? 0);
                  });
                },
                child: const Text('*'),
              ),
              OutlinedButton(
                style: outlineButtonStyle,
                onPressed: () {
                  setState(() {
                    if (input2 != 0) {
                      result = (input1 ?? 0) / (input2 ?? 0);
                    } else {
                      result = null;
                      errorMessage2 = "Cant divide by zero";
                    }
                  });
                },
                child: const Text('/'),
              ),
            ],
          ),
          const SizedBox(height: 15),
          TextField(
            showCursor: true,
            readOnly: true,
            enabled: false,
            decoration: InputDecoration(
              hintText: result == null ? 'Output Screen' : '$result',
//borders

              disabledBorder: const OutlineInputBorder(
                  borderSide: BorderSide(width: 1, color: Colors.black)),
            ),
            style: TextStyle(
              fontWeight: FontWeight.w900,
              foreground: Paint()
                ..style = PaintingStyle.fill
                ..color = Colors.black
                ..strokeWidth = 2,
              color: null,
            ),
          ),
        ],
      ),
    );
  }
}
