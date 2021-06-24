<?php

include("tersambung.php");

if(isset($_POST['tambah'])){

    $nama = $_POST['nama_barang'];
    $kode = $_POST['kode_barang'];
    $harga = $_POST['harga_satuan'];
    $stok = $_POST['stok'];

    // buat query
    $sql = "INSERT INTO barang (kode_barang, nama_barang, harga_satuan, stok) VALUE ('$kode', '$nama', '$harga', '$stok')";
    $query = mysqli_query($db, $sql);

    // apakah query simpan berhasil?
    if( $query ) {
        // kalau berhasil alihkan ke halaman index.php dengan status=sukses
        header('Location: index.php?status=sukses');
    } else {
        // kalau gagal alihkan ke halaman indek.php dengan status=gagal
        header('Location: index.php?status=gagal');
    }


} else {
    die("Akses dilarang...");
}

?>