import 'package:go_router/go_router.dart';
import 'package:travel_agency/home_screen.dart';

final appRouter = GoRouter(initialLocation: "/home/0", routes: [
  GoRoute(
    path: "/home/:view",
    builder: (context, state) {
      final viewIndex = int.parse(state.pathParameters["view"] ?? "0");
      return HomeScreen(
        viewIndex: viewIndex,
      );
    },
  )
]);
