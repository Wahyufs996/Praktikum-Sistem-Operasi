i=0
n=0


tampil(){
    if(( $n==0 ))
    then
        echo "Tidak Ada Jadwal Mata Kuliah."
    fi

    for((i=0;i<n;i++))
    do
        echo "|------------------------------------------------"
        echo "|Kode Matkul       : ${kode_matkul[$i]}          "
        echo "|Hari              : ${hari[$i]}                 "
        echo "|Jam               : ${jam[$i]}                  "
        echo "|Mata Kuliah       : ${matkul[$i]}               "
        echo ""
    done
}

cari_hari(){
    echo -n "Masukkan Hari : "
    read cari_hari
    a=0

    for((i=0;i<n;i++))
    do
        if(( $cari_hari == ${hari[$i]} ))
        then

          echo "|------------------------------------------------"
          echo "|Kode Matkul       : ${kode_matkul[$i]}          "
          echo "|Hari              : ${hari[$i]}                 "
          echo "|Jam               : ${jam[$i]}                  "
          echo "|Mata Kuliah       : ${matkul[$i]}               "
          echo ""

        fi
    done
}

tambah(){
    flag=0
    kode_cari=0
    echo -n "Kode Matkul  : "
    read kode_matkul_temp
    echo -n "Hari         : "
    read hari_temp
    echo -n "Jam          : "
    read jam_temp
    echo -n "Matkul       : "
    read matkul_temp

    for kode_cari in ${kode_matkul[*]}
    do
        if [[ $kode_cari == $kode_matkul_temp ]]
        then
            flag=1
            break
        fi
    done

    if [[ $flag == 1 ]]
    then
        echo "Kode Matkul Sudah ada!"
    else
        kode_matkul[$i]=$kode_matkul_temp
        hari[$i]=$hari_temp
        jam[$i]=$jam_temp
        matkul[$i]=$matkul_temp
        i=$i+1
        n=$n+1
    fi
}


ubah(){
    echo -n "Masukkan kode matkul  : "
    read update_kode

    for((i=0;i<n;i++))
    do
        if(( $update_kode == ${kode_matkul[$i]} ))
        then
            u=0
            echo "Kode Matkul  : ${update_kode}"
            echo ""
            echo -n "Hari         : "
            read hari_temp
            echo -n "Jam          : "
            read jam_temp
            echo -n "Matkul       : "
            read matkul_temp


            hari[$i]=$hari_temp
            jam[$i]=$jam_temp
            matkul[$i]=$matkul_temp
            break
        else
          echo "Kode Matkul Tidak Ada"
        fi
    done
}

hapus(){
    echo -n "Masukkan Kode Matkul : "
    read hapus_kode

    for((i=0;i<n;i++))
    do
        if(( $hapus_kode == ${kode_matkul[$i]} ))
        then
            unset kode_matkul[$i]
            unset hari[$i]
            unset jam[$i]
            unset matkul[$i]

            echo "Jadwal Mata Kuliah Dihapus"

            kode_matkul=( "${kode_matkul[@]}" )
            hari=( "${hari[@]}" )
            jam=( "${jam[@]}" )
            matkul=( "${matkul[@]}" )
            n=$n-1
            break
        else
          echo "Kode Matkul Tidak Ada"
        fi
    done
}
#--------------------------MAIN
while :;
do
    echo "|---------------------------------------------------------|"
    echo "|                  Daftar Jadwal Kuliah                   |"
    echo "|---------------------------------------------------------|"

    echo " Menu : "
    echo " 1. Tambah Jadwal"
    echo " 2. Tampil Jadwal"
    echo " 3. Cari Jadwal Hari"
    echo " 4. Ubah Jadwal"
    echo " 5. Hapus Jadwal"
    echo " 0. Exit"
    echo ""
    echo -n "Pilih : "
    read pilih

    if(( $pilih == 1 ))
    then
        clear
        tambah
	echo "Berhasil menambah jadwal hari ${hari_temp}"
	echo ""
	echo "Tekan sembarang tombol untuk lanjut."
	read hold
        clear
    elif(( $pilih == 2 ))
    then
        clear
        tampil
	read hold
	clear
    elif(( $pilih == 3 ))
    then
        clear
        cari_hari
	read hold
	clear
    elif(( $pilih == 4 ))
    then
        clear
        ubah
	read hold
        clear
    elif(( $pilih == 5 ))
    then
        clear
        hapus
	read hold
	clear

    elif(( $pilih == 0 ))
    then
	echo "Keluar dari program"
	echo "Terima Kasih"
        exit
    else
        echo "Maaf, inputan tidak ada!"
    fi
done
