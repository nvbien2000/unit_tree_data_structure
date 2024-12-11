<!--
Author: Nguyen Van Bien
Email: nvbien2000@gmail.com
LinkedIn: linkedin.com/in/nvbien2000
-->
# unit_tree_data_structure

A tree data structure that supports tree-view. Check out the usage: [unit_tree_flutter](https://pub.dev/packages/unit_tree_flutter).

## Features

Inspired by the structure of a directory tree on a computer, there are two types of nodes: directories and files. A directory can contain multiple files and other directories, and a file is the smallest level that cannot contain anything else.

- [AbsNodeType](lib/models/abstract_node_type.p.dart): An abstract class representing the data type of a node. A node can be either an inner node or a leaf node:
	- `id`: _required_, dynamic.
    - `title`: _required_, String.
    - `isInner`:  boolean, default is **true**.
    - `isUnavailable`:  boolean, default is **false**. *It is defined by default as: If a branch doesn't contains any leaf, it is unavailable (or un-chosenable).*
    - `isChosen`: nullable boolean, default is **false**.
    - `isExpanded`: boolean, default is **false**.
    - `isFavorite`: boolean, default is **false**.
    - `isShowedInSearching`: boolean, default is **true**. Also known as `isDisplayable`, được sử dụng used when the UI tree has a search function.
    + `clone()`: abstract method, `T extends AbsNodeType`. Allows cloning the object.
- [EasyNodeType](lib/models/easy_node_type.p.dart): A simple implementation of [AbsNodeType](lib/models/abstract_node_type.p.dart).
- [TreeType<T extends AbsNodeType>](lib/models/tree_type.p.dart): The tree data structure.
	- `T` is the Implement Class of [AbsNodeType](lib/models/abstract_node_type.dart).
    - `data`: _required_, `T`.
    - `children`: _required_, `List<TreeType<T>>`.
    - `parent`: _required_, `TreeType<T>?`. If `parent == null`, it means we are at the root of the entire tree.
    - `isChildrenLoadedLazily`: boolean, default is **false**. Only used if the current tree is lazy-loading, indicating whether the children have been loaded before or not.
    - `isLeaf`: Is current tree at a leaf node?
    - `isRoot`:  Is current tree at the root node?
    - `clone(tree, parent)`: static method. Allows cloning a tree.

## Support functions

### Traversal functions
```dart
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
```
- `EChosenValues isChosenAll(tree)`: Check current chosen status of tree.
- `TreeType findRoot(tree)`: Find root.
- `TreeType? findTreeWithId(tree, id)`: Find tree with id.
- `searchAllTreesWithTitleDFS(tree, title, []result)`: Search all trees those titles contain `title` argument.
- `searchLeavesWithTitleDFS(tree, title, []result)`: Same as above, but for leaves.
- `returnChosenLeaves(tree, []result)`: Return chosen leaves (`isChosen == true`).
- `returnChosenNodes(tree, []result)`: Return chosen nodes.
- `returnFavoriteNodes(tree, []result)`: Return favorite nodes (`isFavorite == true`).
- `int findLevel(tree)`: Return the level of current node.

### Update functions
- `updateAllUnavailableNodes(tree)`: When you first time create a new tree, you MUST call this function to update the available/unavailable status of its nodes and avoid issue in the future.
- `checkAll(tree)`: Check all.
- `uncheckALl(tree)`: Uncheck all.
- `updateTreeMultipleChoice(tree, chosenValue, ...)`: Updates a multiple choice tree when a node is clicked.
- `updateTreeSingleChoice(tree, chosenValue)`: Updates the single choice tree when a leaf is ticked.
- `updateTreeWithSearchingTitle(tree, searchingText)`: Updates the `isShowedInSearching` property of nodes when applying the search function.
- `updateTreeWithSearchingTitle(tree, searchingText)`: Update displayable statuses of nodes when you are searching with a text.
- `insertNode(tree, node)`: Insert node as a child of tree.
- `deleteBranchByID(tree, id)`: Delete a branch with id.