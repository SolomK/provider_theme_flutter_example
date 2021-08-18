import 'package:flutter/material.dart';
import 'package:flutter_colorpicker/flutter_colorpicker.dart';
import 'package:lab5/Item.dart';
import 'package:provider/provider.dart';

class MainScaffold extends StatelessWidget {
  const MainScaffold({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    ThemeProvider hh = Provider.of<ThemeProvider>(context);
    return Scaffold(
      appBar: _ThemedAppBar(
        title: Text("Provider Theme Exmple"),
        actions: [
          IconButton(
            onPressed: () => _showColorPicker(context), 
            icon: Icon(Icons.colorize)
            )

        ],
        ),
        body: Container(
          padding: EdgeInsets.all(20),
         // color: hh.mainColor,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Consumer<ThemeProvider>(
              builder: (context, themeProvider, child) => Text(
                'Text',
                style: Theme.of(context).textTheme.headline2?.copyWith(
                      color: themeProvider.mainColor,
                    ),
              ),
            ),
            Consumer<ThemeProvider>(
              builder: (context, themeProvider, child) => Text(
                'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur.',
                style: Theme.of(context).textTheme.bodyText2?.copyWith(
                      color: themeProvider.mainColor,
                    ),
              ),
            ),
            Consumer<ThemeProvider>(
              builder: (context, themeProvider, child) => Container(
                height: 100,
                width: 100,
                decoration: BoxDecoration(
                  color: themeProvider.mainColor,
                  borderRadius: BorderRadius.all(
                    Radius.circular(50),
                  ),
                ),
              ),
            ),
            Consumer<ThemeProvider>(
              builder: (context, themeProvider, child) => Slider(
                activeColor: themeProvider.mainColor,
                inactiveColor: themeProvider.mainColor.withOpacity(0.5),
                value: 0,
                onChanged: (newValue) {},
              ),
            ),
            Consumer<ThemeProvider>(
              builder: (context, themeProvider, child) => Switch(
                activeColor: themeProvider.mainColor,
                value: true,
                onChanged: (newValue) {},
              ),
            ),
            ],
          ),
        ),
      

      
    );
  }
  void _showColorPicker(BuildContext context){
    ThemeProvider themeProvider = Provider.of<ThemeProvider>(context, listen: false);
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        titlePadding: EdgeInsets.all(0),
        contentPadding: EdgeInsets.all(0),
        content: Wrap(
          children: [
            ColorPicker(
              pickerColor: themeProvider.mainColor, 
              onColorChanged: (color) => themeProvider.changeThemeColor(color)
              )
          ],
        ),
        actions: [
          TextButton(
            onPressed: (){
              Navigator.of(context).pop();
            },
             child: Text("Close")
             )
        ],
      )
      );
  }
}
class _ThemedAppBar extends StatelessWidget with PreferredSizeWidget {
  
  _ThemedAppBar({
    Key? key,
    this.title,
    this.actions,
  })  : preferredSize = Size.fromHeight(kToolbarHeight),
        super(key: key);
  final Widget? title;
  final List<Widget>? actions;
  final Size preferredSize;


  @override
  Widget build(BuildContext context) {
    return Consumer<ThemeProvider>(
      builder: (context, themeProvider, child) => AppBar(
        title: title,
        actions: actions,
        backgroundColor: themeProvider.mainColor,
      )
      );
  }
}