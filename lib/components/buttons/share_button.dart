import 'package:flutter/material.dart';

class ShareButton extends StatelessWidget {
  const ShareButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  Padding(
      padding: const EdgeInsets.fromLTRB(0.0, 0, 8.0, 8.0),
      child: IconButton(
          onPressed: () {


          },
          icon: const Icon(
            Icons.share,
            size: 36,
          )),
    );
  }
}
