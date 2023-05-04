import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:trevalapp2/services/place_data_service.dart';

import '../constants/strings/images.dart';
import '../constants/strings/strings.dart';
import '../models/place.dart';

class DetailPage extends ConsumerStatefulWidget {
  final int id;

  const DetailPage({Key? key, required this.id}) : super(key: key);

  @override
  ConsumerState<DetailPage> createState() => _DetailPageState();
}

class _DetailPageState extends ConsumerState<DetailPage> {
  late FutureProvider<Place> placeProvider;

  @override
  void initState() {
    placeProvider = FutureProvider((ref) async {
      return ref.read(placeDataProvider).getPlace(widget.id);
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    AsyncValue<Place> place = ref.watch(placeProvider);


    return Scaffold(
      appBar: AppBar(
        title: Hero(
          tag: "name${widget.id}",
          child: Text(place.when(
            data: (data) => data.name,
            loading: () => "Loading",
            error: (error, stack) => "Error",
          )),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding:
              const EdgeInsets.symmetric(vertical: 5.0, horizontal: 15.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Row(
                    children: <Widget>[
                      Spacer(),
                      IconButton(onPressed: () {}, icon: const Icon(Icons.menu)),
                      const SizedBox(height: 10.0),
                    ],
                  ),
                ],
              ),
            ),
            Divider(),
            Padding(
                padding: const EdgeInsets.all(10.0),
                child: Container(
                  height: MediaQuery.of(context).size.height * 0.4,
                  child: place.when(
                      data: (data) {
                        return Image.network(
                          data.imageURL ?? Images.errorImage,
                          errorBuilder: (context, error, stackTrace) {
                            return Image.network(
                              Images.errorImage,
                              fit: BoxFit.cover,
                            );
                          },
                          fit: BoxFit.cover,
                        );
                      },
                      error: (error, stackTrace) {
                        return Image.network(
                          Images.errorImage,
                          fit: BoxFit.cover,
                        );
                      },
                      loading: () =>
                      const Center(child: CircularProgressIndicator())),
                )),
            Divider(),
            Row(
              children: [
                Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        place.when(
                            data: (data) => data.name,
                            error: (error, stackTrace) => error.toString(),
                            loading: () => "Loading"),
                        style: const TextStyle(
                          fontSize: 20.0,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(8.0, 0, 8.0, 8.0),
                      child: Text(
                        "${place.when(data: (data) => data.city, error: (error, stackTrace) => error.toString(), loading: () => "Loading")}",
                        style: const TextStyle(fontSize: 16.0),
                      ),
                    ),
                    Padding(padding: const EdgeInsets.all(8.0),
                      child: Text(
                        place.when(data: (data) => data.description ?? "", error: (error, stackTrace) => error.toString(), loading: () => "Loading"),
                        style: const TextStyle(fontSize: 16.0),
                      ),
                    ),

                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}