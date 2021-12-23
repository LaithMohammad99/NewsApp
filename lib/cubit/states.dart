abstract class NewsStates{}

class NewsintialState extends NewsStates{}

class NewsBottomNavState extends NewsStates{}

class NewsGetBusnissLoadingState extends NewsStates{}

class NewsGetBusnissSuccState extends NewsStates{}

class NewsGetBusnissErorrState extends NewsStates{

   final  String error;

  NewsGetBusnissErorrState({ this.error});
}
class NewsGetSportsLoadingState extends NewsStates{}

class NewsGetSportsSuccState extends NewsStates{}

class NewsGetSportsErorrState extends NewsStates{

  final  String error;

  NewsGetSportsErorrState({ this.error});
}
class NewsGetScinceLoadingState extends NewsStates{}

class NewsGetScinceSuccState extends NewsStates{}

class NewsGetScinceErorrState extends NewsStates{

  final  String error;

  NewsGetScinceErorrState({ this.error});
}

class NewsGetHealthLoadingState extends NewsStates{}

class NewsGetHealthSuccState extends NewsStates{}

class NewsGetHealthErorrState extends NewsStates{

  final  String error;

  NewsGetHealthErorrState({ this.error});
}

class NewsGetEntertainmentLoadingState extends NewsStates{}

class NewsGetEntertainmentSuccState extends NewsStates{}

class NewsGetEntertainmentErorrState extends NewsStates{

  final  String error;

  NewsGetEntertainmentErorrState({ this.error});
}

class NewsChangeAppModeState extends NewsStates{}

class NewsGetSearchLoadingState extends NewsStates{}

class NewsGetSearchSuccState extends NewsStates{}

class NewsGetSearchErorrState extends NewsStates{

  final  String error;

  NewsGetSearchErorrState({ this.error});
}
