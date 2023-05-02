import 'package:flutter/material.dart';
import 'package:trevalapp2/models/place.dart';

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
                        children: <Widget>[
                          Spacer(),
                          IconButton(
                              onPressed: () {}, icon: const Icon(Icons.menu)),
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
                      decoration: BoxDecoration(
                        image: DecorationImage(
                          image: NetworkImage(place.imageURL ??
                              "https://www.123rf.com/photo_104672626_stock-vector-no-image-available-icon-flat-vector-no-photo-sign-/"),
                          fit: BoxFit.cover,
                        ),
                        borderRadius:
                            BorderRadius.vertical(top: Radius.circular(10.0)),
                      ),
                    )),
                Divider(),
                Row(
                  children: [
                    Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(
                            place.name,
                            style: const TextStyle(
                              fontSize: 20.0,
                              fontWeight: FontWeight.bold,
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
                    Padding(
                      padding: const EdgeInsets.fromLTRB(8.0, 0, 2.0, 8.0),
                      child: IconButton(
                          onPressed: () {},
                          icon: const Icon(
                            Icons.favorite_border,
                            size: 36,
                          )),
                    ),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(0.0, 0, 8.0, 8.0),
                      child: IconButton(
                          onPressed: () {},
                          icon: const Icon(
                            Icons.share,
                            size: 36,
                          )),
                    )
                  ],
                )
              ],
            ),
          )),
    );
  }
}
