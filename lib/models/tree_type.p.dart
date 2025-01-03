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

  static TreeType<T> fromJson<T extends AbsNodeType>({
    required Map<String, dynamic> json,
    required TreeType<T>? parent,
    required T Function(Map<String, dynamic>) implFromJson,
  }) {
    var data = implFromJson(json['data']);
    var tree = TreeType<T>(
      data: data,
      children: [],
      parent: parent,
      isChildrenLoadedLazily: json['isChildrenLoadedLazily'] ?? false,
    );

    var children = ((json['children'] as List?) ?? [])
        .map((childJson) => TreeType.fromJson<T>(
              json: childJson,
              parent: tree,
              implFromJson: implFromJson,
            ))
        .toList();
    tree.children = children;

    return tree;
  }

  Map<String, dynamic> toJson() {
    return {
      "data": data.toJson(),
      "children": children.map((e) => e.toJson()).toList(),
      "isChildrenLoadedLazily": isChildrenLoadedLazily,
    };
  }

  @override
  String toString() =>
      "current: ${data.title}, parent: ${parent?.data.title}, children: ${children.length}";
}
