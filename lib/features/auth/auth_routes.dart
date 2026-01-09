import 'view/login_screen.dart';
import 'view/signup_screen.dart';

class AuthRoutes {
  static const login = '/login';
  static const signup = '/signup';
  // static const forgot = '/forgot-password';

  static final routes = {
    login: (_) => const LoginScreen(),
    signup: (_) => const SignUpScreen(),
    // forgot: (_) => const ForgotPasswordScreen(),
  };
}
