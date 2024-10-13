// expense_bloc.dart
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fundflow/features/home/bloc/expense/expense_event.dart';
import 'package:fundflow/features/home/bloc/expense/expense_state.dart';
import 'package:fundflow/features/home/repository/expense_repository.dart';

class ExpenseBloc extends Bloc<ExpenseEvent, ExpenseState> {
  final ExpenseRepository expenseRepository;

  ExpenseBloc({required this.expenseRepository}) : super(ExpensesLoading()) {
    // Registering the event handler
    on<LoadExpenses>((event, emit) async {
      emit(ExpensesLoading());
      try {
        final data = await expenseRepository.getExpenses();
        emit(ExpensesLoaded(
          cashBox: data['cashBox'],
          expenses: data['expenses'],
        ));
      } catch (error) {
        emit(ExpensesLoading()); // Emit an appropriate error state if needed
      }
    });
  }
}
