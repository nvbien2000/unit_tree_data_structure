/* 
 * Author: Nguyen Van Bien
 * Email: nvbien2000@gmail.com
 * LinkedIn: linkedin.com/in/nvbien2000
 */

part of '../unit_tree_data_structure.dart';

class ErrInsertToTreeSingleChoice extends BaseError {
  ErrInsertToTreeSingleChoice(super.tree, this.node);

  final AbsNodeType node;

  @override
  String toString() {
    return "You need to provide not-null [isChosen] when insert into single choice tree";
  }
}

class ErrInsertToLeaf extends BaseError {
  ErrInsertToLeaf(super.tree, this.node);

  final AbsNodeType node;

  @override
  String toString() {
    return "Cannot insert node ${node.id} into leaf node";
  }
}
