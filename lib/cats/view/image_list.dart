import 'package:facts_about_cats/cats/bloc/cat_bloc.dart';
import 'package:facts_about_cats/cats/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ImagesList extends StatefulWidget {
  @override
  _ImagesListState createState() => _ImagesListState();
}

class _ImagesListState extends State<ImagesList> {
  final _scrollController = ScrollController();
  CatBloc _imageCatBloc;

  @override
  void initState() {
    super.initState();
    _scrollController.addListener(_onScroll);
    _imageCatBloc = context.read<CatBloc>();
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<CatBloc, CatState>(
      listener: (context, state) {
        if (!state.hasReachedMax && _isBottom) {
          _imageCatBloc.add(Fetched());
        }
      },
      builder: (context, state) {
        switch (state.status) {
          case CatStatus.failure:
            return const Center(child: Text('failed to fetch pictures'));
          case CatStatus.success:
            if (state.cats.isEmpty) {
              return const Center(child: Text('no pictures'));
            }
            return ListView.builder(
              itemBuilder: (BuildContext context, int index) {
                return index >= state.cats.length
                    ? BottomLoader()
                    : ListItem(
                        cat: state.cats[index],
                        routeToDetail: true,
                      );
              },
              itemCount: state.hasReachedMax
                  ? state.cats.length
                  : state.cats.length + 1,
              controller: _scrollController,
            );
          default:
            return const Center(child: CircularProgressIndicator());
        }
      },
    );
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  void _onScroll() {
    if (_isBottom) _imageCatBloc.add(Fetched());
  }

  bool get _isBottom {
    if (!_scrollController.hasClients) return false;
    final maxScroll = _scrollController.position.maxScrollExtent;
    final currentScroll = _scrollController.offset;
    return currentScroll >= (maxScroll * 0.9);
  }
}
