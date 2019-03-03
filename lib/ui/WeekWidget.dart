import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

class WeekWidget extends StatelessWidget {
  static const List<String> _WEEK_ABBR = ["MO", "TU", "WE", "TH", "FR", "SA", "SU"];

  @override
  Widget build(BuildContext context) {
    return Container(
        margin: EdgeInsets.all(20.0),
        child: StaggeredGridView.countBuilder(
          crossAxisCount: 4,
          itemCount: 7,
          itemBuilder: (BuildContext context, int index) => new Container(
              child: Card(
                  child: InkWell(
                      onTap: () {},
                      child: Center(
                        child: CircleAvatar(
                          foregroundColor: Colors.white,
                          backgroundColor: Colors.redAccent,
                          child: Text(_WEEK_ABBR[index]),
                        ),
                      )))),
          staggeredTileBuilder: (int index) =>
              new StaggeredTile.count(2, index.isEven ? 2 : 1),
          mainAxisSpacing: 4.0,
          crossAxisSpacing: 4.0,
        ));
  }
}
