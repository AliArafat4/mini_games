import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mini_games/bloc/check_win_bloc/check_win_cubit.dart';
import 'package:mini_games/bloc/selectedShapeCubit/selected_shape_cubit.dart';
import 'package:mini_games/screens/home/home_Screen.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ResponsiveSizer(builder: (context, orientation, screenType) {
      return MultiBlocProvider(
        providers: [
          BlocProvider(create: (context) => SelectedShapeCubit()),
          BlocProvider(create: (context) => CheckWinCubit()),
        ],
        child: const MaterialApp(
          debugShowCheckedModeBanner: false,
          home: Scaffold(body: HomeScreen()),
        ),
      );
    });
  }
}
