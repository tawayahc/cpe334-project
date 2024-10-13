import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fundflow/features/home/bloc/profile_bloc.dart';

class ProfileSection extends StatelessWidget {
  const ProfileSection({super.key});

  @override
  Widget build(BuildContext context) {
    debugPrint("Building ProfileSection");
    return BlocBuilder<ProfileBloc, ProfileState>(
      builder: (context, state) {
        if (state is ProfileLoading) {
          debugPrint("Profile Loading...");
          return const Center(child: CircularProgressIndicator());
        } else if (state is ProfileLoaded) {
          debugPrint("Profile Loaded");
          return Row(
            children: [
              Container(
                width: 60,
                height: 60,
                decoration: const BoxDecoration(
                  color: Colors.grey, // Fixed inside decoration
                  shape: BoxShape.circle,
                ),
              ),
              const SizedBox(width: 10),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    '฿ ${state.totalMoney.toStringAsFixed(2)}',
                    style: const TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                      color: Colors.black, // Set font color to black
                    ),
                  ),
                  Text(
                    state.username,
                    style: const TextStyle(
                      fontSize: 16,
                      color: Colors.black, // Set font color to black
                    ),
                  ),
                ],
              ),
            ],
          );
        } else {
          debugPrint("Profile Error");
          return const Center(child: Text('Error loading profile'));
        }
      },
    );
  }
}
