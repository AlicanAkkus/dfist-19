import 'package:dfist19/widgets/chip.dart';
import 'package:flutter/material.dart';

class BottomSheetItem extends StatefulWidget {

  final GestureTapCallback onPressed;
  final GestureTapCallback onResetPressed;
  final int from;
  final Function(List<String>) onSelectionChanged;
  BottomSheetItem({
    Key key,
    @required this.onPressed,
    @required this.onResetPressed,
    @required this.from,
    @required this.onSelectionChanged,
  }) : super(key: key);

  @override
  _BottomSheetItemState createState() => _BottomSheetItemState();
}

class _BottomSheetItemState extends State<BottomSheetItem> {
  @override
  Widget build(BuildContext context) {
    return         new Container(
      height: 430,
      child: new Stack(
        children: <Widget>[
          Padding(
            padding:
            const EdgeInsets.only(bottom: 24.0, top: 14.0, right: 6),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                MaterialButton(
                    child: new Text("Reset",
                        style: TextStyle(
                          fontFamily: 'RedHatDisplay',
                          color: Color(0xff333d47),
                          fontSize: 16,
                          fontWeight: FontWeight.w700,
                          fontStyle: FontStyle.normal,
                          letterSpacing: 0,
                        )),
                    onPressed: widget.onResetPressed
                ),
                Padding(
                  padding: const EdgeInsets.only(right: 30.0),
                  child: new Text(widget.from == 0 ? "Halls" : "Categories",
                      style: TextStyle(
                        fontFamily: 'RedHatDisplay',
                        color: Color(0xff333d47),
                        fontSize: 20,
                        fontWeight: FontWeight.w900,
                        fontStyle: FontStyle.normal,
                        letterSpacing: 0,
                      )),
                ),
                IconButton(
                  icon: Icon(Icons.clear,
                      color: Color(0xff333d47), size: 24),
                  onPressed: () {
                    Navigator.pop(context);
                    FocusScope.of(context).requestFocus(new FocusNode());
                  },
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 64.0),
            child: Container(
              child: new GridView.builder(
                  itemCount: widget.from == 0 ? halls.length : reportList.length,
                  gridDelegate:
                  new SliverGridDelegateWithFixedCrossAxisCount(
                      childAspectRatio: 3.5, crossAxisCount: 2),
                  itemBuilder: (BuildContext context, int index) {
                    return Padding(
                      padding:
                      const EdgeInsets.only(left: 16.0, right: 16.0),
                      child: Container(
                          child: Center(
                            child: MultiSelectChip(
                                colorList[index],
                                widget.from == 0 ? halls[index] : reportList[index],
                                onSelectionChanged: widget.onSelectionChanged
                            ),
                          )),
                    );
                  }),
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              color: Colors.white,
              height: MediaQuery.of(context).size.height / 11,
              width: MediaQuery.of(context).size.width,
              child: Padding(
                padding: const EdgeInsets.only(
                    left: 16.0, right: 16.0, bottom: 8.0),
                child: GestureDetector(
                    child: Card(
                      color: Color(0xff3196f6),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(14.0)),
                      child: Center(
                        child: new Text("Apply Filter",
                            style: TextStyle(
                              fontFamily: 'RedHatDisplay',
                              color: Color(0xffffffff),
                              fontSize: 14,
                              fontWeight: FontWeight.w900,
                              fontStyle: FontStyle.normal,
                              letterSpacing: 0,
                            )),
                      ),
                    ),
                    onTap: widget.onPressed
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }


//  (selectedList) {
//  setState(() {
//  selectedReportList.addAll(selectedList);
//  });
//  },

//  _controller.text = " ";
//  from == 0
//  ? _onFilteredByHalls(selectedReportList, context)
//      : _onFilteredByCategory(
//      selectedReportList, context);
//  selectedReportList.clear();
//  Navigator.pop(context);
//  FocusScope.of(context).requestFocus(new FocusNode());
//
//
//  selectedReportList.clear();
//  _newSessionss.clear();
//  Navigator.pop(context);
//  FocusScope.of(context).requestFocus(new FocusNode());

  List<String> reportList = [
    "Robotics & assistant",
    "Mobile Technologies",
    "Web Technologies",
    "Cloud",
    "Machine Learning",
    "Firebase",
    "Design",
  ];

  List<String> halls = [
    "Bosphorus(Uniq Hall)",
    "Galata Tower(Glass Room)",
    "Maiden's Tower",
    "Hagia Sophia",
  ];

  List<Color> colorList = [
    Color(0xff7AD7E0),
    Color(0xff84E07A),
    Color(0xffFECC92),
    Color(0xff7A9DE0),
    Color(0xffE17F7F),
    Color(0xffFECC92),
    Color(0xffE07AB3),
  ];
}
