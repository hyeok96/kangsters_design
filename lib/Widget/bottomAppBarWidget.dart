import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class BottomAppBarWidget extends StatelessWidget {
  const BottomAppBarWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BottomAppBar(
      padding: EdgeInsets.zero,
      color: const Color(0xff32334E),
      notchMargin: 0.0,
      shape: const AutomaticNotchedShape(
        RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(30)),
            side: BorderSide()),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          SvgPicture.asset("assets/navbar/ic_gridLayout.svg"),
          SvgPicture.asset("assets/navbar/ic_areaChartAlt.svg"),
          Container(
            height: 60,
            width: 60,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(50),
                gradient: const LinearGradient(colors: [
                  Color(0xffF1A1B3),
                  Color(0xfffd1493),
                ], begin: Alignment.topCenter, end: Alignment.bottomCenter)),
            child: Center(
              child: SvgPicture.asset("assets/navbar/ic_add.svg"),
            ),
          ),
          SvgPicture.asset("assets/navbar/ic_juzhong.svg"),
          SvgPicture.asset("assets/navbar/ic_user.svg"),
        ],
      ),
    );
  }
}
