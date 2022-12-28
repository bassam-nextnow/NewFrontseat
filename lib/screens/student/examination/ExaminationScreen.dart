// Flutter imports:
import 'package:flutter/material.dart';
// Project imports:
import 'package:nextschool/utils/CardItem.dart';
import 'package:nextschool/utils/CustomAppBarWidget.dart';
import 'package:nextschool/utils/FunctionsData.dart';

// ignore: must_be_immutable
class ExaminationHome extends StatefulWidget {
  var _titles;
  var _images;
  var id;

  ExaminationHome(this._titles, this._images, {this.id});

  @override
  _HomeState createState() => _HomeState(_titles, _images, sId: id);
}

class _HomeState extends State<ExaminationHome> {
  bool? isTapped;
  int? currentSelectedIndex;
  var _titles;
  var _images;
  var sId;

  _HomeState(this._titles, this._images, {this.sId});

  @override
  void initState() {
    super.initState();
    isTapped = false;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBarWidget(title: 'Result & Reports'),
      backgroundColor: Colors.white,
      body: Container(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
        child: GridView.builder(
          itemCount: _titles.length,
          gridDelegate:
              const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 3),
          itemBuilder: (context, index) {
            return CustomWidget(
              index: index,
              isSelected: currentSelectedIndex == index,
              onSelect: () {
                setState(() {
                  currentSelectedIndex = index;
                });
              },
              element: AppFunction.getExaminationDashboardPage(
                  context, _titles[index],
                  id: sId),
              headline: _titles[index],
              icon: _images[index],
            );
          },
        ),
      ),
    );
  }
}
