import 'package:cruz_roja/global/theme/theme.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class DrawTriangleShape extends CustomPainter {
  final double direction;
  Paint painter;

  DrawTriangleShape(this.direction) {
    painter = Paint()
      ..color = AppColors.red
      ..style = PaintingStyle.fill;
  }

  @override
  void paint(Canvas canvas, Size size) {
    var path = Path();

    path.moveTo(0, 0);
    path.lineTo(direction, size.height / 2);
    path.lineTo(0, size.width);
    // path.close();

    canvas.drawPath(path, painter);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return false;
  }
}

class TriangleButton extends StatelessWidget {
  final VoidCallback onTap;
  final double height;
  final double width;
  final double direction;
  const TriangleButton(
      {Key key, this.onTap, this.height, this.width, this.direction})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: RawMaterialButton(
        onPressed: onTap,
        child: CustomPaint(
          painter: DrawTriangleShape(direction ?? 5.0.h),
          child: Container(
            height: height ?? 5.0.h,
            width: width ?? 5.0.h,
          ),
        ),
      ),
    );
  }
}
