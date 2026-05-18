import 'package:base_utility/utiles/type_convert.dart';
import 'package:base_utility/widget_tool/text_widget.dart';
import 'package:expandable_widgets/expandable_widgets.dart';
import 'package:flutter/material.dart';
class ExpandTable extends StatefulWidget {
  @required int rowsCount = 0;
  int columnsCount  = 2;
  double rowWidth;
  List<ExpandTableRow>? rows;
  List<double> columnsWidths = [0.5,0.5];
  void Function()? onUpdate;
  ExpandTable({required this.rowsCount,required this.rowWidth,this.onUpdate,Key? key,this.columnsCount = 2,this.rows,required this.columnsWidths}) : super(key: key);

  @override
  _ExpandTableState createState() => _ExpandTableState();
}

class _ExpandTableState extends State<ExpandTable>{
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }
  double initX = 0;
  final minimumColumnWidth = 50.0;
  double columnWidth = 0;
  // double columnWidth = 200;
  // double initX = 0;
  // final minimumColumnWidth = 50.0;
  // final verticalScrollController = ScrollController();
  // final horizontalScrollController = ScrollController();
  // Widget _resizableColumnWidth() {
  //   return DataTable(
  //       columns: [
  //         DataColumn(
  //           label: Stack(
  //             children: [
  //               Container(
  //                 child: Text('Column 1'),
  //                 width: columnWidth,
  //                 constraints: BoxConstraints(minWidth: 100),
  //               ),
  //               Positioned(
  //                 right: 0,
  //                 child: GestureDetector(
  //                   onPanStart: (details) {
  //                     // debugPrint(details.globalPosition.dx.toString());
  //                     setState(() {
  //                       initX = details.globalPosition.dx;
  //                     });
  //                   },
  //                   onPanUpdate: (details) {
  //                     final increment = details.globalPosition.dx - initX;
  //                     // debugPrint(newWidth.toString());
  //                     final newWidth = columnWidth + increment;
  //                     setState(() {
  //                       initX = details.globalPosition.dx;
  //                       columnWidth = newWidth > minimumColumnWidth
  //                           ? newWidth
  //                           : minimumColumnWidth;
  //                     });
  //                   },
  //                   child: Container(
  //                     width: 10,
  //                     height: 10,
  //                     decoration: BoxDecoration(
  //                       color: Colors.blue.withOpacity(1),
  //                       shape: BoxShape.circle,
  //                     ),
  //                   ),
  //                 ),
  //               )
  //             ],
  //           ),
  //         ),
  //         DataColumn(label: Text("Column 2")),
  //         DataColumn(label: Text("Column 3")),
  //       ],
  //       rows: List.generate(
  //         20,
  //             (index) => DataRow(
  //           cells: [
  //             DataCell(
  //               ConstrainedBox(
  //                 constraints: BoxConstraints(maxWidth: columnWidth),
  //                 child: Text(
  //                   "Column1: Row index $index: long text 1234567890 1234567890 1234567890 1234567890",
  //                   overflow: TextOverflow.ellipsis,
  //                   maxLines: 1,
  //                   softWrap: false,
  //                 ),
  //               ),
  //             ),
  //             DataCell(Text("Column2: Row index $index")),
  //             DataCell(Text("Column3: Row index $index")),
  //           ],
  //         ),
  //       ));
  // }
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return LayoutBuilder(
        builder: (context, constraints) {
          return Column(
            children: [
              Container(
                height: 20,
                color: fromHex("ececec"),
                child: ExpandTableRow(cells: List<Widget>.generate(widget.columnsCount, (cellIndex){
                  if (cellIndex == 0) {
                    return Row(
                      children: [
                        Expanded(child: Container(
                          child: generateTextWidget(text: "字段",textSize: 12),
                        )),
                        GestureDetector(
                          onPanStart: (details) {
                            // debugPrint(details.globalPosition.dx.toString());
                            setState(() {
                              initX = details.globalPosition.dx;
                              columnWidth = widget.columnsWidths[cellIndex] * constraints.maxWidth;
                            });
                          },
                          onPanUpdate: (details) {
                            final increment = details.globalPosition.dx - initX;
                            // debugPrint(newWidth.toString());
                            final newWidth = columnWidth + increment;
                            initX = details.globalPosition.dx;
                            columnWidth = newWidth > minimumColumnWidth
                                ? newWidth
                                : minimumColumnWidth;
                            double ori = widget.columnsWidths[cellIndex];
                            widget.columnsWidths[cellIndex] = columnWidth * 1.0 / constraints.maxWidth;
                            widget.columnsWidths[cellIndex + 1] += widget.columnsWidths[cellIndex] - ori;
                            if (widget.onUpdate != null) {
                              widget.onUpdate!();
                            }
                          },
                          child: MouseRegion(
                            cursor: SystemMouseCursors.resizeColumn,
                            child: Container(
                              padding: EdgeInsets.only(left: 5,right: 0),
                              child: Container(
                                width: 2,
                                height: 20,
                                color: fromHex("bfbfbf"),
                              ),
                            ),
                          ) ,
                        )
                      ],
                    );
                  } else {
                    return Container(
                      padding: EdgeInsets.only(left: 5),
                      child: generateTextWidget(text: "值",textSize: 12),
                    );
                  }

                }) ,
                  columnWidths: widget.columnsWidths,
                ),
              ),
              Expanded(child: ListView.builder(
                itemBuilder: (context,index) {
                  ExpandTableRow row = widget.rows![index];
                  row.depth = 0;
                  return Container(
                    child: Column(
                      children: [
                        Container(
                          height: 0.5,
                          color: convertStringToColor("#d3d3d3",alpha: 0.6),
                        ),
                        row

                      ],
                    ),
                  );
                },
                itemCount: widget.rowsCount,
              ))
            ],
          ) ;

            Container(
            child: ListView.builder(
              itemBuilder: (context,index) {
                if (index == 0) {
                  return Container(
                    height: 20,
                    color: fromHex("ececec"),
                    child: ExpandTableRow(cells: List<Widget>.generate(widget.columnsCount, (cellIndex){
                      if (cellIndex == 0) {
                        return Row(
                          children: [
                            Expanded(child: Container(
                              child: generateTextWidget(text: "字段",textSize: 12),
                            )),
                            GestureDetector(
                              onPanStart: (details) {
                                // debugPrint(details.globalPosition.dx.toString());
                                setState(() {
                                  initX = details.globalPosition.dx;
                                  columnWidth = widget.columnsWidths[cellIndex] * constraints.maxWidth;
                                });
                              },
                              onPanUpdate: (details) {
                                final increment = details.globalPosition.dx - initX;
                                // debugPrint(newWidth.toString());
                                final newWidth = columnWidth + increment;
                                initX = details.globalPosition.dx;
                                columnWidth = newWidth > minimumColumnWidth
                                    ? newWidth
                                    : minimumColumnWidth;
                                double ori = widget.columnsWidths[cellIndex];
                                widget.columnsWidths[cellIndex] = columnWidth * 1.0 / constraints.maxWidth;
                                widget.columnsWidths[cellIndex + 1] += widget.columnsWidths[cellIndex] - ori;
                                if (widget.onUpdate != null) {
                                  widget.onUpdate!();
                                }
                              },
                              child: MouseRegion(
                                cursor: SystemMouseCursors.resizeColumn,
                                child: Container(
                                  padding: EdgeInsets.only(left: 5,right: 0),
                                  child: Container(
                                    width: 2,
                                    height: 20,
                                    color: fromHex("bfbfbf"),
                                  ),
                                ),
                              ) ,
                            )
                          ],
                        );
                      } else {
                        return Container(
                          padding: EdgeInsets.only(left: 5),
                          child: generateTextWidget(text: "值",textSize: 12),
                        );
                      }

                    }) ,
                      columnWidths: widget.columnsWidths,
                    ),
                  );
                } else {
                  ExpandTableRow row = widget.rows![index-1];
                  row.depth = 0;
                  return Container(
                    child: row,
                  );
                }
              },
              itemCount: widget.rowsCount + 1,
            ),
          );
        });
  }
  
}

class ExpandTableRow extends StatefulWidget{
  @required List<Widget> cells;
  List<ExpandTableRow>? childs;
  int depth = 0;
  int offset = 10;
  List<double> columnWidths;
  ExpandTableRow( {required this.cells,required this.columnWidths,super.key,this.childs,this.depth = 0});
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return ExpandTableRowState();
  }

}
class ExpandTableRowState extends State<ExpandTableRow> with TickerProviderStateMixin{
  late AnimationController _controller;
  late Duration _animationDuration;
  late Animation<double> _animation;
  final Animatable<double> _sizeTween = Tween<double>(begin: 0.0, end: 1.0);
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _animationDuration = const Duration(milliseconds: 300);
    _controller = AnimationController(vsync: this, duration: _animationDuration);
    _animation = _sizeTween.animate(CurvedAnimation(parent: _controller, curve: Curves.fastOutSlowIn));
  }
  Container _buildRotation() {
    return Container(
      alignment: Alignment.centerLeft,
      padding: EdgeInsets.zero,
      child: RotationTransition(
        turns: Tween(begin: 0.0, end: 0.25).animate(_animation),
        child:  const Icon(Icons.keyboard_arrow_right_rounded, color: Colors.grey, size: 20.0,),
      ),
    );
  }
  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
        builder: (context, constraints) {
          // return Container(
          //   child: widget.childs != null ?  Expandable(
          //     arrowLocation: ArrowLocation.left,
          //     showArrowWidget: false,
          //     borderRadius: BorderRadius.zero,
          //     backgroundColor: Colors.transparent,
          //     animationController: _controller,
          //     animation: _animation,
          //     boxShadow: [BoxShadow(color: Colors.transparent)],
          //     firstChild: Expanded(
          //       child: Container(
          //         padding: EdgeInsets.only(left: (widget.offset * widget.depth).toDouble()),
          //         child: Row(
          //           children: List<Widget>.generate(widget.cells!.length, (index) => index == 0 ? Container(
          //             width: constraints.maxWidth * widget.columnWidths[index] - (widget.offset * widget.depth).toDouble(),
          //             child: Row(
          //               children: [
          //                 _buildRotation(),
          //                 Expanded(child: widget.cells[index])
          //               ],
          //             ),
          //           ):Expanded(child: widget.cells[index])),
          //         ),
          //       ),
          //     ),
          //     secondChild: Container(
          //       child: ListView.builder(
          //         shrinkWrap: true,
          //         physics: const NeverScrollableScrollPhysics(),
          //         itemBuilder: (context,index) {
          //           ExpandTableRow row = widget.childs![index];
          //           return ExpandTableRow(cells: row.cells ,childs: row.childs,depth: widget.depth + 1,columnWidths: widget.columnWidths);
          //         },
          //         itemCount: widget.childs!.length,
          //       ),
          //     ),
          //   ) : Container(
          //     padding: EdgeInsets.only(left: (widget.offset * widget.depth).toDouble()),
          //     child: Row(
          //       children: List<Widget>.generate(widget.cells!.length, (index) => index == 0 ? Container(
          //         child: widget.cells[index],
          //         width: constraints.maxWidth * widget.columnWidths[index] - (widget.offset * widget.depth).toDouble(),
          //       ):Expanded(child: widget.cells[index])),
          //     ),
          //   ),
          // );
          return Container(
            child: Expandable(
              arrowLocation: ArrowLocation.left,
              showArrowWidget: false,
              borderRadius: BorderRadius.zero,
              backgroundColor: Colors.transparent,
              animationController: _controller,
              animation: _animation,
              boxShadow: [BoxShadow(color: Colors.transparent)],
              firstChild: Expanded(
                child: Container(
                  padding: EdgeInsets.only(left: (widget.offset * widget.depth).toDouble()),
                  child: Row(
                    children: List<Widget>.generate(widget.cells!.length, (index) => index == 0 ? Container(
                      width: constraints.maxWidth * widget.columnWidths[index] - (widget.offset * widget.depth).toDouble(),
                      child: Row(
                        children: [
                          Opacity(
                            opacity: widget.childs != null ? 1 : 0,
                            child: _buildRotation(),
                          ),
                          Expanded(child: widget.cells[index])
                        ],
                      ),
                    ):Expanded(child: widget.cells[index])),
                  ),
                ),
              ),
              secondChild: Container(
                child: ListView.builder(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemBuilder: (context,index) {
                    ExpandTableRow row = widget.childs![index];
                    return Column(
                      children: [
                        Container(
                          height: 0.5,
                          color: convertStringToColor("#d3d3d3",alpha: 0.6),
                        ),
                        ExpandTableRow(cells: row.cells ,childs: row.childs,depth: widget.depth + 1,columnWidths: widget.columnWidths)
                      ],
                    );
                  },
                  itemCount: widget.childs?.length ?? 0,
                ),
              ),
            )
          );
        });
    // TODO: implement build

  }

}