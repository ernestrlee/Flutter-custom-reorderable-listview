# Flutter-custom-reorderable-listview

This custom reorderable listview is based on Flutter's reorderableListView.<br />
https://api.flutter.dev/flutter/material/ReorderableListView-class.html

This widget is wrapped in a SingleChildScrollView and is meant to be implemented at the root of the body.

This customized version allows you to place widgets before and after the listview and allows you to place a non-draggable header or footer in the list.
To customize the container of the listview, edit the custom_reorderable.dart file.

## Extended Properties:
header: A widget to display at the top of the list<br />
footer: A widget to display at the bottom of the list<br />
beforeWidget:  A widget to place before reorderable list<br />
afterWidget: A widget to place after the reorderable list<br />
dropAreaSpacing: The size of an area at the end of the list to drop reordered items<br />
