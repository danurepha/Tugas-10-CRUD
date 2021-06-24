<?php

include("tersambung.php");

if(isset($_POST['simpan'])){

    $id = $_POST['id'];
    $kode = $_POST['kode_barang'];
    $nama = $_POST['nama_barang'];
    $harga = $_POST['harga_satuan'];
    $stok = $_POST['stok'];

    $sql = "UPDATE barang SET kode_barang='$kode', nama_barang='$nama', harga_satuan='$harga', stok='$stok' WHERE id=$id";
    $query = mysqli_query($db, $sql);

    if( $query ) {
        header('Location: index.php');
    } else {
        die("Gagal menyimpan perubahan...");
    }


} else {
    die("Akses dilarang...");
}

?>