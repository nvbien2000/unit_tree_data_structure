/* 
 * Author: Nguyen Van Bien
 * Email: nvbien2000@gmail.com
 * LinkedIn: linkedin.com/in/nvbien2000
 */

part of '../unit_tree_data_structure.dart';

class TreeType<T extends AbsNodeType> {
  TreeType({
    required this.data,
    required this.children,
    required this.parent,
    this.isChildrenLoadedLazily = false,
  });

  T data;
  List<TreeType<T>> children;

  /// If `parent == null`, it is root of the tree.
  TreeType<T>? parent;

  /// This property is used to know if the children were **LAZILY** loaded or
  /// not - useful ONLY in **Lazy Tree View**. Default value is [false].
  bool isChildrenLoadedLazily;

  bool get isLeaf => !data.isInner;
  bool get isRoot => parent == null;

  /// Static method. How to use:
  ///
  /// ```dart
  /// TreeType<T> tree = ...;
  /// TreeType<T> clonedTree = TreeType.clone(tree, tree.parent);
  /// ```
  static TreeType<T> clone<T extends AbsNodeType>(
      TreeType<T> tree, TreeType<T>? parent) {
    var newData = TreeType<T>(
      data: tree.data.clone<T>(),
      children: [],
      parent: parent,
      isChildrenLoadedLazily: tree.isChildrenLoadedLazily,
    );

    newData.children.addAll(
      tree.children.map((child) => clone<T>(child, newData)).toList(),
    );

    return newData;
  }

  Map<String, dynamic> toJson() {
    return {
      "data": data.toJson(),
      "children": children.map((e) => e.toJson()).toList(),
    };
  }

  @override
  String toString() =>
      "TreeType{current: ${data.title}, parent: ${parent?.data.title}, ${children.length} children}";
}
