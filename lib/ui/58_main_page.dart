import 'package:belajar_flutter/bloc/58_post_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '54_post_item.dart';

class MainPage extends StatefulWidget {
  const MainPage({Key key}) : super(key: key);

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  ScrollController scrollController = ScrollController();
  PostBloc postBloc;

  void onScroll() {
    double maxScroll = scrollController.position.maxScrollExtent;
    double currentScroll = scrollController.position.pixels;

    if (currentScroll == maxScroll) {
      postBloc.add(PostEvent());
    }
  }

  @override
  Widget build(BuildContext context) {
    postBloc = BlocProvider.of<PostBloc>(context);
    scrollController.addListener(onScroll);

    return Scaffold(
      appBar: AppBar(
        title: const Text("58. Infinite (Auto Loading) List with BLoC"),
      ),
      body: Container(
        margin: const EdgeInsets.only(
          left: 20,
          right: 20,
        ),
        child: BlocBuilder<PostBloc, PostState>(
          builder: (context, state) {
            if (state is PostUnitialized) {
              return const Center(
                child: SizedBox(
                  width: 30,
                  height: 30,
                  child: CircularProgressIndicator(),
                ),
              );
            } else {
              PostLoaded postLoaded = state as PostLoaded;
              return ListView.builder(
                controller: scrollController,
                itemCount: (postLoaded.hasReachedMax)
                    ? postLoaded.posts.length
                    : postLoaded.posts.length + 1,
                itemBuilder: (context, index) {
                  return (index < postLoaded.posts.length)
                      ? PostItem(postLoaded.posts[index])
                      : const Center(
                          child: SizedBox(
                            width: 30,
                            height: 30,
                            child: CircularProgressIndicator(),
                          ),
                        );
                },
              );
            }
          },
        ),
      ),
    );
  }
}
