import 'package:flutter/material.dart';
import 'package:refresh_example/my_refresh_service.dart';

class MyRefresh extends StatelessWidget {

  final MyRefreshService service;

  MyRefresh(this.service);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: RefreshIndicator(
        onRefresh: () {
          service.refresh();
          return Future.value();
        },
        child: ListView(
          children: [
            Text('Hello', key: Key('my_text'),)
          ],
        ),
      ),
    );
  }
}
