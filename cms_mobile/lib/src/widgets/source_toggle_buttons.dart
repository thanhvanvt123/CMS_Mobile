import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class SourceToggleButtons extends StatefulWidget {
  final ValueChanged<int> onChanged;

  const SourceToggleButtons({
    Key? key,
    required this.onChanged,
  }) : super(key: key);

  @override
  State<SourceToggleButtons> createState() => _SourceToggleButtonsState();
}

class _SourceToggleButtonsState extends State<SourceToggleButtons> {
  List<bool> isSelected = [true, false];

  @override
  Widget build(BuildContext context) => Center(
        child: Container(
          // margin: EdgeInsets.only(left: 20),
          color: Colors.white70,
          child: ToggleButtons(
            // direction: Axis.horizontal,
            // verticalDirection: VerticalDirection.down,
            isSelected: isSelected,
            selectedColor: Colors.white,
            color: Colors.black,
            fillColor: Colors.green,
            renderBorder: false,
            children: <Widget>[
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 80),
                // child: Text('Download', style: TextStyle(fontSize: 15)),
                child: Icon(FontAwesomeIcons.fileDownload),
              ),
              // Divider(height: 10, color: Colors.white,),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 80),
                // child: Text('Storage', style: TextStyle(fontSize: 15)),
                child: Icon(FontAwesomeIcons.folderOpen),
              ),
            ],
            onPressed: (newIndex) {
              setState(() {
                for (int index = 0; index < isSelected.length; index++) {
                  if (index == newIndex) {
                    isSelected[index] = true;
                  } else {
                    isSelected[index] = false;
                  }
                }

                widget.onChanged(newIndex);
              });
            },
          ),
        ),
      );
}