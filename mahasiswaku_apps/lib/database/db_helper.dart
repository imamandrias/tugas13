import 'package:mahasiswaku_apps/model/model_mahasiswa.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class DbHelper{
  static final DbHelper _instance = DbHelper._internal();
  //variabel untuk menampung object database
  static Database _database;

  final String namaTabel = 'tb_mahasiswa';
  final String kolomId = 'id';
  final String kolomNama = 'nama';
  final String kolomTanggalLahir = 'tgl_lahir';
  final String kolomEmail = 'email';
  final String kolomNomorHp = 'nomor_hp';
  final String kolomUsername = 'username';
  final String kolomPassword = 'password';
  final String kolomAlamat = 'alamat';
  final String kolomFakultas = 'fakultas';
  final String kolomJurusan = 'jurusan';

  DbHelper._internal();
  factory DbHelper() => _instance;

  Future<Database> get _db async{
    if(_database != null){
      return _database;
    }
    _database = await _initDb();
    return _database;
  }

  //Saat Aplikasi pertama di build, akan membuat database beserta isinya
  Future<Database> _initDb() async{
    String databasePath = await getDatabasesPath();
    String path = join(databasePath, 'mahasiswa.db');

    return await openDatabase(path, version: 1, onCreate: _onCreate);
  }

  Future<void> _onCreate(Database db, int version) async{
    var sql = 'CREATE TABLE $namaTabel('
        '$kolomId INTEGER PRIMARY KEY,'
        '$kolomNama TEXT,'
        '$kolomTanggalLahir TEXT,'
        '$kolomEmail TEXT,'
        '$kolomNomorHp TEXT,'
        '$kolomUsername TEXT,'
        '$kolomPassword TEXT,'
        '$kolomAlamat TEXT,'
        '$kolomFakultas TEXT,'
        '$kolomJurusan TEXT)';
    await db.execute(sql);
  }

  Future<int> simpanMahasiswa(Mahasiswa mahasiswa) async{
    var dbClient = await _db;
    return await dbClient.insert(namaTabel, mahasiswa.toMap());
  }

  Future<List> getAllMahasiswa() async{
    var dbClient = await _db;
    var result = await dbClient.query(namaTabel, columns: [
      kolomId,
      kolomNama,
      kolomTanggalLahir,
      kolomEmail,
      kolomNomorHp,
      kolomUsername,
      kolomPassword,
      kolomAlamat,
      kolomFakultas,
      kolomJurusan
    ]);
    return result.toList();
  }

  Future<int> updateMahasiswa(Mahasiswa mahasiswa) async{
    var dbClient = await _db;
    return await dbClient.update(namaTabel, mahasiswa.toMap(), where: '$kolomId = ?', whereArgs: [mahasiswa.id]);
  }

  Future<int> hapusMahasiswa(int id) async{
    var dbClient = await _db;
    return await dbClient.delete(namaTabel, where: '$kolomId = ?', whereArgs: [id]);
  }
}