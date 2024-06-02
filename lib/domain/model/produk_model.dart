class ProdukData {
  bool? isValid;
  Data? data;

  ProdukData({this.isValid, this.data});

  ProdukData.fromJson(Map<String, dynamic> json) {
    isValid = json['is_valid'];
    data = json['data'] != null ? new Data.fromJson(json['data']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['is_valid'] = this.isValid;
    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }
    return data;
  }
}

class Data {
  int? id;
  int? jenisProdukId;
  String? namaProduk;
  int? harga;
  String? barcode;
  String? gambarProduk;
  String? createdAt;
  String? updatedAt;
  JenisProduk? jenisProduk;

  Data(
      {this.id,
      this.jenisProdukId,
      this.namaProduk,
      this.harga,
      this.barcode,
      this.gambarProduk,
      this.createdAt,
      this.updatedAt,
      this.jenisProduk});

  Data.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    jenisProdukId = json['jenis_produk_id'];
    namaProduk = json['nama_produk'];
    harga = json['harga'];
    barcode = json['barcode'];
    gambarProduk = json['gambar_produk'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    jenisProduk = json['jenis_produk'] != null
        ? new JenisProduk.fromJson(json['jenis_produk'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['jenis_produk_id'] = this.jenisProdukId;
    data['nama_produk'] = this.namaProduk;
    data['harga'] = this.harga;
    data['barcode'] = this.barcode;
    data['gambar_produk'] = this.gambarProduk;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    if (this.jenisProduk != null) {
      data['jenis_produk'] = this.jenisProduk!.toJson();
    }
    return data;
  }
}

class JenisProduk {
  int? id;
  String? jenisProduk;
  Null? createdAt;
  String? updatedAt;

  JenisProduk({this.id, this.jenisProduk, this.createdAt, this.updatedAt});

  JenisProduk.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    jenisProduk = json['jenis_produk'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['jenis_produk'] = this.jenisProduk;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    return data;
  }
}
