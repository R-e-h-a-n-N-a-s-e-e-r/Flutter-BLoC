import 'package:equatable/equatable.dart';
import 'package:flutter_bloc_practice/Models/favourite_list_model.dart';

abstract class PickFavouriteEvent extends Equatable {
  const PickFavouriteEvent();

  @override
  List<Object?> get props => [];
}

class FetchFavouriteList extends PickFavouriteEvent {}

class PickFavouriteItem extends PickFavouriteEvent {
  final FavouriteListModel item;

  const PickFavouriteItem({required this.item});

  @override
  // TODO: implement props
  List<Object?> get props => [item];
}

class SelectFavouriteItem extends PickFavouriteEvent {
  final FavouriteListModel item;

  const SelectFavouriteItem({required this.item});

  @override
  // TODO: implement props
  List<Object?> get props => [item];
}

class UnSelectFavouriteItem extends PickFavouriteEvent {
  final FavouriteListModel item;

  const UnSelectFavouriteItem({required this.item});

  @override
  // TODO: implement props
  List<Object?> get props => [item];
}

class DeleteSelectedItem extends PickFavouriteEvent {
  const DeleteSelectedItem();
}
