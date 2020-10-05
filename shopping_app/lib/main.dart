import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shopping_app/feature/auth/auth_bloc.dart';
import 'package:shopping_app/feature/auth/login/login_screen.dart';
import 'package:shopping_app/feature/discover/bloc/discover_bloc.dart';
import 'package:shopping_app/route/route_constants.dart';
import 'package:shopping_app/route/router.dart';
import 'bloc_observer.dart';
import 'file:///D:/flutter/flutter_project/important/shopping_app/lib/feature/home/home.dart';
import 'feature/discover/ui/discover_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  Bloc.observer = SimpleBlocObserver();
  runApp(MyApp());
}


class MyApp extends StatefulWidget {

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(providers: [
      BlocProvider(create: (context) {
        return DiscoverBloc()
          ..add(LoadingDiscoverEvent());
      },)
    ],
        child: MaterialApp(
          onGenerateRoute: AppRouter.generateRoute,
          theme: ThemeData(
            primarySwatch: Colors.blue,
            visualDensity: VisualDensity.adaptivePlatformDensity,
          ),
          home: HomeScreen()
        ));
  }
}