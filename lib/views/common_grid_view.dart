import 'package:flutter/material.dart';
import 'package:flutter_layout_grid/flutter_layout_grid.dart';

class GridComponent {
  final String type;
  final String content;
  final String? label;

  GridComponent({required this.type, required this.content, this.label});
}

// A common widget for rendering grid views
class CommonGridView extends StatelessWidget {
  final List<GridComponent> components;

  const CommonGridView({Key? key, required this.components}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: LayoutGrid(
        columnSizes: [1.fr, 1.fr],
        rowSizes: List<IntrinsicContentTrackSize>.generate(
          components.length,
          (_) => auto,
        ), // Auto-sized rows based on content
        rowGap: 16.0,
        columnGap: 16.0,
        children: _buildGridItems(),
      ),
    );
  }

  List<Widget> _buildGridItems() {
    List<Widget> gridItems = [];

    for (var component in components) {
      gridItems.add(_buildComponentWidget(component));
    }

    return gridItems;
  }

  Widget _buildComponentWidget(GridComponent component) {
    switch (component.type) {
      case 'text':
        return Text(
          component.content,
          style: TextStyle(fontSize: 16.0),
        );
      case 'button':
        return ElevatedButton(
          onPressed: () {},
          child: Text(component.label ?? 'Button'),
        );

      default:
        return SizedBox.shrink();
    }
  }
}
