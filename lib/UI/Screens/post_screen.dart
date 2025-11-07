import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc_practice/BLoC/Post/post_bloc.dart';
import 'package:flutter_bloc_practice/BLoC/Post/post_event.dart';
import 'package:flutter_bloc_practice/BLoC/Post/post_state.dart';
import 'package:flutter_bloc_practice/Utils/status.dart';

class PostScreen extends StatefulWidget {
  const PostScreen({super.key});

  @override
  State<PostScreen> createState() => _PostScreenState();
}

class _PostScreenState extends State<PostScreen> {

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    context.read<PostBloc>().add(FetchPost());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Post Screen')),
      body: BlocBuilder<PostBloc, PostState>(
        builder: (context, state) {
          switch (state.postStatus) {
            case Status.loading:
              return Center(child: CircularProgressIndicator());
            case Status.failure:
              return Text(state.message.toString());
            case Status.completed:
              return ListView.builder(
                itemCount: state.postList.length,
                itemBuilder: (context, index) {
                  return ListTile(
                    title: Text(state.postList[index].name.toString()),
                    subtitle: Text(state.postList[index].email.toString()),
                  );
                },
              );
          }
        },
      ),
    );
  }
}
