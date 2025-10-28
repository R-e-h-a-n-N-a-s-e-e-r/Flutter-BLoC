import 'package:equatable/equatable.dart';
import 'package:flutter_bloc_practice/Models/favourite_list_model.dart';

enum ListStatus { loading, completed, failure }

class PickFavouriteState extends Equatable {
  final List<FavouriteListModel> favouriteListItem;
  final List<FavouriteListModel> temFavouriteListItem;
  final ListStatus listStatus;

  const PickFavouriteState({
    this.favouriteListItem = const [],
    this.temFavouriteListItem = const [],
    this.listStatus = ListStatus.loading,
  });

  PickFavouriteState copyWith({
    List<FavouriteListModel>? favouriteListItem,
    List<FavouriteListModel>? temFavouriteListItem,
    ListStatus? listStatus,
  }) {
    return PickFavouriteState(
      temFavouriteListItem: temFavouriteListItem ?? this.temFavouriteListItem,
      favouriteListItem: favouriteListItem ?? this.favouriteListItem,
      listStatus: listStatus ?? this.listStatus,
    );
  }

  @override
  // TODO: implement props
  List<Object?> get props => [
    favouriteListItem,
    listStatus,
    temFavouriteListItem,
  ];
}
