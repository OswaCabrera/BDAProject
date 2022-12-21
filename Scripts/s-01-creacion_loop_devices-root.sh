#!/bin/bash

#--@Autor: Oswaldo Cabrera Pérez
#          Edgar García          
#--@Fecha creación: 21/12/2022
#--@Descripción: Creación de loop devices 

echo "Creando dispositivos con loop devices"

cd /unam-bda/disk-images

echo "Creando disk*.img"

dd if=/dev/zero of=disk4.img bs=100M count=10
dd if=/dev/zero of=disk5.img bs=100M count=10
dd if=/dev/zero of=disk6.img bs=100M count=10

echo "MOstrando la creación de los archivos"

du -sh disk*.img

echo "Asociando archivos img a loop devices"
losetup -fP disk1.img
losetup -fP disk2.img
losetup -fP disk3.img

losetup -a

echo "Dando formato ext4"
mkfs.ext4 disk1.img
mkfs.ext4 disk2.img
mkfs.ext4 disk3.img

echo "Creando los directorios (puntos de montaje)"
mkdir /unam-bda/d04
mkdir /unam-bda/d05
mkdir /unam-bda/d06

echo "!!!!!!!!!Modificar /etc/fstab¡¡¡¡¡¡¡"