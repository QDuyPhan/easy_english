import 'package:easy_english/core/config/app_color.dart';
import 'package:easy_english/core/navigation/route_paths.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    final textTheme = Theme.of(context).textTheme;
    final height = MediaQuery.of(context).size.height;
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Container(
              height: height * 0.2,
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [AppColor.primary40, AppColor.primary60],
                  stops: [0.0, 0.7],
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                ),
              ),
            ),
            Expanded(
              child: Container(
                decoration: BoxDecoration(color: AppColor.black0),
              ),
            ),
            // FloatingActionButton(onPressed: () {
            //   context.push(RoutePaths.vocabulary);
            // }),
          ],
        ),
      ),
    );
  }
}
