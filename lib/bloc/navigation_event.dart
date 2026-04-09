abstract class NavigationEvent {}
class NavigatetoDetail extends NavigationEvent{
  final int index;
  NavigatetoDetail(this.index);
}
class NavigateBack extends NavigationEvent{}