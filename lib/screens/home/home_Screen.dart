import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:mini_games/extensions/size_extensions.dart';
import 'package:mini_games/methods/navigations.dart';
import 'package:mini_games/screens/tic_tac_toe/tic_tac_toe_screen.dart';
import 'package:mini_games/widgets/app_bar_widget.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import 'components/main_menu_titles.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(title: 'Select Game', hasAction: false, centered: false),
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            MainMenuTitles(
              iconWidget: const Icon(Icons.highlight_remove),
              title: "Tic-Tac-Toe",
              onPressed: () {
                myNavigation(context: context, screen: const TicTacToeScreen(), type: 'push');
              },
            ),
            SizedBox(height: context.getHeight(factor: 0.01)),
            MainMenuTitles(
              iconWidget: Padding(
                  padding: EdgeInsets.only(left: 5.5.sp),
                  child: SvgPicture.asset("assets/images/bomb.svg", height: 2.7.h, width: 2.7.w)),
              title: "Mines",
              onPressed: () {},
            ),
            SizedBox(height: context.getHeight(factor: 0.01)),
            MainMenuTitles(
              iconWidget: const Icon(Icons.directions_boat),
              title: "Ship",
              onPressed: () {},
            ),
          ],
        ),
      ),
    );
  }
}
