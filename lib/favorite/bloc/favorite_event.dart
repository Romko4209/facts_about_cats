abstract class FavoriteEvent {}

class FavoriteLoadEvent extends FavoriteEvent {
  FavoriteLoadEvent(this.userEmail);
  final String userEmail;
}
