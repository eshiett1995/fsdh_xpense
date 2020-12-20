import 'package:hive/hive.dart';

class Account extends HiveObject {
  int id;
  String name;
  String nuban;
  String cardNumber;
  String expiry;
  double balance;
  String bank;
  bool selected;

  Account({this.name, this.nuban, this.cardNumber, this.expiry, this.balance,
      this.bank, this.selected, this.id});

  Account.fromJson(Map<String, dynamic> json) :
        id = json['id'],
        name = json['name'],
        nuban = json['nuban'],
        cardNumber = json['cardNumber'],
        expiry = json['expiry'],
        balance = json['balance'],
        bank = json['bank'],
        selected = json['selected'];
}

class AccountAdapter extends TypeAdapter<Account> {
  @override
  final typeId = 0;

  @override
  Account read(BinaryReader reader) {
    return Account(
      id: reader.read(),
      name: reader.read(),
      nuban: reader.read(),
      cardNumber: reader.read(),
      expiry: reader.read(),
      balance: reader.read(),
      bank: reader.read(),
      selected: reader.readBool(),
    );
  }

  @override
  void write(BinaryWriter writer, Account obj) {
    writer.write(obj.id);
    writer.write(obj.name);
    writer.write(obj.nuban);

    writer.write(obj.cardNumber);
    writer.write(obj.expiry);
    writer.write(obj.balance);
    writer.write(obj.bank);

    writer.writeBool(obj.selected);
  }
}