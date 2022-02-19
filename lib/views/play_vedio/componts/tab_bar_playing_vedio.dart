import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class TabBarPlayingVedio extends StatelessWidget {
  const TabBarPlayingVedio({
    Key? key,
    required TabController? tabController,
  })  : _tabController = tabController,
        super(key: key);

  final TabController? _tabController;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 31,
      width: 166,
      decoration: BoxDecoration(
        color: const Color(0xff585858),
        borderRadius: BorderRadius.circular(
          15.0,
        ),
      ),
      child: TabBar(
        controller: _tabController,
        indicator: BoxDecoration(
          borderRadius: BorderRadius.circular(
            15.0,
          ),
          color: Colors.white,
        ),
        labelColor: Colors.black,
        unselectedLabelStyle: const TextStyle(
            fontFamily: "pnuR", fontSize: 9, color: Colors.white, height: 1.2),
        labelStyle: const TextStyle(
            fontFamily: "pnuR", fontSize: 9, color: Colors.white, height: 1.2),
        unselectedLabelColor: Colors.white,
        tabs: const [
          Tab(
            text: 'قيد التشغيل',
          ),
          Tab(
            text: 'التالي',
          ),
        ],
      ),
    );
  }
}