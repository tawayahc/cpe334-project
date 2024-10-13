import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fundflow/core/widgets/home/bank_card.dart';
import 'package:fundflow/features/home/bloc/bank_bloc.dart';

class BankSection extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<BankBloc, BankState>(
      builder: (context, state) {
        if (state is BanksLoading) {
          return Center(child: CircularProgressIndicator());
        } else if (state is BanksLoaded) {
          return Container(
            height: 105,
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
