import 'package:flutter/material.dart';
import 'package:trevalapp2/components/buttons/fav_button.dart';
import 'package:trevalapp2/components/buttons/menu_button.dart';
import 'package:trevalapp2/components/buttons/share_button.dart';
import 'package:trevalapp2/models/place.dart';

import '../constants/strings/images.dart';

class PlaceCard extends StatelessWidget {
  const PlaceCard({Key? key, required this.place}) : super(key: key);
  final Place place;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.pushNamed(context, "/detail", arguments: place.id);
      },
      child: Card(
          elevation: 5,
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0)),
          margin: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 15.0),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.symmetric(
                      vertical: 5.0, horizontal: 15.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Row(
                        children: const <Widget>[
                          Spacer(),
                          MenuButton(),
                          SizedBox(height: 10.0),
                        ],
                      ),
                    ],
                  ),
                ),
                const Divider(),
                Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: SizedBox(
                      height: MediaQuery.of(context).size.height*0.4,
                      child: Image.network(place.imageURL?? Images.errorImage, errorBuilder: (context, error, stackTrace) {
                        return Image.network(Images.errorImage);
                      },
                      fit: BoxFit.cover,
                      ),
                    )
                ),
                const Divider(),
                Row(
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Hero(
                          tag: "name${place.id}",
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text(
                              place.name,
                              style: const TextStyle(
                                fontSize: 20.0,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.fromLTRB(8.0, 0, 8.0, 8.0),
                          child: Text(
                            "${place.city}",
                            style: const TextStyle(fontSize: 16.0),
                          ),
                        ),
                      ],
                    ),
                    const Spacer(),
                    FavButton(),
                    ShareButton(),
                  ],
                )
              ],
            ),
          )),
    );
  }
}
