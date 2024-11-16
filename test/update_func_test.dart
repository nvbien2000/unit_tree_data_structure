/* 
 * Author: Nguyen Van Bien
 * Email: nvbien2000@gmail.com
 * LinkedIn: linkedin.com/in/nvbien2000
 */

import 'package:flutter_test/flutter_test.dart';
import 'package:unit_tree_data_structure/unit_tree_data_structure.dart';

import 'dumb_data.dart';
import 'ex_node_type.dart';

void main() {
  test(
    'insertNode',
    () {
      var tree = dumbData<ExNodeType>();
      var newNode = ExNodeType(
        id: 1001,
        title: "new node",
      );

      var leaf = tree.children[0].children[0].children[0];
      expect(
        () => insertNode(leaf, newNode),
        throwsA(isA<ErrInsertToLeaf>()),
      );

      var inner = tree.children[0].children[0];
      insertNode(inner, newNode);
      var result = findTreeWithId(tree, 1001);
      expect(result?.data.title, "new node");
    },
  );

  test(
    'deleteBranchByID',
    () {
      var tree = dumbData<ExNodeType>();

      expect(
        () => deleteBranchByID(tree, 100001),
        throwsA(isA<ErrNotFoundID>()),
      );

      var rootId = tree.data.id;
      expect(
        () => deleteBranchByID(tree, rootId),
        throwsA(isA<ErrDeletingRoot>()),
      );

      var node = tree.children[0].children[0];
      var id = node.data.id;
      deleteBranchByID(tree, id);
      expect(tree.children[0].children.length, 2);
    },
  );
}
