part of '../unit_tree_data_structure.dart';

/// Just a simple implementation of [AbsNodeType], with additional
/// [subtitle] property.
class EasyNodeType extends AbsNodeType {
  EasyNodeType({
    required String super.id,
    required super.title,
    this.subtitle,
    super.isInner = true,
  });

  String? subtitle;

  @override
  T clone<T extends AbsNodeType>() {
    var newData = EasyNodeType(
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
}
