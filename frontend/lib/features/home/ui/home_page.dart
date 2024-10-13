import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fundflow/features/home/bloc/bank_bloc.dart';
import 'package:fundflow/features/home/bloc/expense_bloc.dart';
import 'package:fundflow/features/home/bloc/profile_bloc.dart';
import 'package:fundflow/features/home/repository/bank_repository.dart';
import 'package:fundflow/features/home/repository/expense_repository.dart';
import 'package:fundflow/features/home/repository/profile_repository.dart';
import 'package:fundflow/features/home/ui/bank_section.dart';
import 'package:fundflow/features/home/ui/expense_section.dart';
import 'package:fundflow/features/home/ui/profile_section.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) =>
              BankBloc(bankRepository: context.read<BankRepository>())
                ..add(LoadBanks()),
        ),
        BlocProvider(
          create: (context) =>
              ExpenseBloc(expenseRepository: context.read<ExpenseRepository>())
                ..add(LoadExpenses()),
        ),
        BlocProvider(
          create: (context) =>
              ProfileBloc(profileRepository: context.read<ProfileRepository>())
                ..add(LoadProfile()),
        ),
      ],
      child: Scaffold(
        backgroundColor: Colors.white, // Set the page background to white
        appBar: AppBar(
          title: const Text('FundFlow Home'), // The Poppins font is now applied
          backgroundColor: Colors.transparent,
          elevation: 0,
          actions: [
            IconButton(
              icon: const Icon(Icons.notifications,
                  color: Colors.black), // Set icon color to black
              onPressed: () {},
            ),
            IconButton(
              icon: const Icon(Icons.settings,
                  color: Colors.black), // Set icon color to black
              onPressed: () {},
            ),
          ],
        ),
        body: SingleChildScrollView(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const ProfileSection(),
              const SizedBox(height: 20),
              const Text(
                "บัญชีธนาคาร",
                style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Colors.black), // Text now uses Poppins
              ),
              const SizedBox(height: 10),
              BankSection(),
              const SizedBox(height: 20),
              const Text(
                "ประเภทค่าใช้จ่าย",
                style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Colors.black), // Text now uses Poppins
              ),
              const SizedBox(height: 10),
              const ExpenseSection(),
            ],
          ),
        ),
      ),
    );
  }
}
