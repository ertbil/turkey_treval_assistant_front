import 'package:flutter/material.dart';

class FavButton extends StatefulWidget {
  const FavButton({Key? key}) : super(key: key);


  @override
  State<FavButton> createState() => _FavButtonState();
}

class _FavButtonState extends State<FavButton> {

   bool isFav = false;

  @override
  Widget build(BuildContext context) {
    return  Padding(
      padding: const EdgeInsets.fromLTRB(0.0, 0, 8.0, 8.0),
      child: IconButton(
          onPressed: () {
          setState(() {
              isFav = !isFav;
            });

          },
          icon:  Icon(
            isFav ? Icons.favorite : Icons.favorite_border,
            color: isFav ? Colors.red : Colors.grey,
            size: 36,
          )),
    );
  }
}
