import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fundflow/features/test/ui/test_page1.dart';
import 'core/themes/app_theme.dart';
import 'features/auth/bloc/auth_bloc.dart';
import 'features/auth/bloc/auth_event.dart';
import 'features/auth/repository/auth_repository.dart';
import 'features/auth/ui/login_page.dart';
import 'features/auth/ui/registeration_page.dart';
import 'features/home/repository/bank_repository.dart';
import 'features/home/repository/expense_repository.dart';
import 'features/home/repository/profile_repository.dart';
import 'features/home/ui/home_page.dart';

class MyApp extends StatelessWidget {
  final AuthenticationRepository authenticationRepository;

  const MyApp({Key? key, required this.authenticationRepository})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiRepositoryProvider(
      providers: [
        RepositoryProvider.value(value: authenticationRepository),
        RepositoryProvider(create: (context) => BankRepository()),
        RepositoryProvider(create: (context) => ExpenseRepository()),
        RepositoryProvider(create: (context) => ProfileRepository()),
      ],
      child: BlocProvider<AuthenticationBloc>(
        create: (context) => AuthenticationBloc(
            authenticationRepository: authenticationRepository)
          ..add(AppStarted()), // Handle the authentication flow
        child: MaterialApp(
          title: 'FundFlow',
          theme: AppTheme.lightTheme, // Apply the Poppins light theme
          darkTheme: AppTheme.darkTheme, // Apply the Poppins dark theme
          themeMode: ThemeMode.system,
          home: const HomePage(), // Decide whether to show login or HomePage
          routes: {
            '/login': (context) => const LoginPage(),
            '/register': (context) => const RegistrationPage(),
            '/home': (context) => const HomePage(),
            '/test_bottomNav': (context) => const TestPage1(),
          },
          debugShowCheckedModeBanner: false,
        ),
      ),
    );
  }
}
