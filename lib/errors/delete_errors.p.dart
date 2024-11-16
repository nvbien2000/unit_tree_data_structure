/* 
 * Author: Nguyen Van Bien
 * Email: nvbien2000@gmail.com
 * LinkedIn: linkedin.com/in/nvbien2000
 */

part of '../unit_tree_data_structure.dart';

class ErrNotFoundID extends BaseError {
  ErrNotFoundID(super.tree, this.id);

  final dynamic id;

  @override
  String toString() {
    return "Delete failed: Cannot find node with id $id";
  }
}

class ErrDeletingRoot extends BaseError {
  ErrDeletingRoot(super.tree);

  @override
  String toString() {
    return "Delete failed: Cannot delete root node";
  }
}
