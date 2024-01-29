bool checkIfInList({required List mainList, required List subList}) {
  //sort the player list

  if (mainList.isNotEmpty && subList.isNotEmpty) {
    final playerSet = Set.of(subList);
    if (playerSet.containsAll(mainList)) {
      print("win");
      return true;
    }
  }

  return false;
}
