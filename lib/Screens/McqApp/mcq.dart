class MCQ {
  String question, option1, option2, option3, correctAnswer;
  MCQ({
    required this.question,
    required this.option1,
    required this.option2,
    required this.option3,
    required this.correctAnswer,
  });
  static List<MCQ> mcqs = [
    MCQ(
      question: "Which data type is used to store whole numbers in Java?",
      option1: "int",
      option2: "float",
      option3: "double",
      correctAnswer: "int",
    ),
    MCQ(
      question: "Which keyword is used to define a class in Java?",
      option1: "class",
      option2: "struct",
      option3: "define",
      correctAnswer: "class",
    ),
    MCQ(
      question: "Which operator is used to compare two values in Java?",
      option1: "==",
      option2: "=",
      option3: "===",
      correctAnswer: "==",
    ),
    MCQ(
      question: "Which method is the entry point of a Java program?",
      option1: "start()",
      option2: "main()",
      option3: "run()",
      correctAnswer: "main()",
    ),
    MCQ(
      question: "Which keyword is used to stop inheritance in Java?",
      option1: "static",
      option2: "final",
      option3: "const",
      correctAnswer: "final",
    ),
    MCQ(
      question: "Which collection class allows key-value pairs in Java?",
      option1: "ArrayList",
      option2: "HashMap",
      option3: "Vector",
      correctAnswer: "HashMap",
    ),
    MCQ(
      question: "Which loop is guaranteed to execute at least once?",
      option1: "for",
      option2: "while",
      option3: "do-while",
      correctAnswer: "do-while",
    ),
    MCQ(
      question: "Which keyword is used to create an object in Java?",
      option1: "object",
      option2: "new",
      option3: "class",
      correctAnswer: "new",
    ),
    MCQ(
      question: "Which package contains the Scanner class in Java?",
      option1: "java.util",
      option2: "java.io",
      option3: "java.net",
      correctAnswer: "java.util",
    ),
    MCQ(
      question: "Which exception is thrown when dividing a number by zero in Java?",
      option1: "NullPointerException",
      option2: "ArithmeticException",
      option3: "IOException",
      correctAnswer: "ArithmeticException",
    ),
  ];
}
