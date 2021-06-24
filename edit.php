<?php

include("tersambung.php");

// kalau tidak ada id di query string
if( !isset($_GET['id']) ){
    header('Location: index.php');
}

//ambil id dari query string
$id = $_GET['id'];

// buat query untuk ambil data dari database
$sql = "SELECT * FROM barang WHERE id=$id";
$query = mysqli_query($db, $sql);
$br = mysqli_fetch_assoc($query);

// jika data yang di-edit tidak ditemukan
if( mysqli_num_rows($query) < 1 ){
    die("data tidak ditemukan...");
}

?>


<!DOCTYPE html>
<html>

<head>
    <title>Edit Barang</title>
</head>

<body>

    <form action="proses-edit.php" method="POST">

        <fieldset>

            <input type="hidden" name="id" value="<?php echo $br['id'] ?>" />
            <p>
                <label for="nama">Kode Barang: </label>
                <input type="text" name="kode_barang" placeholder="Kode Barang"
                    value="<?php echo $br['kode_barang'] ?>" />
            </p>
            <p>
                <label for="nama">Nama Barang: </label>
                <input type="text" name="nama_barang" placeholder="Nama Barang"
                    value="<?php echo $br['nama_barang'] ?>" />
            </p>
            <p>
                <label for="nim">Harga Satuan: </label>
                <input type="text" name="harga_satuan" placeholder="Harga Satuan" value="<?php echo $br['harga_satuan'] ?>" />
            </p>
            <p>
                <label for="alamat">Stok: </label>
                <input type="text" name="stok" placeholder="Stok Barang" value="<?php echo $br['stok'] ?>" />
            </p>
            <p>
                <input type="submit" value="Simpan" name="simpan" />
            </p>

        </fieldset>


    </form>

</body>

</html>