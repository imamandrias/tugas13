class Mahasiswa{
  int id;
  String nama;
  String tanggal_lahir;
  String email;
  String nomor_hp;
  String username;
  String password;
  String alamat;
  String fakultas;
  String jurusan;

  Mahasiswa({this.id, this.nama, this.tanggal_lahir, this.email, this.nomor_hp,
      this.username, this.password, this.alamat, this.fakultas, this.jurusan});

  Map<String, dynamic> toMap(){
    var map = Map<String, dynamic>();
    if(id != null){
      map['id'] = id;
    }
    map['nama'] = nama;
    map['tanggal_lahir'] = tanggal_lahir;
    map['email'] = email;
    map['nomor_hp'] = nomor_hp;
    map['username'] = username;
    map['password'] = password;
    map['alamat'] = alamat;
    map['fakultas'] = fakultas;
    map['jurusan'] = jurusan;
    return map;
  }
  Mahasiswa.fromMap(Map<String, dynamic> map){
    this.id = map['id'];
    this.nama = map['nama'];
    this.tanggal_lahir = map['tanggal_lahir'];
    this.email = map['email'];
    this.nomor_hp = map['nomor_hp'];
    this.username = map['username'];
    this.password = map['password'];
    this.alamat = map['alamat'];
    this.fakultas = map['fakultas'];
    this.jurusan = map['jurusan'];
  }
}