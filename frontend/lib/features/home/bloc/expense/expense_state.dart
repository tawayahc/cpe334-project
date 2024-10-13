// expense_state.dart
import 'package:fundflow/features/home/models/expense.dart';

abstract class ExpenseState {}

class ExpensesLoading extends ExpenseState {}

class ExpensesLoaded extends ExpenseState {
  final double cashBox;
  final List<Expense> expenses;

  ExpensesLoaded({required this.cashBox, required this.expenses});
}
