import 'package:flutter/material.dart';

class ItemCard extends StatelessWidget {
  final EdgeInsets? customMargin;  
  final Widget? customchild; // 임시로 Center child를 Column으로 변경
  const ItemCard({
    this.customMargin, 
    this.customchild,
    super.key, //required Center child,
    });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.primaryContainer,
        borderRadius: BorderRadius.circular(10),
      ),
      margin: customMargin ?? const EdgeInsets.all(8),
      padding: const EdgeInsets.all(12),
      child:customchild
    );
  }
}
