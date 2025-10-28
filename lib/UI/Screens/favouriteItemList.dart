import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc_practice/BLoC/Pick%20Favourite/pick_favourite_bloc.dart';
import 'package:flutter_bloc_practice/BLoC/Pick%20Favourite/pick_favourite_event.dart';
import 'package:flutter_bloc_practice/BLoC/Pick%20Favourite/pick_favourite_state.dart';
import 'package:flutter_bloc_practice/Models/favourite_list_model.dart';

class FavouriteItemList extends StatefulWidget {
  const FavouriteItemList({super.key});

  @override
  State<FavouriteItemList> createState() => _FavouriteItemListState();
}

class _FavouriteItemListState extends State<FavouriteItemList> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    context.read<PickFavouriteBloc>().add(FetchFavouriteList());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          'Favourite List',
          style: TextStyle(
            fontSize: 25,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
        actions: [
          BlocBuilder<PickFavouriteBloc, PickFavouriteState>(
            builder: (context, state) {
              return Visibility(
                visible: state.temFavouriteListItem.isNotEmpty ? true : false,
                child: IconButton(
                  onPressed: () {
                    context.read<PickFavouriteBloc>().add(DeleteSelectedItem());
                  },
                  icon: Icon(Icons.delete_outline_rounded),
                ),
              );
            },
          ),
        ],
      ),
      body: BlocBuilder<PickFavouriteBloc, PickFavouriteState>(
        builder: (context, state) {
          return ListView.builder(
            itemCount: state.favouriteListItem.length,
            itemBuilder: (context, index) {
              final item = state.favouriteListItem[index];
              return Card(
                child: ListTile(
                  leading: Checkbox(
                    value: state.temFavouriteListItem.contains(item)
                        ? true
                        : false,
                    onChanged: (value) {
                      print('Check box');
                      print(state.temFavouriteListItem.toString());
                      if (value!) {
                        context.read<PickFavouriteBloc>().add(
                          SelectFavouriteItem(item: item),
                        );
                      } else {
                        context.read<PickFavouriteBloc>().add(
                          UnSelectFavouriteItem(item: item),
                        );
                      }
                    },
                  ),
                  title: Text(item.value),
                  trailing: IconButton(
                    onPressed: () {
                      FavouriteListModel itemListModel = FavouriteListModel(
                        id: item.id,
                        value: item.value,
                        isFavourite: !item.isFavourite,
                      );
                      context.read<PickFavouriteBloc>().add(
                        PickFavouriteItem(item: itemListModel),
                      );
                    },
                    icon: Icon(
                      item.isFavourite
                          ? Icons.favorite
                          : Icons.favorite_border_outlined,
                    ),
                  ),
                ),
              );
            },
          );
        },
      ),
    );
  }
}
