class AI {
  int move = 0;
  final List<int> _selfMoves = [];
  final List<int> _userMoves = [];

  int getNextIndex(int index) {
    move++;
    _userMoves.add(index);
    int _nextMove;
    if (move == 1) {
      _nextMove = _firstMove();
    } else if (move == 2) {
      _nextMove = _secondMove();
    } else if (move == 3) {
      _nextMove = _thirdMove();
    } else {
      _nextMove = _thirdMove();
    }
    _selfMoves.add(_nextMove);
    return _nextMove;
  }

  int _firstMove() {
    if (_userMoves.first == 4) {
      //center
      var returnedValuesList = [0, 2, 6, 8]..shuffle();
      return returnedValuesList.first;
    } else {
      //angles or side
      return 4;
    }
  }

  int _secondMove() {
    if (_selfMoves.contains(4)) {
      if (_userMoves.first % 2 == 0 && _userMoves.last % 2 == 0) {
        // two in angles
        if (_userMoves.first + _userMoves.last == 8) {
          // opposite each other
          var returnedValuesList = [1, 3, 5, 7]..shuffle();
          return returnedValuesList.first;
        } else {
          return (_userMoves.first + _userMoves.last) ~/ 2;
        }
      } else if (_userMoves.first % 2 != 0 && _userMoves.last % 2 != 0) {
        // two in side
        if (_userMoves.first + _userMoves.last == 8) {
          // opposite each other
          if ([3, 5].contains(_userMoves.first)) {
            // horizontal
            var returnedValuesList = [1, 7]..shuffle();
            return returnedValuesList.first;
          } else {
            // vertical
            var returnedValuesList = [3, 5]..shuffle();
            return returnedValuesList.first;
          }
        } else {
          if ([4, 12].contains(_userMoves.first + _userMoves.last)) {
            // "/"
            var returnedValuesList = [2, 6]..shuffle();
            return returnedValuesList.first;
          } else {
            // "\"
            var returnedValuesList = [0, 8]..shuffle();
            return returnedValuesList.first;
          }
        }
      } else {
        // side and angle
        if (_userMoves.contains(0) || _userMoves.contains(8)) {
          if (_userMoves.contains(1) || _userMoves.contains(5)) {
            return 2;
          } else {
            return 6;
          }
        } else {
          if (_userMoves.contains(1) || _userMoves.contains(3)) {
            return 0;
          } else {
            return 8;
          }
        }
      }
    } else {
      if (_userMoves.last == 8 - _selfMoves.first) {
        if ([0, 8].contains(_userMoves.last)) {
          var returnedValuesList = [2, 6]..shuffle();
          return returnedValuesList.first;
        } else {
          var returnedValuesList = [0, 8]..shuffle();
          return returnedValuesList.first;
        }
      } else {
        return (8 - _userMoves.last);
      }
    }
  }

  int _thirdMove() {
    List<int> availableMoves = [];
    for (int i = 0; i < 9; i++) {
      if ((_selfMoves + _userMoves).contains(i)) {
        continue;
      } else {
        availableMoves.add(i);
      }
    }
    availableMoves.shuffle();
    return availableMoves.first;
  }
}
