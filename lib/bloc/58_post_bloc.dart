import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:belajar_flutter/model/58_post.dart';

class PostEvent {}

abstract class PostState {}

/// dipakai untuk Intialized Data, atau Data pertama kali dipanggil, sehingga tidak null
class PostUnitialized extends PostState {}

/// dipakai ketika Data sudah berhasil diload
class PostLoaded extends PostState {
  List<Post> posts;
  bool hasReachedMax;

  /// Constructor
  PostLoaded({this.posts, this.hasReachedMax});

  PostLoaded copyWith({List<Post> posts, bool hasReachedMax}) {
    return PostLoaded(
      posts: posts ?? this.posts,
      hasReachedMax: hasReachedMax ?? this.hasReachedMax,
    );
  }
}

class PostBloc extends Bloc<PostEvent, PostState> {
  @override
  PostState get initialState => PostUnitialized();

  @override
  Stream<PostState> mapEventToState(PostEvent event) async* {
    List<Post> posts;

    /// state disini adalah currentState pada versi sebelumnya
    if (state is PostUnitialized) {
      posts = await Post.connectToAPI(0, 10);
      yield PostLoaded(posts: posts, hasReachedMax: false);
    } else {
      PostLoaded postLoaded = state as PostLoaded;
      posts = await Post.connectToAPI(postLoaded.posts.length, 10);

      yield (posts.isEmpty)
          ? postLoaded.copyWith(hasReachedMax: true)
          : PostLoaded(posts: postLoaded.posts, hasReachedMax: false);
    }
  }
}
