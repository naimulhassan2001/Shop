

import 'package:flutter/material.dart';

import '../../../utils/app_string.dart';

class HistoryScreen extends StatelessWidget {
  const HistoryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(child: Text(AppString.history),),
    );
  }
}
