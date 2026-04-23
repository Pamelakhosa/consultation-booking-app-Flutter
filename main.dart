import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'design/app_theme.dart';
import 'providers/consultation_provider.dart';
import 'providers/user_provider.dart';
import 'screens/login_screen.dart';



void main() {
  runApp(const ConsultationApp());
}

class ConsultationApp extends StatelessWidget {
  const ConsultationApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => ConsultationProvider()),
        ChangeNotifierProvider(create: (_) => UserProvider()),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Consultation Booking',
        theme: AppTheme.lightTheme,
        home: const LoginScreen(),
      ),
    );
  }
}
