import 'package:flutter/material.dart';

class word extends StatelessWidget {
  final String? text;
  const word({super.key, required this.text});
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsetsDirectional.all(0),
      width: double.infinity,
      height: 50,
      decoration: const BoxDecoration(
          border: Border(bottom: BorderSide(color: Colors.grey, width: 1)),
          color: Color.fromARGB(255, 235, 233, 233)),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          const Icon(
            Icons.circle,
            size: 10,
            color: Colors.red,
          ),
          Text(text ?? ''),
          const Icon(Icons.arrow_right)
        ],
      ),
    );
  }
}
