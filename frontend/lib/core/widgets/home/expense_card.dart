import 'package:flutter/material.dart';
import 'package:fundflow/features/home/models/expense.dart';

class ExpenseCard extends StatelessWidget {
  final Expense expense;

  const ExpenseCard({super.key, required this.expense});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        color: Colors.white,
        border: Border.all(color: Colors.grey.shade300),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.1),
            spreadRadius: 2,
            blurRadius: 4,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            height: 8,
            decoration: BoxDecoration(
              color: expense.color,
              borderRadius: BorderRadius.circular(4),
            ),
          ),
          const SizedBox(height: 5),
          Text(
            expense.category,
            style: const TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
              color: Colors.black,
            ),
          ),
          const SizedBox(height: 5),
          Text(
            '฿ ${expense.amount.toStringAsFixed(2)}',
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
              color: expense.color,
            ),
          ),
        ],
      ),
    );
  }
}
