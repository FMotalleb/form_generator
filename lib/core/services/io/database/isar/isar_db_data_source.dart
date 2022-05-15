import 'package:isar/isar.dart';

class IsarDbDataSource {
  final Isar _isar;
  IsarDbDataSource({required Isar isar}) : _isar = isar;

  Future<T> write<T>(
    Future<T> Function(Isar) callback, {
    bool silent = false,
  }) =>
      _isar.writeTxn(
        callback,
        silent: silent,
      );
  Future<T> read<T>(
    Future<T> Function(Isar) callback,
  ) =>
      _isar.txn(
        callback,
      );
  Future<void> clean() => _isar.clear();
}
