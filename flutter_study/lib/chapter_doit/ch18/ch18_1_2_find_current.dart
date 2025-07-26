import 'package:flutter/material.dart';

void main() {
  runApp(ParentWidget());
}

class ParentWidget extends StatefulWidget {
  const ParentWidget({super.key});

  @override
  State<StatefulWidget> createState() => ParentWidgetState();
}

class ParentWidgetState extends State<ParentWidget> {
  bool favorited = false;
  int favoriteCount = 10;

  final GlobalKey<ChildWidgetState> childKey = GlobalKey();
  int childCount = 0;

  void toggleFavorite() {
    setState(() {
      if (favorited) {
        favoriteCount--;
        favorited = false;
      } else {
        favoriteCount++;
        favorited = true;
      }
      debugPrint("🟥 ParentWidget: toggled favorite to $favorited");
    });
  }

  void getChildData() {
    ChildWidgetState? childState = childKey.currentState;
    setState(() {
      childCount = childState?.childCount ?? 0;
    });
    debugPrint("🟦 ParentWidget: received childCount = $childCount");
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'State Management Test',
      home: Scaffold(
        appBar: AppBar(title: Text('State Management Example')),
        body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              // Parent 상태 출력
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Parent sees childCount: $childCount',
                    style: TextStyle(fontSize: 16),
                  ),
                  ElevatedButton(
                    onPressed: getChildData,
                    child: Text('Get Child Data'),
                  ),
                ],
              ),
              SizedBox(height: 20),
              // 자식 위젯
              ChildWidget(key: childKey),
              SizedBox(height: 20),
              // 즐겨찾기 버튼 + 카운트
              IconWidget(),
              SizedBox(height: 10),
              ContentWidget(),
            ],
          ),
        ),
      ),
    );
  }
}

class ChildWidget extends StatefulWidget {
  const ChildWidget({super.key});

  @override
  State<ChildWidget> createState() => ChildWidgetState();
}

class ChildWidgetState extends State<ChildWidget> {
  int childCount = 0;

  void increment() {
    setState(() {
      childCount++;
    });
    debugPrint("🟨 ChildWidget: incremented to $childCount");
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.yellow[100],
      child: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text('Child count: $childCount'),
            ElevatedButton(
              onPressed: increment,
              child: Text('Increment'),
            ),
          ],
        ),
      ),
    );
  }
}

class IconWidget extends StatelessWidget {
  const IconWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final state = context.findAncestorStateOfType<ParentWidgetState>();
    final isFav = state?.favorited ?? false;

    return Center(
      child: IconButton(
        icon: Icon(isFav ? Icons.favorite : Icons.favorite_border),
        iconSize: 100,
        color: isFav ? Colors.red : Colors.grey,
        onPressed: state?.toggleFavorite,
      ),
    );
  }
}

class ContentWidget extends StatelessWidget {
  const ContentWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final state = context.findAncestorStateOfType<ParentWidgetState>();

    return AnimatedSwitcher(
      duration: Duration(milliseconds: 300),
      child: Text(
        'Favorite Count: ${state?.favoriteCount ?? 0}',
        key: ValueKey<int>(state?.favoriteCount ?? 0),
        style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
      ),
    );
  }
}
