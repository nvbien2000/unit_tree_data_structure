/* 
 * Author: Nguyen Van Bien
 * Email: nvbien2000@gmail.com
 * LinkedIn: linkedin.com/in/nvbien2000
 */

part of '../unit_tree_data_structure.dart';

/// Exception for [updateTreeMultipleChoice] function.
class ErrUpdateTreeMultipleChoice extends BaseError {
  ErrUpdateTreeMultipleChoice(super.tree);

  @override
  String toString() {
    return """- Function: updateTreeMultipleChoice()
- When: parentChosenValue == EChosenAllValues.notChosenable
- Description: Some logic error happen""";
  }
}
