<!DOCTYPE html>
<html>

<head>
    <title>Tambah Barang</title>
</head>

<body>
    <header>
        <h3>Menambahkan Barang baru</h3>
    </header>

    <form action="proses-add.php" method="POST">

        <fieldset>
            <p>
                <label for="nama">Kode Barang: </label>
                <input type="text" name="kode_barang" placeholder="Masukkan Kode Barang" />
            </p>
            <p>
                <label for="alamat">Nama Barang: </label>
                <input type="text" name="nama_barang" placeholder="Masukkan Nama Barang" />
            </p>
            <p>
                <label for="harga">Harga Satuan: </label>
                <input type="text" name="harga_satuan" placeholder="Masukkan Harga Satuan" />
            </p>
            <p>
                <label for="stok">Stok Barang: </label>
                <input type="text" name="stok" placeholder="Masukkan Stok Barang `" />
            </p>
            <p>
                <input type="submit" value="Tambahkan" name="tambah" />
            </p>

        </fieldset>

    </form>

</body>

</html>