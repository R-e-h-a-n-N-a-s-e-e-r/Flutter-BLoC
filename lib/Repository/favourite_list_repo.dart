import 'package:flutter_bloc_practice/Models/favourite_list_model.dart';

class FavouriteListRepository {
  Future<List<FavouriteListModel>> fetchFavouriteList() async {
    await Future.delayed(Duration(seconds: 3));
    return List.of(_generateList(10));
  }

  List<FavouriteListModel> _generateList(int length) {
    return List.generate(
      length,
      (index) => FavouriteListModel(id: index.toString(), value: 'Item $index'),
    );
  }
}
