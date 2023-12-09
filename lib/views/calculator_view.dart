import 'package:flutter/material.dart';

class CalculatorView extends StatelessWidget {
  const CalculatorView({super.key});

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.all(32.0),
      child: Column(
        children: [
          TextField(
            keyboardType: TextInputType.number,
            decoration: InputDecoration(
              labelText: "Input 1",
              labelStyle: TextStyle(
                  color: Color.fromARGB(255, 0, 4, 83),
                  fontWeight: FontWeight.bold),
              contentPadding: EdgeInsets.fromLTRB(
                  20, 0, 0, 0), //gives left margin to Hint/label text

              hintText: 'Enter a number',
              hintStyle: TextStyle(color: Colors.white),

              enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(color: Color.fromARGB(255, 35, 32, 32)),
                borderRadius: BorderRadius.all(Radius.circular(8.0)),
              ),
              focusedBorder: OutlineInputBorder(
                  borderSide: const BorderSide(
                    color: Colors.black,
                  ),
                  borderRadius: BorderRadius.all(Radius.circular(8.0))),
            ),
          ),
          SizedBox(height: 15),
          TextField(
            keyboardType: TextInputType.number,
            decoration: InputDecoration(
              labelText: "Input 2",
              labelStyle: TextStyle(
                  color: Color.fromARGB(255, 0, 4, 83),
                  fontWeight: FontWeight.bold),
              contentPadding: EdgeInsets.fromLTRB(
                  20, 0, 0, 0), //gives left margin to Hint/label text

              hintText: 'Enter a number',
              hintStyle: TextStyle(color: Colors.white),

              enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(color: Color.fromARGB(255, 35, 32, 32)),
                borderRadius: BorderRadius.all(Radius.circular(8.0)),
              ),
              focusedBorder: OutlineInputBorder(
                  borderSide: const BorderSide(
                    color: Colors.black,
                  ),
                  borderRadius: BorderRadius.all(Radius.circular(8.0))),
            ),
          ),
        ],
      ),
    );
  }
}
