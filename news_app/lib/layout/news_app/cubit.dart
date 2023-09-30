// ignore_for_file: prefer_const_constructors, duplicate_ignore, prefer_is_empty, avoid_print

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/layout/news_app/stats.dart';
import '../../modules/news_app/buisness/business_scren.dart';
import '../../modules/news_app/health/health_screen.dart';
import '../../modules/news_app/scince/science_scren.dart';
import '../../modules/news_app/sports/sports_screen.dart';
import '../../shared/network/remote/di0_helper.dart';

class NewsCubit extends Cubit<NewsStates> {
  NewsCubit() : super(NewsIntialState());
  static NewsCubit get(context) => BlocProvider.of(context);

  List<BottomNavigationBarItem> bottomitems = [
    // ignore: prefer_const_constructors
    BottomNavigationBarItem(
      icon: Icon(Icons.business),
      label: 'Business',
    ),
    BottomNavigationBarItem(
      icon: Icon(Icons.sports),
      label: 'sports',
    ),
    BottomNavigationBarItem(
      icon: Icon(Icons.science),
      label: 'Science',
    ),
    // ignore: prefer_const_constructors
    BottomNavigationBarItem(
      icon: Icon(Icons.health_and_safety),
      label: 'Health',
    ),
  ];
  int curntindex = 0;

  List<Widget> screens = [
    BusinessScreen(),
    SportsScreen(),
    ScienceScreen(),
    HealthScreen(),
  ];

  void changeBottomNavBar(int index) {
    curntindex = index;
    if (index == 1) getSports();
    if (index == 2) getScience();
    if (index == 3) gethealth();

    emit(NewsBottomNavState());
  }

  List<dynamic> business = [];
  void getBuisness() {
    emit(NewsGetBusinessLodingState());
    DioHelper.getData(
      url: 'v2/top-headlines',
      query: {
        'country': 'eg',
        'category': 'business',
        'apiKey': '21605271799c4334b8d73653863f22e1'
      },
    ).then((value) {
      // print(value.data['articles'[0]['title']]);
      business = value.data['articles'];
      print(business[0]['titel']);
      emit(NewsBusinessSuccessState());
    }).catchError((erorr) {
      print(erorr.toString());
      emit(NewsBusinessErorrState(erorr.toString()));
    });
  }

  List<dynamic> sports = [];
  void getSports() {
    emit(NewsGetSportsLodingState());
    if (sports.length == 0) {
      DioHelper.getData(
        url: 'v2/top-headlines',
        query: {
          'country': 'eg',
          'category': 'Sports',
          'apiKey': '21605271799c4334b8d73653863f22e1'
        },
      ).then((value) {
        // print(value.data['articles'[0]['title']]);
        sports = value.data['articles'];
        print(sports[0]['titel']);
        emit(NewsSportsSuccessState());
      }).catchError((erorr) {
        print(erorr.toString());
        emit(NewsSportsErorrState(erorr.toString()));
      });
    } else {
      emit(NewsSportsSuccessState());
    }
  }

  List<dynamic> science = [];
  void getScience() {
    emit(NewsGetScienceLodingState());
    if (science.length == 0) {
      DioHelper.getData(
        url: 'v2/top-headlines',
        query: {
          'country': 'eg',
          'category': 'science',
          'apiKey': '21605271799c4334b8d73653863f22e1'
        },
      ).then((value) {
        // print(value.data['articles'[0]['title']]);
        science = value.data['articles'];
        print(science[0]['titel']);
        emit(NewsScienceSuccessState());
      }).catchError((erorr) {
        print(erorr.toString());
        emit(NewsScienceErorrState(erorr.toString()));
      });
    } else {
      emit(NewsScienceSuccessState());
    }
  }

  List<dynamic> health = [];
  void gethealth() {
    emit(NewsGetHealthLodingState());
    if (health.length == 0) {
      DioHelper.getData(
        url: 'v2/top-headlines',
        query: {
          'country': 'eg',
          'category': 'health',
          'apiKey': '21605271799c4334b8d73653863f22e1'
        },
      ).then((value) {
        // print(value.data['articles'[0]['title']]);
        health = value.data['articles'];
        print(health[0]['titel']);
        emit(NewsHealthSuccessState());
      }).catchError((erorr) {
        print(erorr.toString());
        emit(NewsHealthErorrState(erorr.toString()));
      });
    } else {
      emit(NewsHealthSuccessState());
    }
  }

  List<dynamic> search = [];
  void getsearch(String value) {
    emit(NewsGetSearchLodingState());
    search = [];
    DioHelper.getData(
      url: 'v2/everything',
      query: {'q': value, 'apiKey': '21605271799c4334b8d73653863f22e1'},
    ).then((value) {
      // print(value.data['articles'[0]['title']]);
      search = value.data['articles'];
      print(search[0]['titel']);
      emit(NewsSearchSuccessState());
    }).catchError((erorr) {
      print(erorr.toString());
      emit(NewsSearchErorrState(erorr.toString()));
    });
  }
}
