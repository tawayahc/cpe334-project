import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fundflow/features/home/repository/profile_repository.dart';

// Profile Event
abstract class ProfileEvent {}

class LoadProfile extends ProfileEvent {}

// Profile State
abstract class ProfileState {}

class ProfileLoading extends ProfileState {}

class ProfileLoaded extends ProfileState {
  final String username;
  final double totalMoney;

  ProfileLoaded({required this.username, required this.totalMoney});
}

class ProfileError extends ProfileState {
  final String message;

  ProfileError({required this.message});
}

// Profile Bloc
class ProfileBloc extends Bloc<ProfileEvent, ProfileState> {
  final ProfileRepository profileRepository;

  ProfileBloc({required this.profileRepository}) : super(ProfileLoading()) {
    on<LoadProfile>((event, emit) async {
      emit(ProfileLoading());
      try {
        // Fetch the profile from repository
        final profile = await profileRepository.getProfile();
        emit(ProfileLoaded(
          username: profile['username'],
          totalMoney: profile['totalMoney'],
        ));
      } catch (error) {
        emit(ProfileError(message: "Failed to load profile"));
      }
    });
  }
}
