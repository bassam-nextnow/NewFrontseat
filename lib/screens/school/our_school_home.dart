// Flutter imports:
import 'package:flutter/material.dart';
// Project imports:
import 'package:nextschool/utils/CardItem.dart';
import 'package:nextschool/utils/CustomAppBarWidget.dart';
import 'package:nextschool/utils/FunctionsData.dart';

class OurSchoolHomeScreen extends StatefulWidget {
  final _titles;
  final _images;

  OurSchoolHomeScreen(this._titles, this._images);

  @override
  _HomeState createState() => _HomeState(_titles, _images);
}

class _HomeState extends State<OurSchoolHomeScreen> {
  bool? isTapped;
  int? currentSelectedIndex;
  var _titles;
  var _images;

  _HomeState(this._titles, this._images);

  @override
  void initState() {
    super.initState();
    isTapped = false;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBarWidget(
        title: 'Our School',
      ),
      backgroundColor: Colors.white,
      body: Container(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
        child: GridView.builder(
          itemCount: _titles.length,
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 3),
          itemBuilder: (context, index) {
            return CustomWidget(
              index: index,
              isSelected: currentSelectedIndex == index,
              onSelect: () {
                setState(() {
                  currentSelectedIndex = index;
                });
              },
              element:
                  AppFunction.getOurSchoolDashboard(context, _titles[index]),
              headline: _titles[index],
              icon: _images[index],
            );
          },
        ),
      ),
    );
  }
}
