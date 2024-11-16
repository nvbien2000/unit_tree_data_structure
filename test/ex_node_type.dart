import 'dart:math';

import 'package:unit_tree_data_structure/unit_tree_data_structure.dart';

class ExNodeType extends AbsNodeType {
  ExNodeType({
    required super.id,
    required super.title,
    this.subtitle,
    super.isInner,
  });

  ExNodeType.sampleInner(String level) : super(id: -1, title: "") {
    super.id = Random().nextInt(100000);
    super.title = "(inner) title of level $level";
    subtitle = "subtitle of level = $level";
  }

  ExNodeType.sampleLeaf(String level) : super(id: -1, title: "") {
    super.id = Random().nextInt(100000);
    super.title =
        "(leaf) title of level $level\nUse [maxLines] if your title is too long";
    subtitle = "subtitle of level = $level";
    super.isInner = false;
    super.isFavorite = false;
  }

  /// isExpanded = true
  ExNodeType.sampleInnerExpanded(String level) : super(id: -1, title: "") {
    super.id = Random().nextInt(100000);
    super.title = "(inner) title of level $level";
    subtitle = "subtitle of level = $level";
    isExpanded = true;
  }

  /// isExpanded = true
  ExNodeType.sampleLeafExpanded(String level) : super(id: -1, title: "") {
    super.id = Random().nextInt(100000);
    super.title = "(leaf) title of level $level";
    subtitle = "subtitle of level = $level";
    super.isInner = false;
    super.isFavorite = false;
    isExpanded = true;
  }

  @override
  T clone<T extends AbsNodeType>() {
    var newData = ExNodeType(
      id: id,
      title: title,
      subtitle: subtitle,
      isInner: isInner,
    );
    newData.isUnavailable = isUnavailable;
    newData.isChosen = isChosen;
    newData.isExpanded = isExpanded;
    newData.isFavorite = isFavorite;

    return newData as T;
  }

  String? subtitle;
}
