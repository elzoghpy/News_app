// ignore_for_file: prefer_const_constructors, use_key_in_widget_constructors, prefer_is_empty, import_of_legacy_library_into_null_safe

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../layout/news_app/cubit.dart';
import '../../../layout/news_app/stats.dart';
import '../../../shared/components/components.dart';

class ScienceScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<NewsCubit, NewsStates>(
      listener: (context, state) {},
      builder: (context, state) {
        var list = NewsCubit.get(context).science;
        return articalBuilder(list, context);
      },
    );
  }
}
