/* 
 * Author: Nguyen Van Bien
 * Email: nvbien2000@gmail.com
 * LinkedIn: linkedin.com/in/nvbien2000
 */

part of '../unit_tree_data_structure.dart';

class BaseError implements Exception {
  BaseError(this.tree);

  final TreeType tree;

  @override
  String toString() {
    return "Error in tree: $tree";
  }
}
