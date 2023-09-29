import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:graduation_project/modules/trip_screen/cubit/states.dart';
import 'package:graduation_project/modules/trip_screen/cubit/cubit.dart';
import 'package:graduation_project/shared/component/components.dart';
import 'package:graduation_project/shared/styles/colors.dart';
import 'package:lottie/lottie.dart';
import 'package:order_tracker/order_tracker.dart';
import 'package:timeline_tile/timeline_tile.dart';
import 'dart:developer';
import 'dart:math';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:timelines/timelines.dart';

import '../../layout/cubit/cubit.dart';
import '../../layout/states/states.dart';
import '../chatbot_screen/chatbot_screen.dart';

TextEditingController vin_num_controller = TextEditingController();
//***********************************************************************************
String? search_by_vin_number;
//***********************************************************************************
const kTileHeight = 50.0;

const completeColor = Color(0xff5e6172);
const inProgressColor = Color(0xFF15467B);
const todoColor = Color(0xffd1d2d7);


class trip_screen extends StatefulWidget {
  @override
  State<trip_screen> createState() => _trip_screenState();
}

class _trip_screenState extends State<trip_screen>{

  late int _processIndex = AppCubit.get(context).car__model!.get_car_status;
  Color getColor(int index) {
    if (index == _processIndex) {
      return inProgressColor;
    } else if (index < _processIndex) {
      return completeColor;
    } else {
      return todoColor;
    }
  }
  int currentStep = 0 ;


  @override
  Widget build(BuildContext context) {

    bool found_order= AppCubit.get(context).foundOrder;
    return BlocConsumer<AppCubit,AppStates>(
      listener: (context ,state){
      },
      builder: (context,state){
        return Scaffold(
            backgroundColor: Colors.white,
            appBar:  AppBar(
              title: const Text(
                'Trip',
              ),
              centerTitle: true,
              titleTextStyle: GoogleFonts.openSans(
                fontSize: 25,
              ),
              backgroundColor: AppColor.basecolor,
              elevation: 0,
            ),
            body: Padding(
              padding: const EdgeInsets.all(30.0),
              child: Column(
                children: [
                  defaultTextFormField(
                    controller: vin_num_controller,
                    type: TextInputType.number,
                    label: 'Vin Number',
                    onSubmit: (var value){
                      print(value);
                      search_by_vin_number = value;
                      AppCubit.get(context).searchByVinNumber(search_by_vin_number!);
                    },
                  ),
                  ConditionalBuilder(
                    condition: found_order,
                    builder: (context)=> Expanded(
                      child: Padding(
                        padding: const EdgeInsets.only(top: 15.0),
                        child: Column(
                          children: [
                            Expanded(
                              child: Timeline.tileBuilder(
                                theme: TimelineThemeData(
                                  direction: Axis.vertical,
                                  connectorTheme: ConnectorThemeData(
                                    space: 70.0,
                                    thickness: 6.0,
                                  ),
                                ),
                                builder: TimelineTileBuilder.connected(
                                  connectionDirection: ConnectionDirection.before,
                                  itemExtentBuilder: (_, __) =>
                                  MediaQuery.of(context).size.width / _processes.length,

                                  oppositeContentsBuilder: (context, index) {
                                    return Image(
                                      image: AssetImage('assets/images/trip${index + 1}.png'),
                                      color: getColor(index),
                                      height: 93  ,
                                      width: 105,
                                    );
                                  },
                                  contentsBuilder: (context, index) {
                                    return Text(
                                      _processes[index],
                                      style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        color: getColor(index),
                                      ),
                                    );
                                  },
                                  indicatorBuilder: (_, index) {
                                    var color;
                                    var child;
                                    if (index == _processIndex) {
                                      color = inProgressColor;
                                      child = Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: CircularProgressIndicator(
                                          strokeWidth: 3.0,
                                          valueColor: AlwaysStoppedAnimation(Colors.white),
                                        ),
                                      );
                                    } else if (index < _processIndex) {
                                      color = completeColor;
                                      child = Icon(
                                        Icons.check,
                                        color: Colors.white,
                                        size: 15.0,
                                      );
                                    } else {
                                      color = todoColor;
                                    }

                                    if (index <= _processIndex) {
                                      return Stack(
                                        children: [
                                          CustomPaint(
                                            size: Size(30.0, 30.0),
                                            painter: _BezierPainter(
                                              color: color,
                                              drawStart: index > 0,
                                              drawEnd: index < _processIndex,
                                            ),
                                          ),
                                          DotIndicator(
                                            size: 30.0,
                                            color: color,
                                            child: child,
                                          ),
                                        ],
                                      );
                                    } else {
                                      return Stack(
                                        children: [
                                          CustomPaint(
                                            size: Size(15.0, 15.0),
                                            painter: _BezierPainter(
                                              color: color,
                                              drawEnd: index < _processes.length - 1,
                                            ),
                                          ),
                                          OutlinedDotIndicator(
                                            borderWidth: 4.0,
                                            color: color,
                                          ),
                                        ],
                                      );
                                    }
                                  },
                                  connectorBuilder: (_, index, type) {
                                    if (index > 0) {
                                      if (index == _processIndex) {
                                        final prevColor = getColor(index - 1);
                                        final color = getColor(index);
                                        List<Color> gradientColors;
                                        if (type == ConnectorType.start) {
                                          gradientColors = [Color.lerp(prevColor, color, 0.5)!, color];
                                        } else {
                                          gradientColors = [
                                            prevColor,
                                            Color.lerp(prevColor, color, 0.5)!
                                          ];
                                        }
                                        return DecoratedLineConnector(
                                          decoration: BoxDecoration(
                                            gradient: LinearGradient(
                                              colors: gradientColors,
                                            ),
                                          ),
                                        );
                                      } else {
                                        return SolidLineConnector(
                                          color: getColor(index),
                                        );
                                      }
                                    } else {
                                      return null;
                                    }
                                  },
                                  itemCount: _processes.length,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    fallback: (context)=> Padding(
                      padding: const EdgeInsets.only(top: 136.0),
                      child: SingleChildScrollView(
                        child: Expanded(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Lottie.asset('assets/images/search.json'),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            floatingActionButton: Container(
              height: 85,
              child: FloatingActionButton(
                child: Icon(
                    AppCubit.get(context).fabIcon,
                ),
                onPressed: () {
                  setState(() {
                    //AppCubit.get(context).user_model?.email=='admin123@gmail.com'
                    if(AppCubit.get(context).isAdmin == true){
                      _processIndex = (_processIndex + 1) % _processes.length;
                      AppCubit.get(context).setCarStatus(_processIndex);
                    }
                    else{
                      navigateTo(context, chatbot_screen());
                    }
                  });
                },
                backgroundColor: inProgressColor,
              ),
            ),
          );
          fallback: (context)=>Text('Sorry');

      },
    );
  }



  //*****************************************************************

}
class _BezierPainter extends CustomPainter {
  const _BezierPainter({
    required this.color,
    this.drawStart = true,
    this.drawEnd = true,
  });

  final Color color;
  final bool drawStart;
  final bool drawEnd;

  Offset _offset(double radius, double angle) {
    return Offset(
      radius * cos(angle) + radius,
      radius * sin(angle) + radius,
    );
  }

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..style = PaintingStyle.fill
      ..color = color;

    final radius = size.width / 2;

    var angle;
    var offset1;
    var offset2;

    var path;

    if (drawStart) {
      angle = 3 * pi / 4;
      offset1 = _offset(radius, angle);
      offset2 = _offset(radius, -angle);
      path = Path()
        ..moveTo(offset1.dx, offset1.dy)
        ..quadraticBezierTo(0.0, size.height / 2, -radius,
            radius) // TODO connector start & gradient
        ..quadraticBezierTo(0.0, size.height / 2, offset2.dx, offset2.dy)
        ..close();

      canvas.drawPath(path, paint);
    }
    if (drawEnd) {
      angle = -pi / 4;
      offset1 = _offset(radius, angle);
      offset2 = _offset(radius, -angle);

      path = Path()
        ..moveTo(offset1.dx, offset1.dy)
        ..quadraticBezierTo(size.width, size.height / 2, size.width + radius,
            radius) // TODO connector end & gradient
        ..quadraticBezierTo(size.width, size.height / 2, offset2.dx, offset2.dy)
        ..close();

      canvas.drawPath(path, paint);
    }
  }

  @override
  bool shouldRepaint(_BezierPainter oldDelegate) {
    return oldDelegate.color != color ||
        oldDelegate.drawStart != drawStart ||
        oldDelegate.drawEnd != drawEnd;
  }
}

final _processes = [
  'Dispatch',
  'Uploaded',
  'Shipment Arrived',
  'Ready for Pickup',
];

