import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:provider/provider.dart';
import 'features/auth/provider/auth_provider.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'features/auth/auth_routes.dart';
import 'features/auth/view/login_screen.dart';
import 'features/dashboard/view/dashboard_screen.dart';
import 'features/dashboard/dashboard_routes.dart';


void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const ExpenseManagerApp());
}

class ExpenseManagerApp extends StatelessWidget {
  const ExpenseManagerApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => AuthProvider()),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Expense Manager',
        theme: ThemeData(
          primarySwatch: Colors.purple,
          scaffoldBackgroundColor: Colors.grey[100],
        ),
        home: const AuthWrapper(),
        routes: {
          ...AuthRoutes.routes,
          ...DashboardRoutes.routes,
        },
      ),
    );
  }
}

class AuthWrapper extends StatelessWidget {
  const AuthWrapper({super.key});

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<User?>(
      stream: FirebaseAuth.instance.authStateChanges(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Scaffold(
            body: Center(
              child: CircularProgressIndicator(),
            ),
          );
        }
        if (snapshot.hasData) {
          return const DashboardScreen();
        }
        return const LoginScreen();
      },
    );
  }
}
