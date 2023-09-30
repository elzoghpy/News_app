// ignore_for_file: non_constant_identifier_names

abstract class NewsStates {}

class NewsIntialState extends NewsStates {}

class NewsBottomNavState extends NewsStates {}

class NewsGetBusinessLodingState extends NewsStates {}

class NewsBusinessSuccessState extends NewsStates {}

class NewsBusinessErorrState extends NewsStates {
  final String erorr;

  NewsBusinessErorrState(this.erorr);
}

class NewsGetSportsLodingState extends NewsStates {}

class NewsSportsSuccessState extends NewsStates {}

class NewsSportsErorrState extends NewsStates {
  final String erorr;

  NewsSportsErorrState(this.erorr);
}

class NewsGetScienceLodingState extends NewsStates {}

class NewsScienceSuccessState extends NewsStates {}

class NewsScienceErorrState extends NewsStates {
  final String erorr;

  NewsScienceErorrState(this.erorr);
}

class NewsGetHealthLodingState extends NewsStates {}

class NewsHealthSuccessState extends NewsStates {}

class NewsHealthErorrState extends NewsStates {
  final String erorr;

  NewsHealthErorrState(this.erorr);
}

class NewsGetSearchLodingState extends NewsStates {}

class NewsSearchSuccessState extends NewsStates {}

class NewsSearchErorrState extends NewsStates {
  final String erorr;

  NewsSearchErorrState(this.erorr);
}
