abstract class NavigationState {}
class  Navigatehome extends NavigationState{}
class NavigationDetail extends NavigationState {
  final int topicIndex;
  NavigationDetail(this.topicIndex);
}