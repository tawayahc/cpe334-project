import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fundflow/features/home/models/expense.dart';
import 'package:fundflow/features/home/repository/expense_repository.dart';

// Expense Event
abstract class ExpenseEvent {}

class LoadExpenses extends ExpenseEvent {}

// Expense State
abstract class ExpenseState {}

class ExpensesLoading extends ExpenseState {}

class ExpensesLoaded extends ExpenseState {
  final double cashBox;
  final List<Expense> expenses;

  ExpensesLoaded({required this.cashBox, required this.expenses});
}

// Expense Bloc
class ExpenseBloc extends Bloc<ExpenseEvent, ExpenseState> {
  final ExpenseRepository expenseRepository;

  ExpenseBloc({required this.expenseRepository}) : super(ExpensesLoading()) {
    // Registering the event handler
    on<LoadExpenses>((event, emit) async {
      emit(ExpensesLoading());
      try {
        // Fetch expenses and cashbox using repository
        final data = await expenseRepository.getExpenses();
        emit(ExpensesLoaded(
          cashBox: data['cashBox'],
          expenses: data['expenses'],
        ));
      } catch (error) {
        // Handle the error state here if needed
        emit(ExpensesLoading()); // Emit an appropriate error state if needed
      }
    });
  }
}
