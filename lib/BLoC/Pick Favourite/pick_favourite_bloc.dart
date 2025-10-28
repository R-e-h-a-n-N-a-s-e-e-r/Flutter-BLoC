import 'package:bloc/bloc.dart';
import 'package:flutter_bloc_practice/BLoC/Pick%20Favourite/pick_favourite_event.dart';
import 'package:flutter_bloc_practice/BLoC/Pick%20Favourite/pick_favourite_state.dart';
import 'package:flutter_bloc_practice/Models/favourite_list_model.dart';
import 'package:flutter_bloc_practice/Repository/favourite_list_repo.dart';

class PickFavouriteBloc extends Bloc<PickFavouriteEvent, PickFavouriteState> {
  FavouriteListRepository favouriteListRepository;
  List<FavouriteListModel> favouriteList = [];
  List<FavouriteListModel> tempFavouriteList = [];

  PickFavouriteBloc(this.favouriteListRepository)
    : super(PickFavouriteState()) {
    on<FetchFavouriteList>(fetchList);
    on<PickFavouriteItem>(pickItem);
    on<SelectFavouriteItem>(_selectFavouriteItem);
    on<UnSelectFavouriteItem>(_unSelectFavouriteItem);
    on<DeleteSelectedItem>(_deleteSelectedItem);
  }

  void fetchList(
    FetchFavouriteList event,
    Emitter<PickFavouriteState> emit,
  ) async {
    favouriteList = await favouriteListRepository.fetchFavouriteList();
    emit(
      state.copyWith(
        favouriteListItem: List.from(favouriteList),
        listStatus: ListStatus.completed,
      ),
    );
  }

  void pickItem(PickFavouriteItem event, Emitter<PickFavouriteState> emit) {
    final index = favouriteList.indexWhere(
      (element) => element.id == event.item.id,
    );
    if (event.item.isFavourite) {
      if (tempFavouriteList.contains(favouriteList[index])) {
        tempFavouriteList.remove(favouriteList[index]);
        tempFavouriteList.add(event.item);
      }
    } else {
      if (tempFavouriteList.contains(favouriteList[index])) {
        tempFavouriteList.remove(favouriteList[index]);
        tempFavouriteList.add(event.item);
      }
    }
    favouriteList[index] = event.item;
    emit(
      state.copyWith(
        favouriteListItem: List.from(favouriteList),
        temFavouriteListItem: List.from(tempFavouriteList),
      ),
    );
  }

  void _selectFavouriteItem(
    SelectFavouriteItem event,
    Emitter<PickFavouriteState> emit,
  ) {
    tempFavouriteList.add(event.item);
    emit(
      state.copyWith(
        favouriteListItem: List.from(favouriteList),
        temFavouriteListItem: List.from(tempFavouriteList),
      ),
    );
  }

  void _unSelectFavouriteItem(
    UnSelectFavouriteItem event,
    Emitter<PickFavouriteState> emit,
  ) {
    tempFavouriteList.remove(event.item);
    emit(
      state.copyWith(
        favouriteListItem: List.from(favouriteList),
        temFavouriteListItem: List.from(tempFavouriteList),
      ),
    );
  }

  void _deleteSelectedItem(
    DeleteSelectedItem event,
    Emitter<PickFavouriteState> emit,
  ) {
    for (int i = 0; i < tempFavouriteList.length; i++) {
      favouriteList.remove(tempFavouriteList[i]);
    }
    tempFavouriteList.clear();
    emit(
      state.copyWith(
        favouriteListItem: List.from(favouriteList),
        temFavouriteListItem: List.from(tempFavouriteList),
      ),
    );
  }
}
