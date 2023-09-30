// ignore_for_file: body_might_complete_normally_nullable, must_be_immutable, use_key_in_widget_constructors

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/layout/news_app/cubit.dart';
import 'package:news_app/layout/news_app/stats.dart';
import 'package:news_app/shared/components/components.dart';

class SearchScreen extends StatelessWidget {
  var searshController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<NewsCubit, NewsStates>(
      listener: (context, state) {},
      builder: (context, state) {
        var list = NewsCubit.get(context).search;
        return Scaffold(
          appBar: AppBar(),
          body: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(15.0),
                child: defaultFormFaild(
                    controller: searshController,
                    type: TextInputType.text,
                    onchange: (value) {
                      NewsCubit.get(context).getsearch(value);
                    },
                    validate: (String? value) {
                      if (value!.isEmpty) {
                        return 'search must not be empty';
                      }
                      return null;
                    },
                    Label: 'Search',
                    prefix: Icons.search),
              ),
              Expanded(
                child: articalBuilder(
                  list,
                  context,
                  isSearch: true,
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
