// ignore_for_file: avoid_print, non_constant_identifier_names

import '../../layout/news_app/news_layout.dart';
import '../network/local/cashe_helper.dart';
import 'components.dart';

void singout(context) {
  CasheHelper.removeData(key: 'token').then((value) {
    if (value) {
      NavigateAndFinsh(context, NewsLayout());
    }
  });
}

void printFallText(String text) {
  final Pattern = RegExp('.{1,800}'); //800 is the size of each chunk
  Pattern.allMatches(text).forEach(
    (match) => print(
      match.group(0),
    ),
  );
}

String token = '';
String uid = '';
