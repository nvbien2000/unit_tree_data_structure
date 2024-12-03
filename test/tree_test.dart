/* 
 * Author: Nguyen Van Bien
 * Email: nvbien2000@gmail.com
 * LinkedIn: linkedin.com/in/nvbien2000
 */

import 'package:flutter_test/flutter_test.dart';
import 'package:unit_tree_data_structure/unit_tree_data_structure.dart';

void main() {
  test(
    'test fromJson full data',
    () {
      Map<String, dynamic> map = {
        "data": {
          "id": 1,
          "title": "root",
          "isInner": true,
          "isUnavailable": false,
          "isChosen": null,
          "isExpanded": false,
          "isFavorite": false,
          "isShowedInSearching": true,
        },
        "children": [
          {
            "data": {
              "id": 2,
              "title": "child 1",
              "isInner": true,
              "isUnavailable": false,
              "isChosen": null,
              "isExpanded": false,
              "isFavorite": false,
              "isShowedInSearching": true,
            },
            "children": [],
            "isChildrenLoadedLazily": false,
          },
        ],
        "isChildrenLoadedLazily": false,
      };

      var tree = TreeType.fromJson<EasyNodeType>(
        json: map,
        parent: null,
        implFromJson: EasyNodeType.fromJson,
      );
      expect(tree.data.id, 1);
      expect(tree.children[0].data.id, 2);
    },
  );

  test(
    'test fromJson missing data',
    () {
      Map<String, dynamic> map = {
        "data": {
          "id": 1,
          "title": "root",
        },
        "children": [
          {
            "data": {
              "id": 2,
              "title": "child 1",
            },
            "children": [
              {
                "data": {
                  "id": 3,
                  "title": "child 2",
                  "isInner": false,
                },
                "children": [],
              },
            ],
          },
        ],
      };

      var tree = TreeType.fromJson<EasyNodeType>(
        json: map,
        parent: null,
        implFromJson: EasyNodeType.fromJson,
      );
      expect(tree.data.id, 1);
      expect(tree.children[0].data.id, 2);
    },
  );
}
