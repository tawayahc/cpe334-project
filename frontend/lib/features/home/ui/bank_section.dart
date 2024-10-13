import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fundflow/features/home/bloc/bank_bloc.dart';
import 'package:fundflow/features/home/ui/bank_card.dart'; // Import the BankCard here

class BankSection extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<BankBloc, BankState>(
      builder: (context, state) {
        if (state is BanksLoading) {
          return Center(child: CircularProgressIndicator());
        } else if (state is BanksLoaded) {
          return Container(
            height: 100,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: state.banks.length,
              itemBuilder: (context, index) {
                final bank = state.banks[index];
                return BankCard(bank: bank); // Use BankCard from separate file
              },
            ),
          );
        } else {
          return Center(child: Text('Error loading banks'));
        }
      },
    );
  }
}
