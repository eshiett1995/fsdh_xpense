import 'package:hive/hive.dart';

class Budget extends HiveObject{
  int id;
  String name;
  String period;
  double amount;
  int time;
  double remaining;


  Budget({
      this.id, this.name, this.period, this.amount, this.time, this.remaining});

  Budget.fromJson(Map<String, dynamic> json) :
        id = json['id'],
        name = json['name'],
        period = json['period'],
        amount = json['amount'],
        time = json['time'],
        remaining = json['remaining'];
}

class BudgetAdapter extends TypeAdapter<Budget> {
  @override
  final typeId = 1;

  @override
  Budget read(BinaryReader reader) {
    return Budget(
      id: reader.read(),
      name: reader.read(),
      period: reader.read(),
      amount: reader.read(),
      time: reader.read(),
      remaining: reader.read(),
    );
  }

  @override
  void write(BinaryWriter writer, Budget obj) {
    writer.write(obj.id);
    writer.write(obj.name);
    writer.write(obj.period);

    writer.write(obj.amount);
    writer.write(obj.time);
    writer.write(obj.remaining);
  }
}