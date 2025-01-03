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

  static T fromJson<T extends AbsNodeType>(Map<String, dynamic> json) {
    return EasyNodeType(
      id: json['id'] as dynamic,
      title: json['title'] as String,
      subtitle: json['subtitle'],
      isInner: json['isInner'] ?? true,
      isUnavailable: json['isUnavailable'] ?? false,
      isChosen: json['isChosen'] ?? false,
      isExpanded: json['isExpanded'] ?? false,
      isFavorite: json['isFavorite'] ?? false,
      isShowedInSearching: json['isShowedInSearching'] ?? true,
    ) as T;
  }

  @override
  T clone<T extends AbsNodeType>() {
    var newData = EasyNodeType(
      id: id,
      title: title,
      subtitle: subtitle,
      isInner: isInner,
      isUnavailable: isUnavailable,
      isChosen: isChosen,
      isExpanded: isExpanded,
      isFavorite: isFavorite,
    );

    return newData as T;
  }
}
