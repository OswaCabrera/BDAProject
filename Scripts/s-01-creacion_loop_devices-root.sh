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
losetup -fP disk4.img
losetup -fP disk5.img
losetup -fP disk6.img

losetup -a

echo "Dando formato ext4"
mkfs.ext4 disk4.img
mkfs.ext4 disk5.img
mkfs.ext4 disk6.img

echo "Creando los directorios (puntos de montaje)"
mkdir /unam-bda/d10
mkdir /unam-bda/d11
mkdir /unam-bda/d12

echo "!!!!!!!!!Modificar /etc/fstab¡¡¡¡¡¡¡"