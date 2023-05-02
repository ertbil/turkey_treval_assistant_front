import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:trevalapp2/components/place_card.dart';

class CustomListView extends ConsumerWidget {
  CustomListView(this.listProvider, {Key? key}) : super(key: key);

  FutureProvider<List<dynamic>> listProvider;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    AsyncValue<List<dynamic>> accounts = ref.watch(listProvider);

    return RefreshIndicator(
      onRefresh: () async {
        accounts = ref.refresh(listProvider);
      },
      child: accounts.when(
        data: (data) => ListView(

          children: data
              .map(
                (place) => Column(
              children: [
                PlaceCard(
                  place: place,
                ),

              ],
            ),
          )
              .toList(),
        ),
        loading: () => const Center(child: CircularProgressIndicator()),
        error: (error, stack) {
          debugPrint(error.toString()+stack.toString());
          return Text(error.toString());
        },
      ),
    );
  }
}