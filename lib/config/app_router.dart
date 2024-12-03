import 'package:go_router/go_router.dart';
import 'package:travel_agency/screens/auth/login_screen.dart';
import 'package:travel_agency/screens/auth/register_screen.dart';
import 'package:travel_agency/screens/auth/verification_screen.dart';
import 'package:travel_agency/screens/home_screen.dart';

final appRouter = GoRouter(initialLocation: "/home/0", routes: [
  GoRoute(
    path: "/home/:view",
    builder: (context, state) {
      final viewIndex = int.parse(state.pathParameters["view"] ?? "0");
      return HomeScreen(
        viewIndex: viewIndex,
      );
    },
  ),
  GoRoute(
    path: "/auth/login",
    builder: (context, state) {
      return LoginScreen();
    },
  ),
  GoRoute(
    path: "/auth/register",
    builder: (context, state) {
      return RegisterScreen();
    }
  ),
  GoRoute(
    path: "/auth/verification",
    builder: (context, state) {
      return VerificationScreen();
    }
  )
]);
