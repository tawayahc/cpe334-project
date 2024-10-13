import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fundflow/features/home/models/bank.dart';
import 'package:fundflow/features/home/repository/bank_repository.dart';

// Bank Event
abstract class BankEvent {}

class LoadBanks extends BankEvent {}

// Bank State
abstract class BankState {}

class BanksLoading extends BankState {}

class BanksLoaded extends BankState {
  final List<Bank> banks;

  BanksLoaded(this.banks);
}

class BankError extends BankState {
  final String message;

  BankError(this.message);
}

// Bank Bloc
class BankBloc extends Bloc<BankEvent, BankState> {
  final BankRepository bankRepository;

  BankBloc({required this.bankRepository}) : super(BanksLoading()) {
    // Registering the handler for LoadBanks event
    on<LoadBanks>((event, emit) async {
      emit(BanksLoading());
      try {
        final banks = await bankRepository.getBanks();
        emit(BanksLoaded(banks));
      } catch (error) {
        emit(BankError("Failed to load banks"));
      }
    });
  }
}
