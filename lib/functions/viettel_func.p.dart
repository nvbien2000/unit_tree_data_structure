/* 
 * Author: Nguyen Van Bien
 * Email: nvbien2000@gmail.com
 * LinkedIn: linkedin.com/in/nvbien2000
 */

part of '../unit_tree_data_structure.dart';

/// If we use canvas to draw lines in expandable tree view (look at example),
/// we will wonder, what is the rightmost node in current branch of tree?
/// Because the line in rightmost node has little difference from other.
///
/// > Notice: Find the rightmost of a **BRANCH**, not entire tree.
TreeType<T> findRightmostOfABranch<T extends AbsNodeType>(TreeType<T> tree) {
  if (tree.data.isInner && tree.children.isEmpty) return tree;

  if (tree.isRoot) return findRightmostOfABranch(tree.children.last);

  var lastChildOfCurrentParent = tree.parent!.children.last;
  if (identical(lastChildOfCurrentParent, tree)) return tree;

  return findRightmostOfABranch(lastChildOfCurrentParent);
}

/// - Prerequire: The tree is single choice, not multiple choice.
/// - Description:
///   - Custom for Viettel DMS.4.
///   - Every node can be chosen, so [T.isChosen] is never null.
void updateTreeSingleChoiceDms4<T extends AbsNodeType>(
    TreeType<T> tree, bool chosenValue) {
  // uncheck all - every node will have isChosen = false
  var root = findRoot(tree);
  uncheckALl(root);

  // update current node value
  tree.data.isChosen = chosenValue;
}
