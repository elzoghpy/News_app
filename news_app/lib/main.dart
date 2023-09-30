// ignore_for_file: unused_local_variable, unnecessary_null_comparison, duplicate_import

import 'package:flutter/material.dart';
import 'package:news_app/layout/news_app/news_layout.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/shared/cubit_share/cubit.dart';
import 'package:news_app/shared/cubit_share/states.dart';
import 'package:news_app/shared/network/local/cashe_helper.dart';
import 'package:news_app/shared/network/remote/di0_helper.dart';

import 'layout/news_app/cubit.dart';
import 'shared/components/conestants.dart';
// ignore: unused_import
import 'dart:io';

import 'shared/styles/themes.dart';

void main() async {
  //ali
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  DioHelper.init();
  await CasheHelper.Init();
  bool isDark = CasheHelper.getData(key: 'isDark');
  Widget widget;

  uid = CasheHelper.getData(key: 'uid');

  if (uid != null) {
    widget = NewsLayout();
  } else {
    widget = NewsLayout();
  }
  runApp(MyApp(
    isDark: isDark,
    startWidget: widget,
  ));
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  final bool isDark;
  final Widget startWidget;
  const MyApp({required this.isDark, required this.startWidget});
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => NewsCubit()
            ..getBuisness()
            ..getScience()
            ..getSports(),
        ),
        BlocProvider(
          create: (context) => AppCubit()
            ..ChangeAppMode(
              formshared: isDark,
            ),
        ),
      ],
      child: BlocConsumer<AppCubit, AppStates>(
        listener: (context, state) {},
        builder: (context, state) {
          return MaterialApp(
            debugShowCheckedModeBanner: false,
            theme: lightTheme,
            darkTheme: darkTheme,
            themeMode:
                AppCubit.get(context).isDark ? ThemeMode.dark : ThemeMode.light,
            home: startWidget,
          );
        },
      ),
    );
  }
}


//             ./gradlew signingReport

