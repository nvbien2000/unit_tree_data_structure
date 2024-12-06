/* 
 * Author: Nguyen Van Bien
 * Email: nvbien2000@gmail.com
 * LinkedIn: linkedin.com/in/nvbien2000
 */

part of '../unit_tree_data_structure.dart';

enum EChosenValues {
  /// All nodes in the tree are chosen
  chosenAll,

  /// No nodes in the tree are chosen
  unchosenAll,

  /// Some nodes in the tree are chosen
  chosenSome,

  /// The tree is not chosenable/unavailable
  notChosenable,
}

/// Check if the the tree is chosen all
///
///   - [isThisTreeLazy]: When this function is used in lazy-load tree, some
/// nodes may contain 0 child because their children haven't been loaded.
EChosenValues isChosenAll<T extends AbsNodeType>(TreeType<T> tree,
    {bool isThisLazyTree = false}) {
  //? Case 1: This tree is only a leaf
  //? ______
  if (tree.isLeaf) {
    if (tree.data.isUnavailable) {
      return EChosenValues.notChosenable;
    } else {
      return tree.data.isChosen == true
          ? EChosenValues.chosenAll
          : EChosenValues.unchosenAll;
    }
  }

  //? Case 2: This tree can contain some children
  //? ______

  /// Means one of it children has been chosen all
  bool hasChosenAll = false;

  /// Means one of it children has been unchosen all
  bool hasUnchosenAll = false;

  /**
   * ! SPECIAL CASE: If tree is loaded lazily -> if its children haven't been
   * ! loaded, do not need to call [isChosenAll(child)] and directly return
   * ! result [isChosen]
   * 
   * - If one of its child is [EChosenAllValues.chosenSome], just return & exit.
   * - Case chosen some: [hasChosenAll && hasUnchosenAll]...
   * - Case all of children are chosen: [hasChosenAll && !hasUnchosenAll]...
   * - Case all of children are not chosen: [!hasChosenAll && hasUnchosenAll]...
   * - Else, return default value [EChosenAllValues.notChosenable]
   */

  // this is lazy tree & its children haven't been loaded
  if (isThisLazyTree && !tree.isChildrenLoadedLazily) {
    if (tree.data.isUnavailable) {
      return EChosenValues.notChosenable;
    } else {
      return tree.data.isChosen == true // true
          ? EChosenValues.chosenAll
          : EChosenValues.unchosenAll; // false (no exist null)
    }
  }

  for (var child in tree.children) {
    var temp = isChosenAll(child, isThisLazyTree: isThisLazyTree);
    switch (temp) {
      case EChosenValues.chosenSome:
        return EChosenValues.chosenSome;
      case EChosenValues.chosenAll:
        hasChosenAll = true;
        break;
      case EChosenValues.unchosenAll:
        hasUnchosenAll = true;
        break;
      default:
        break;
    }
  }

  if (hasChosenAll && hasUnchosenAll) {
    return EChosenValues.chosenSome;
  } else if (hasChosenAll && !hasUnchosenAll) {
    return EChosenValues.chosenAll;
  } else if (!hasChosenAll && hasUnchosenAll) {
    return EChosenValues.unchosenAll;
  } else {
    // return default
    return EChosenValues.notChosenable;
  }
}

TreeType<T> findRoot<T extends AbsNodeType>(TreeType<T> tree) {
  if (tree.isRoot) return tree;
  return findRoot(tree.parent!);
}

TreeType<T>? findTreeWithId<T extends AbsNodeType>(
    TreeType<T> tree, dynamic id) {
  if (tree.data.id == id) {
    return tree;
  } else {
    for (var innerTree in tree.children) {
      var r = findTreeWithId(innerTree, id);
      if (r != null) return r;
    }
  }
  return null;
}

/// Using DFS to return all the trees if each of root's data contains searching
/// text. The tree must be `available`.
///
/// Text is transformed to lowercase before searching.
void searchAllTreesWithTitleDFS<T extends AbsNodeType>(
    TreeType<T> tree, String text, List<TreeType<T>> result) {
  if (tree.data.isUnavailable) return;

  String titleL = tree.data.title.toLowerCase();
  String textL = text.toLowerCase();
  if (titleL.contains(textL)) result.add(tree);

  for (var child in tree.children) {
    searchAllTreesWithTitleDFS(child, text, result);
  }
}

/// Using DFS to return leaves if each of leaf's data contains searching text
/// The tree must be `available`.
void searchLeavesWithTitleDFS<T extends AbsNodeType>(
    TreeType<T> tree, String text, List<TreeType<T>> result) {
  if (tree.data.isUnavailable) return;

  if (tree.isLeaf && tree.data.title.contains(text)) {
    result.add(tree);
    return;
  }

  for (var child in tree.children) {
    searchLeavesWithTitleDFS(child, text, result);
  }
}

void returnChosenLeaves<T extends AbsNodeType>(
    TreeType<T> tree, List<TreeType<T>> result) {
  if (tree.data.isUnavailable) return;

  if (tree.isLeaf && tree.data.isChosen == true) {
    result.add(tree);
    return;
  }

  for (var child in tree.children) {
    returnChosenLeaves(child, result);
  }
}

void returnChosenNodes<T extends AbsNodeType>(
    TreeType<T> tree, List<TreeType<T>> result) {
  if (tree.data.isUnavailable) return;

  if (tree.data.isChosen == true) result.add(tree);

  for (var child in tree.children) {
    returnChosenNodes(child, result);
  }
}

void returnFavoriteNodes<T extends AbsNodeType>(
    TreeType<T> tree, List<TreeType<T>> result) {
  if (tree.data.isUnavailable) return;

  if (tree.data.isFavorite == true) result.add(tree);

  for (var child in tree.children) {
    returnFavoriteNodes(child, result);
  }
}

int findLevel<T extends AbsNodeType>(TreeType<T> tree) {
  if (tree.isRoot) return 0;
  return 1 + findLevel(tree.parent!);
}
