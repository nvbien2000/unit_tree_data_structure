/* 
 * Author: Nguyen Van Bien
 * Email: nvbien2000@gmail.com
 * LinkedIn: linkedin.com/in/nvbien2000
 */

import 'package:flutter_test/flutter_test.dart';
import 'package:unit_tree_data_structure/unit_tree_data_structure.dart';

import 'ex_node_type.dart';
import 'dumb_data.dart';

void main() {
  test(
    'isChosenAll',
    () {
      var tree = dumbData<ExNodeType>();
      var result = isChosenAll(tree);
      expect(result, EChosenValues.unchosenAll);
    },
  );
  test(
    'findRoot',
    () {
      var tree = dumbData<ExNodeType>();
      var child = tree.children[0].children[0].children[0];
      var result = findRoot(child);
      expect(result.data.id, tree.data.id);
    },
  );
  test(
    'findTreeWithId',
    () {
      var tree = dumbData<ExNodeType>();
      var id = tree.children[0].children[1].children[0].data.id;
      var result = findTreeWithId(tree, id);
      expect(result?.data.id, id);
    },
  );
  test(
    'searchAllTreesWithTitleDFS',
    () {
      var tree = dumbData<ExNodeType>();

      // test 1
      var title = "(inner) title of level 2.1";
      List<TreeType> r = [];
      searchAllTreesWithTitleDFS(tree, title, r);
      expect(r.length, 1);
      expect(r[0].data.title, title);

      // test 2
      title = "(leaf) title of level 3.1";
      r = [];
      searchAllTreesWithTitleDFS(tree, title, r);
      expect(r.length, 1);
      expect(r[0].data.title, title);

      // test 3
      title = "(inner) title of level 1.2"; // unavailable tree -> not found
      r = [];
      searchAllTreesWithTitleDFS(tree, title, r);
      expect(r.length, 0);

      // test 4
      title = "random thing";
      r = [];
      searchAllTreesWithTitleDFS(tree, title, r);
      expect(r.length, 0);
    },
  );
  test(
    'searchLeavesWithTitleDFS',
    () {
      var tree = dumbData<ExNodeType>();

      // test 1
      var title = "(inner) title of level 2.1";
      List<TreeType> r = [];
      searchLeavesWithTitleDFS(tree, title, r);
      expect(r.length, 0);

      // test 2
      title = "(leaf) title of level 3.1";
      r = [];
      searchLeavesWithTitleDFS(tree, title, r);
      expect(r.length, 1);
    },
  );
  test(
    'returnChosenLeaves',
    () {
      var tree = dumbData<ExNodeType>();

      // test 1
      tree.children[0].children[0].data.isChosen = true;
      updateTreeMultipleChoice(tree.children[0].children[0], true);
      List<TreeType> r = [];
      returnChosenLeaves(tree, r);
      expect(r.length, 3);

      // test 2
      tree.children[0].data.isChosen = true;
      updateTreeMultipleChoice(tree.children[0], true);
      r = [];
      returnChosenLeaves(tree, r);
      expect(r.length, 4);
    },
  );
  test(
    'returnChosenNodes',
    () {
      var tree = dumbData<ExNodeType>();

      // test 1
      tree.children[0].children[0].data.isChosen = true;
      updateTreeMultipleChoice(tree.children[0].children[0], true);
      List<TreeType> r = [];
      returnChosenNodes(tree, r);
      expect(r.length, 4);

      // test 2
      tree.children[0].data.isChosen = true;
      updateTreeMultipleChoice(tree.children[0], true);
      r = [];
      returnChosenNodes(tree, r);
      expect(r.length, 8);
    },
  );
  test(
    'returnFavoriteNodes',
    () {
      var tree = dumbData<ExNodeType>();

      // test 1
      tree.children[0].children[0].data.isFavorite = true;
      List<TreeType> r = [];
      returnFavoriteNodes(tree, r);
      expect(r[0].data.title, "(inner) title of level 2.1");

      // test 2
      tree.children[0].children[0].data.isFavorite = false;
      r = [];
      returnFavoriteNodes(tree, r);
      expect(r.length, 0);
    },
  );
  test(
    'findRightmostOfABranch',
    () {
      var tree = dumbData<ExNodeType>();
      var result = findRightmostOfABranch(tree);
      expect(result.data.title, "(inner) title of level 1.2");
    },
  );
  test(
    'findLevel',
    () {
      var tree = dumbData<ExNodeType>();
      var result = findLevel(tree.children[0].children[0].children[0]);
      expect(result, 3);

      result = findLevel(tree.children[0].children[2]);
      expect(result, 2);

      result = findLevel(tree.children[0]);
      expect(result, 1);

      result = findLevel(tree.children[1]);
      expect(result, 1);

      result = findLevel(tree);
      expect(result, 0);
    },
  );
}
