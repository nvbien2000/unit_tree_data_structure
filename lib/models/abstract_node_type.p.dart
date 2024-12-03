/* 
 * Author: Nguyen Van Bien
 * Email: nvbien2000@gmail.com
 * LinkedIn: linkedin.com/in/nvbien2000
 */

part of '../unit_tree_data_structure.dart';

/// An abstract class about node data type. There're 2 kinds of node:
/// inner node (including root) & leaf node.
abstract class AbsNodeType {
  AbsNodeType({
    required this.id,
    required this.title,
    this.isInner = true,
    this.isUnavailable = false,
    this.isChosen = false,
    this.isExpanded = false,
    this.isFavorite = false,
    this.isShowedInSearching = true,
  }) {
    if (!isInner && isChosen == null) {
      throw ArgumentError("Leaf node's `isChosen` cannot contain null value.");
    }
  }

  dynamic id;
  String title;
  bool isInner;

  /// A node is disabled/unavailable for some reasons? --\\_(^.^)_/--
  ///
  /// Default value is `false`.
  bool isUnavailable;

  /// - Inner node:
  ///   + If `isChosen == true`, all of its children are chosen.
  ///   + if `isChosen == false`, all of its children are unchosen.
  ///   + If `isChosen == null`, some of its children are chosen, some are not.
  /// - Leaf node: Only `true` or `false`.
  ///
  /// The default value is false (unchosen all)
  bool? isChosen;

  /// This property will be useful in an expandable tree view widget.
  bool isExpanded;

  bool isFavorite;

  /// If we are searching a text in this tree, every branch from found nodes
  /// to the root should display [true] - else not show in searching [false].
  ///
  /// We can call this is `isDisplayable`.
  bool isShowedInSearching;

  T clone<T extends AbsNodeType>();

  static T fromJson<T extends AbsNodeType>(Map<String, dynamic> json) {
    // Implement this method in subclasses
    throw UnimplementedError();
  }

  Map<String, dynamic> toJson() {
    return {
      "id": id,
      "title": title,
      "isInner": isInner,
      "isUnavailable": isUnavailable,
      "isChosen": isChosen,
      "isExpanded": isExpanded,
      "isFavorite": isFavorite,
      "isShowedInSearching": isShowedInSearching,
    };
  }

  @override
  String toString() =>
      "title: $title, isInner: $isInner, isUnavailable: $isUnavailable, isChosen: $isChosen, isExpanded: $isExpanded";
}
