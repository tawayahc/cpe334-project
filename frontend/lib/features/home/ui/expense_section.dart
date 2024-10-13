import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fundflow/features/home/bloc/expense_bloc.dart';
import 'package:fundflow/features/home/models/expense.dart';

class ExpenseSection extends StatelessWidget {
  const ExpenseSection({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ExpenseBloc, ExpenseState>(
      builder: (context, state) {
        if (state is ExpensesLoading) {
          return const CircularProgressIndicator();
        } else if (state is ExpensesLoaded) {
          return Column(
            children: [
              CashBox(cashBox: state.cashBox),
              const SizedBox(height: 10),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: state.expenses.map((expense) {
                  return ExpenseCard(expense: expense);
                }).toList(),
              ),
            ],
          );
        } else {
          return const Text('Error loading expenses');
        }
      },
    );
  }
}

class CashBox extends StatelessWidget {
  final double cashBox;

  const CashBox({super.key, required this.cashBox});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        color: Colors.grey.withOpacity(0.1),
        border: Border.all(color: Colors.grey),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'แคชบ๊อกซ์',
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.normal,
              color: Colors.black, // Set font color to black
            ),
          ),
          const SizedBox(height: 10),
          Text(
            '฿ ${cashBox.toStringAsFixed(2)}',
            style: const TextStyle(
              fontWeight: FontWeight.normal,
              color: Colors.black, // Set font color to black
            ),
          ),
        ],
      ),
    );
  }
}

class ExpenseCard extends StatelessWidget {
  final Expense expense;

  const ExpenseCard({super.key, required this.expense});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 100,
      padding: const EdgeInsets.all(8),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        color: expense.color.withOpacity(0.1),
        border: Border.all(color: expense.color),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            expense.category,
            style: TextStyle(
              color: expense.color,
            ),
          ),
          const SizedBox(height: 10),
          Text(
            '฿ ${expense.amount.toStringAsFixed(2)}',
            style: const TextStyle(
              fontWeight: FontWeight.normal,
              color: Colors.black, // Set font color to black
            ),
          ),
        ],
      ),
    );
  }
}
