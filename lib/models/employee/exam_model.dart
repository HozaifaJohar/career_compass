///employees/apply_to_exam
///
import 'dart:convert';

List<Exam> examFromJson(String str) => List<Exam>.from(json.decode(str).map((x) => Exam.fromJson(x)));

String examToJson(List<Exam> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Exam {
    int id;
    String question;
    String a;
    String b;
    String c;
    String d;
    String answer;

    Exam({
        required this.id,
        required this.question,
        required this.a,
        required this.b,
        required this.c,
        required this.d,
        required this.answer,
    });

    factory Exam.fromJson(Map<String, dynamic> json) => Exam(
        id: json["id"],
        question: json["question"],
        a: json["a"],
        b: json["b"],
        c: json["c"],
        d: json["d"],
        answer: json["answer"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "question": question,
        "a": a,
        "b": b,
        "c": c,
        "d": d,
        "answer": answer,
    };
}
