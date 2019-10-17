import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Cyramza',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'Cyramza'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  Offset pos=Offset(0,0);
  List<Offset> listPos=<Offset>[];
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(),
      body: GestureDetector(
        onPanUpdate:(DragUpdateDetails details){
        setState(() {
          RenderBox box=context.findRenderObject();
          pos=box.globalToLocal(details.globalPosition);
          listPos=List.from(listPos)..add(pos);
        });
      },
      child: Container(
        child: CustomPaint(
          painter: Draw(listPos),
          child: Container(),
        ),
        ),
      ),
    );
  }
}

class Draw extends CustomPainter{

  Draw(this.listPost);
  List<Offset> listPost=<Offset>[];
  @override
  final Offset pos;
  void paint(Canvas canvas, Size size){
    final paint = Paint();
    paint.color=Colors.red;

    canvas.drawCircle(pos, 30, paint);
  }
  @override
  bool shouldRepaint(Draw old){
    return old.pos != pos;
  }
}
