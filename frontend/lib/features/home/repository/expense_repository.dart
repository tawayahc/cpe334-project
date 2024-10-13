import 'package:flutter/material.dart';
import 'package:fundflow/features/home/models/expense.dart';

class ExpenseRepository {
  // This function simulates fetching data from an API or a local database
  Future<Map<String, dynamic>> getExpenses() async {
    // Simulating network delay
    await Future.delayed(Duration(seconds: 1));

    // Return mock data (you can replace this with API call)
    return {
      'cashBox': 17873.82,
      'expenses': [
        Expense(category: 'ค่าอาหาร', amount: 10000.00, color: Colors.blue),
        Expense(category: 'ค่าเดินทาง', amount: 2500.00, color: Colors.red),
        Expense(category: 'ค่าของใช้', amount: 2000.00, color: Colors.orange),
      ]
    };
  }
}
