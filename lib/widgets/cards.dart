import 'package:flutter/material.dart';
import 'package:vertical_card_pager/vertical_card_pager.dart';
class VerticalCard4 extends StatefulWidget {
  const VerticalCard4({Key? key}) : super(key: key);
  @override
  _VerticalCard4State createState() => _VerticalCard4State();
}
class _VerticalCard4State extends State<VerticalCard4> {
  @override
  Widget build(BuildContext context) {
    final List<String> titles = [
      "RED",
      "YELLOW",
      "BROWN",
      "CYAN",
      "BLUE",
      "GREY",
    ];
    final List<Widget> images = [
      Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20.0),
        ),
        color: Colors.red,
      ),
      Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20.0),
        ),
        color: Colors.yellow,
      ),
      Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20.0),
        ),
        color: Colors.brown,
      ),
      Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20.0),
        ),
        color: Colors.cyan,
      ),
      Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20.0),
        ),
        color: Colors.blue,
      ),
      Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20.0),
        ),
        color: Colors.grey,
      ),
    ];
    return VerticalCardPager(
          textStyle: const TextStyle(
              color: Colors.white, fontWeight: FontWeight.bold),
          titles: titles,
          images: images,
          onSelectedItem: (index) {},
        );}}