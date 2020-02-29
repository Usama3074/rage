import 'package:flutter/material.dart';
import 'package:vector_math/vector_math_64.dart' show Vector3;

class ImageCrop extends StatefulWidget {
  @override
  _ImageCropState createState() => _ImageCropState();
}

class _ImageCropState extends State<ImageCrop> {
  double _scale = 1.0;
  double _previousScale = 1.0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Crop Image'),
      ),
      body: Column(
        children: <Widget>[
          Expanded(
            child: CustomPaint(
              foregroundPainter: CropPainter(),
              child: GestureDetector(
                onScaleStart: (ScaleStartDetails details) {
                  print(details);
                  _previousScale = _scale;
                  setState(() {});
                },
                onScaleUpdate: (ScaleUpdateDetails details) {
                  print(details);
                  _scale = _previousScale * details.scale;
                  setState(() {});
                },
                onScaleEnd: (ScaleEndDetails details) {
                  print(details);

                  _previousScale = _scale;
                  setState(() {});
                },
                child: RotatedBox(
                  quarterTurns: 0,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Transform(
                        alignment: FractionalOffset.center,
                        transform:
                            Matrix4.diagonal3(Vector3(_scale, _scale, _scale)),
                        child: Container(
                          decoration: BoxDecoration(
                              image: DecorationImage(
                                  image:
                                      AssetImage('assets/images/skiing.jpg'))),
                        )),
                  ),
                ),
              ),
            ),
          ),
          Container(
            height: 120,
            padding: EdgeInsets.only(left: 20, right: 20),
            color: Colors.grey[200],
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: <Widget>[
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Column(
                      children: <Widget>[
                        Icon(Icons.image, size: 30),
                        Text('Change Image'),
                      ],
                    ),
                    Column(
                      children: <Widget>[
                        Icon(Icons.refresh, size: 30),
                        Text('Rotate 90'),
                      ],
                    ),
                    Column(
                      children: <Widget>[
                        Icon(Icons.rounded_corner, size: 30),
                        Text('Reset  '),
                      ],
                    ),
                    Column(
                      children: <Widget>[
                        Icon(Icons.zoom_in, size: 30),
                        Text('Zoom in'),
                      ],
                    ),
                    Column(
                      children: <Widget>[
                        Icon(Icons.zoom_out, size: 30),
                        Text('Zoom out'),
                      ],
                    ),
                  ],
                ),
                Container(
                  margin: EdgeInsets.only(left: 40, right: 40),
                  height: 30,
                  width: double.infinity,
                  decoration: BoxDecoration(
                      color: Colors.blueAccent,
                      borderRadius: BorderRadius.circular(20)),
                  child: RaisedButton(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20)),
                    onPressed: null,
                    child: Text('Save'),
                  ),
                ),
              ],
            ),
          )
        ],
      ),

      /*  Container(
            color: Colors.grey.withOpacity(.5),
            alignment: Alignment.center,
            child: Container(
              margin: EdgeInsets.all(30),
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                border: Border.all(color: Colors.red),
              ),

            ),
          ), */
    );
  }
}

class CropPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final path1 = Path();
    path1.addPolygon([
      Offset(0, 0),
      Offset(size.width, 0),
      Offset(size.width, size.height),
      Offset(0, size.height)
    ], true);

    final path2 = Path();
    path2.addOval(Rect.fromCircle(
        center: Offset(size.width / 2, size.height / 2), radius: 110));

    final operation = PathOperation.difference;

    final path = Path.combine(operation, path1, path2);

    final paint = Paint()
      ..color = Colors.white.withOpacity(.5)
      ..style = PaintingStyle.fill;
    final squarePaint = Paint()
      ..color = Color(0xFF0099FF)
      ..style = PaintingStyle.fill
      ..strokeWidth = 2;

    canvas.drawPath(path, paint);
    canvas.drawLine(Offset(size.width / 4.6, size.height / 3.2),
        Offset(size.width / 1.3, size.height / 3.2), squarePaint);
    canvas.drawLine(Offset(size.width / 1.3, size.height / 3.2),
        Offset(size.width / 1.3, size.height / 1.45), squarePaint);
    canvas.drawLine(Offset(size.width / 4.6, size.height / 1.45),
        Offset(size.width / 1.3, size.height / 1.45), squarePaint);
    canvas.drawLine(Offset(size.width / 4.6, size.height / 1.45),
        Offset(size.width / 4.6, size.height / 3.2), squarePaint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return false;
  }
}
