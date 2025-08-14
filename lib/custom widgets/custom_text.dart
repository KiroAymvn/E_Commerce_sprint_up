
import 'package:flutter/cupertino.dart';

class CustomText extends StatelessWidget {
  const CustomText({
    super.key,
    required this.text,
    required this.color,
    this.align = AlignmentDirectional.center,
    required this.size,
  });
  final String text;
  final Color color;
  final AlignmentDirectional align;
  final double size;

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: align,
      child: Text(
        text,
        maxLines: 3,
        overflow: TextOverflow.ellipsis,
        style: TextStyle(

            fontFamily: "Suwannaphum",
            color: color, fontSize: size,overflow: TextOverflow.ellipsis),
      ),
    );
  }
}
