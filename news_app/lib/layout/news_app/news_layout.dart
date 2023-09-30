// ignore_for_file: prefer_const_constructors, use_key_in_widget_constructors, unused_label, avoid_types_as_parameter_names, non_constant_identifier_names

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/layout/news_app/cubit.dart';
import 'package:news_app/layout/news_app/stats.dart';
import 'package:news_app/shared/components/components.dart';
import 'package:news_app/shared/cubit_share/cubit.dart';

import '../../modules/news_app/search_screen/search_screen.dart';

class NewsLayout extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<NewsCubit, NewsStates>(
      listener: (context, state) {},
      builder: (context, state) {
        var cubit = NewsCubit.get(context);
        return Scaffold(
          appBar: AppBar(
            title: Text('News App'),
            actions: [
              IconButton(
                onPressed: () {
                  NavigateTo(context, SearchScreen());
                },
                icon: Icon(Icons.search),
              ),
              SizedBox(
                width: 20.0,
              ),
              IconButton(
                icon: Icon(Icons.brightness_2_outlined),
                onPressed: () {
                  AppCubit.get(context).ChangeAppMode();
                },
              ),
            ],
          ),
          body: cubit.screens[cubit.curntindex],
          bottomNavigationBar: BottomNavigationBar(
              currentIndex: cubit.curntindex,
              onTap: (index) {
                cubit.changeBottomNavBar(index);
              },
              items: cubit.bottomitems),
        );
      },
    );
  }
}
