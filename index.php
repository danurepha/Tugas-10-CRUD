<?php include("tersambung.php"); ?>

<!DOCTYPE html>
<html>

<head>
    <title>Indomarco Crud</title>
</head>

<body>

    <nav>
        <a href="add.php">[+] Tambah Baru</a>
        <?php if(isset($_GET['status'])): ?>
        <p>
            <?php
            if($_GET['status'] == 'sukses'){
                echo "Pendaftaran customer baru berhasil!";
            } else {
                echo "Pendaftaran gagal!";
            }
        ?>
        </p>
        <?php endif; ?>
        Hasilnya:
    </nav>

    <br>

    <table border="1">
        <thead>
            <tr>
                <th>Kode Barang</th>
                <th>Nama Barang</th>
                <th>Harga Satuan</th>
                <th>Stok</th>
                <th>Tindakan</th>
            </tr>
        </thead>
        <tbody>

            <?php
        $sql = "SELECT * FROM barang";
        $query = mysqli_query($db, $sql);

        while($br = mysqli_fetch_array($query)){
            echo "<tr>";

            echo "<td>".$br['kode_barang']."</td>";
            echo "<td>".$br['nama_barang']."</td>";
            echo "<td>".$br['harga_satuan']."</td>";
            echo "<td>".$br['stok']."</td>";

            echo "<td>";
            echo "<a href='edit.php?id=".$br['id']."'>Edit</a> | ";
            echo "<a href='delete.php?id=".$br['id']."'>Hapus</a>";
            echo "</td>";

            echo "</tr>";
        }
        ?>

        </tbody>
    </table>

    <p>Total: <?php echo mysqli_num_rows($query) ?></p>

</body>

</html>