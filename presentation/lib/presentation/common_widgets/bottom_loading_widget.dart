import 'package:flutter/material.dart';

class BottomLoadingWidget extends StatelessWidget {
  const BottomLoadingWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return const SizedBox(
      height: 70,
      child: Center(
        child: CircularProgressIndicator(),
      ),
    );
  }
}
