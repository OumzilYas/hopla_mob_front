import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:hopla_front_mob/config/size_config.dart';
import 'package:vector_math/vector_math_64.dart' as vector;
class ListView7 extends StatefulWidget {
  const ListView7({Key? key}) : super(key: key);
  @override
  _ListView7State createState() => _ListView7State();
}
class _ListView7State extends State<ListView7> {
  final pageController = PageController(viewportFraction: 0.8);
  double page = 0.0;
  void listenScroll() {
    setState(() {
      page = pageController.page!;
    });
  }
  @override
  void initState() {
    pageController.addListener(listenScroll);
    super.initState();
  }
  @override
  void dispose() {
    pageController.removeListener(listenScroll);
    pageController.dispose();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    double height = SizeConfig.getHeight(context);
    double width = SizeConfig.getWidth(context);
    return Center(
      child: SizedBox(
        height: height*.12,
        width: width,
        child: PageView.builder(
            controller: pageController,
            itemCount: 6,
            itemBuilder: (context, index) {
              final percent = (page - index).abs().clamp(0.0, 1.0);
              final factor = pageController.position.userScrollDirection ==
                  ScrollDirection.forward
                  ? 1.0
                  : -1.0;
              final opacity = percent.clamp(0.0, 0.7);
              return Transform(
                transform: Matrix4.identity()
                  ..setEntry(3, 2, 0.001)
                  ..rotateY(vector.radians(45 * factor * percent)),
                child: Opacity(
                  opacity: (1 - opacity),
                  child: Image.asset(
                    index.isOdd
                        ? "assets/vocher.png"
                        : "assets/vocher.png",
                    fit: BoxFit.fill,
                    height: height*.12,
                    width: width,
                  ),
                ),
              );
            }),
      ),
    );
  }
}







