import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fundflow/core/widgets/custom_bottom_nav.dart';

class TestPage1 extends StatelessWidget {
  const TestPage1({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('FundFlow Home'),
      ),
      bottomNavigationBar: const CustomBottomNav(),
    );

  }
}
