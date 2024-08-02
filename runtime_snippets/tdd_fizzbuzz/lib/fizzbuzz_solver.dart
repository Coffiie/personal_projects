class FizzBuzzSolver {
  String solve(int number) {
    final multipleOfThree = _isMultipleOf(3, number);
    final multipleOfFive = _isMultipleOf(5, number);
    if (multipleOfFive && multipleOfThree) {
      return "FizzBuzz";
    }
    if (multipleOfThree) {
      return "Fizz";
    }
    if (multipleOfFive) {
      return "Buzz";
    }
    return number.toString();
  }

  bool _isMultipleOf(int number, int input) {
    return input % number == 0;
  }
}
