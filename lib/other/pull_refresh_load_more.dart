import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class PullRefreshLoadMore extends StatefulWidget {
  static const String routeName = '/pull_refresh_load_more';
  @override
  _PullRefreshLoadMoreState createState() => _PullRefreshLoadMoreState();
}

class _PullRefreshLoadMoreState extends State<PullRefreshLoadMore> {
  final int numPerPage = 20;

  final ScrollController _scrollController = ScrollController();

  int page = 1;

  List<String> dataList = [];

  bool hasMore = true;

  final GlobalKey<RefreshIndicatorState> refreshKey =
      GlobalKey<RefreshIndicatorState>();

  @override
  void initState() {
    _scrollController.addListener(_scrollListener);
    if (dataList.length == 0) {
      pullRefresh();
    }
    super.initState();
  }

  _scrollListener() {
    if (_scrollController.position.pixels ==
        _scrollController.position.maxScrollExtent) {
      if (hasMore) {
        _onLoadMore();
      }
    }
  }

  @override
  void dispose() {
    _scrollController?.removeListener(_scrollListener);
    super.dispose();
  }

  pullRefresh() {
    Future.delayed(const Duration(seconds: 1), () {
      refreshKey.currentState?.show();
    });
  }

  Widget itemBuilder(BuildContext context, int index) {
    return dataList.length > 0
        ? ListTile(
            leading: Icon(Icons.android),
            title: Text(dataList[index]),
          )
        : null;
  }

  Future<Null> _onRefresh() async {
    page = 1;
    List<String> data = await _requestRefresh();
    if (data != null) {
      dataList.clear();
      setState(() {
        hasMore = (data != null && data.length == numPerPage);
        dataList.addAll(data);
      });
    }
    return null;
  }

  Future<List<String>> _requestRefresh() async {
    return page < 3
        ? Iterable.generate(numPerPage).map((n) {
            return (page * n).toString();
          }).toList()
        : Iterable.generate(5).map((n) {
            return (page * n).toString();
          }).toList();
  }

  Future<Null> _onLoadMore() async {
    Future.delayed(const Duration(seconds: 2), () async {
      page++;
      List<String> data = await _requestRefresh();
      if (data != null) {
        setState(() {
          hasMore = (data != null && data.length == numPerPage);
          dataList.addAll(data);
        });
      }
      return null;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Pull Refresh and Load More"),
      ),
      body: RefreshIndicator(
        key: refreshKey,
        child: ListView.builder(
          physics: const AlwaysScrollableScrollPhysics(),
          itemBuilder: (context, index) {
            if (dataList.length != 0 && index == dataList.length) {
              return _buildLoadMoreIndicator();
            } else {
              return itemBuilder(context, index);
            }
          },
          itemCount: dataList.length == 0 ? 1 : dataList.length + 1,
          controller: _scrollController,
        ),
        onRefresh: _onRefresh,
      ),
    );
  }

  Widget _buildLoadMoreIndicator() {
    Widget bottomWidget = (hasMore)
        ? Row(mainAxisAlignment: MainAxisAlignment.center, children: <Widget>[
            SpinKitWave(color: Colors.blue, size: 25.0),
            Padding(
              padding: const EdgeInsets.only(left: 8.0),
              child: Text("Loading More Data"),
            )
          ])
        : Text("No More Data");
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: Center(
        child: bottomWidget,
      ),
    );
  }
}
