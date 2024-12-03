part of '../unit_tree_data_structure.dart';

/// Just a simple implementation of [AbsNodeType], with additional
/// [subtitle] property.
class EasyNodeType extends AbsNodeType {
  EasyNodeType({
    required super.id,
    required super.title,
    super.isInner,
    super.isUnavailable,
    super.isChosen,
    super.isExpanded,
    super.isFavorite,
    super.isShowedInSearching,
    this.subtitle,
  });

  String? subtitle;

  @override
  Map<String, dynamic> toJson() {
    var result = super.toJson();
    result["subtitle"] = subtitle;
    return result;
  }

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
