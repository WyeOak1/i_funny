abstract class PostEvent {}
class FeaturedLoadEvent extends PostEvent {}
class FeaturedClearEvent extends PostEvent {}
class ChannelLoadEvent extends PostEvent{}
class ChangeValue extends PostEvent {
  final String id;

  ChangeValue(this.id);
}