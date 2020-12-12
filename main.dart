import 'package:draggable_listview/custom_reorderable.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: MyHomePage(title: 'Re-orderable list demo'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  List<String> myList = List.generate(15, (i) => "$i");

  void _updateItems(int oldIndex, int newIndex) {
    String value = myList[oldIndex];

    if (oldIndex > newIndex) {
      myList.insert(newIndex, value);
      myList.removeAt(oldIndex + 1);
    } else if (oldIndex < newIndex) {
      myList.insert(newIndex, value);
      myList.removeAt(oldIndex);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Container(
        child: CustomReorderableListView(
          beforeWidget: Card(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text('Top Widget'),
            ),
          ),
          afterWidget: Card(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text('Bottom Widget'),
            ),
          ),
          header: Text('This is the list header'),
          footer: Text('This is the list footer'),
          dropAreaSpacing: 0.0,
          children: [
            for (final item in myList)
              ListTile(
                key: ValueKey(item),
                title: Text('Item #$item'),
                trailing: Icon(Icons.reorder),
              )
          ],
          onReorder: (oldIndex, newIndex) {
            setState(() {
              _updateItems(oldIndex, newIndex);
              print(myList);
            });
          },
        ),
      ),
    );
  }
}
