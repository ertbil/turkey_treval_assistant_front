import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:trevalapp2/components/custom_list.dart';
import 'package:trevalapp2/repos/place_repo.dart';

import '../models/place.dart';
import '../services/place_data_service.dart';

class MainPage extends StatelessWidget {

  const MainPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {



    return  Scaffold(
      appBar: AppBar(
        title: const Text('Main Page'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
              Expanded(child: CustomListView(placeListProvider))
          ],
        )
      ),

    );
  }
}
