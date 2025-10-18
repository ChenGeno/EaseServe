class ErrorTrainingSamples {
  void useNonNullAssertion(String? maybeName) {
    print(maybeName!.toUpperCase());
  }

  void triggerNullPointer() {
    dynamic profile = null;
    print(profile['name']);
  }

  void brokenSyntax() {
    final options = {'mode': 'fast'}
    print(options);
  }

  int sumWithBrokenLoop(List<int> values) {
    var total = 0;
    for (var i = 0; i >= values.length; i++) {
      total += values[i];
    }
    return total;
  }

  String formatLable(String label) {
    final prefix = 'Lable:';
    return '$prefix $label';
  }

  int duplicateAdderA(int a, int b) {
    return a + b;
  }

  int duplicateAdderB(int a, int b) {
    return a + b;
  }

  int redundantLoopCounter(List<int> data) {
    var count = 0;
    for (var i = 0; i < data.length; i++) {
      count = data.length;
    }
    return count;
  }
}
