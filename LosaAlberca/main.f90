PROGRAM main
USE singular
IMPLICIT NONE

CHARACTER(len=100)::raw_data,cut_rawdata
CHARACTER(len=100)::acc_corregida,vel_nocorregida
CHARACTER(len=100)::vel_corregida,des_nocorregida
CHARACTER(len=100)::des_corregida
REAL(KIND=16)::mindes1,mindes2

REAL(KIND=16)::k5_1,k5_2,k5_3,k5_4,k5_5,k5_6,k5_7,k5_8,k5_9,k5_10,k5_11,k5_12,k5_13
REAL(KIND=16)::k10_1,k10_2,k10_3,k10_4,k10_5,k10_6,k10_7,k10_8,k10_9,k10_10,k10_11,k10_12,k10_13
REAL(KIND=16)::k75_1,k75_2,k75_3,k75_4,k75_5,k75_6,k75_7,k75_8,k75_9,k75_10,k75_11,k75_12,k75_13
REAL(KIND=16)::promedio1,promedio2,promedio3

raw_data = "LosaAlberca5_1.txt"
cut_rawdata = "LosaAlberca5_1_cut.txt"
acc_corregida = "LosaAlberca5_1_acccor.txt"
vel_nocorregida = "LosaAlberca5_1_velsin.txt"
vel_corregida = "LosaAlberca5_1_velcor.txt"
des_nocorregida = "LosaAlberca5_1_dessin.txt"
des_corregida = "LosaAlberca5_1_descor.txt"

CALL process(raw_data, cut_rawdata,acc_corregida,vel_nocorregida,vel_corregida,des_nocorregida,des_corregida,mindes2)
WRITE(*,*)"mindes2 es: ",mindes2

k5_1 = mindes2

raw_data = "LosaAlberca5_2.txt"
cut_rawdata = "LosaAlberca5_2_cut.txt"
acc_corregida = "LosaAlberca5_2_acccor.txt"
vel_nocorregida = "LosaAlberca5_2_velsin.txt"
vel_corregida = "LosaAlberca5_2_velcor.txt"
des_nocorregida = "LosaAlberca5_2_dessin.txt"
des_corregida = "LosaAlberca5_2_descor.txt"

CALL process(raw_data, cut_rawdata,acc_corregida,vel_nocorregida,vel_corregida,des_nocorregida,des_corregida,mindes2)
WRITE(*,*)"mindes2 es: ",mindes2

k5_2 = mindes2

raw_data = "LosaAlberca5_3.txt"
cut_rawdata = "LosaAlberca5_3_cut.txt"
acc_corregida = "LosaAlberca5_3_acccor.txt"
vel_nocorregida = "LosaAlberca5_3_velsin.txt"
vel_corregida = "LosaAlberca5_3_velcor.txt"
des_nocorregida = "LosaAlberca5_3_dessin.txt"
des_corregida = "LosaAlberca5_3_descor.txt"

CALL process(raw_data, cut_rawdata,acc_corregida,vel_nocorregida,vel_corregida,des_nocorregida,des_corregida,mindes2)
WRITE(*,*)"mindes2 es: ",mindes2

k5_3 = mindes2

raw_data = "LosaAlberca5_4.txt"
cut_rawdata = "LosaAlberca5_4_cut.txt"
acc_corregida = "LosaAlberca5_4_acccor.txt"
vel_nocorregida = "LosaAlberca5_4_velsin.txt"
vel_corregida = "LosaAlberca5_4_velcor.txt"
des_nocorregida = "LosaAlberca5_4_dessin.txt"
des_corregida = "LosaAlberca5_4_descor.txt"

CALL process(raw_data, cut_rawdata,acc_corregida,vel_nocorregida,vel_corregida,des_nocorregida,des_corregida,mindes2)
WRITE(*,*)"mindes2 es: ",mindes2

k5_4 = mindes2

raw_data = "LosaAlberca5_5.txt"
cut_rawdata = "LosaAlberca5_5_cut.txt"
acc_corregida = "LosaAlberca5_5_acccor.txt"
vel_nocorregida = "LosaAlberca5_5_velsin.txt"
vel_corregida = "LosaAlberca5_5_velcor.txt"
des_nocorregida = "LosaAlberca5_5_dessin.txt"
des_corregida = "LosaAlberca5_5_descor.txt"

CALL process(raw_data, cut_rawdata,acc_corregida,vel_nocorregida,vel_corregida,des_nocorregida,des_corregida,mindes2)
WRITE(*,*)"mindes2 es: ",mindes2

k5_5 = mindes2

raw_data = "LosaAlberca5_6.txt"
cut_rawdata = "LosaAlberca5_6_cut.txt"
acc_corregida = "LosaAlberca5_6_acccor.txt"
vel_nocorregida = "LosaAlberca5_6_velsin.txt"
vel_corregida = "LosaAlberca5_6_velcor.txt"
des_nocorregida = "LosaAlberca5_6_dessin.txt"
des_corregida = "LosaAlberca5_6_descor.txt"

CALL process(raw_data, cut_rawdata,acc_corregida,vel_nocorregida,vel_corregida,des_nocorregida,des_corregida,mindes2)
WRITE(*,*)"mindes2 es: ",mindes2

k5_6 = mindes2

raw_data = "LosaAlberca5_7.txt"
cut_rawdata = "LosaAlberca5_7_cut.txt"
acc_corregida = "LosaAlberca5_7_acccor.txt"
vel_nocorregida = "LosaAlberca5_7_velsin.txt"
vel_corregida = "LosaAlberca5_7_velcor.txt"
des_nocorregida = "LosaAlberca5_7_dessin.txt"
des_corregida = "LosaAlberca5_7_descor.txt"

CALL process(raw_data, cut_rawdata,acc_corregida,vel_nocorregida,vel_corregida,des_nocorregida,des_corregida,mindes2)
WRITE(*,*)"mindes2 es: ",mindes2

k5_7 = mindes2

raw_data = "LosaAlberca5_8.txt"
cut_rawdata = "LosaAlberca5_8_cut.txt"
acc_corregida = "LosaAlberca5_8_acccor.txt"
vel_nocorregida = "LosaAlberca5_8_velsin.txt"
vel_corregida = "LosaAlberca5_8_velcor.txt"
des_nocorregida = "LosaAlberca5_8_dessin.txt"
des_corregida = "LosaAlberca5_8_descor.txt"

CALL process(raw_data, cut_rawdata,acc_corregida,vel_nocorregida,vel_corregida,des_nocorregida,des_corregida,mindes2)
WRITE(*,*)"mindes2 es: ",mindes2

k5_8 = mindes2

raw_data = "LosaAlberca5_9.txt"
cut_rawdata = "LosaAlberca5_9_cut.txt"
acc_corregida = "LosaAlberca5_9_acccor.txt"
vel_nocorregida = "LosaAlberca5_9_velsin.txt"
vel_corregida = "LosaAlberca5_9_velcor.txt"
des_nocorregida = "LosaAlberca5_9_dessin.txt"
des_corregida = "LosaAlberca5_9_descor.txt"

CALL process(raw_data, cut_rawdata,acc_corregida,vel_nocorregida,vel_corregida,des_nocorregida,des_corregida,mindes2)
WRITE(*,*)"mindes2 es: ",mindes2

k5_9 = mindes2

raw_data = "LosaAlberca5_10.txt"
cut_rawdata = "LosaAlberca5_10_cut.txt"
acc_corregida = "LosaAlberca5_10_acccor.txt"
vel_nocorregida = "LosaAlberca5_10_velsin.txt"
vel_corregida = "LosaAlberca5_10_velcor.txt"
des_nocorregida = "LosaAlberca5_10_dessin.txt"
des_corregida = "LosaAlberca5_10_descor.txt"

CALL process(raw_data, cut_rawdata,acc_corregida,vel_nocorregida,vel_corregida,des_nocorregida,des_corregida,mindes2)
WRITE(*,*)"mindes2 es: ",mindes2

k5_10 = mindes2

raw_data = "LosaAlberca5_11.txt"
cut_rawdata = "LosaAlberca5_11_cut.txt"
acc_corregida = "LosaAlberca5_11_acccor.txt"
vel_nocorregida = "LosaAlberca5_11_velsin.txt"
vel_corregida = "LosaAlberca5_11_velcor.txt"
des_nocorregida = "LosaAlberca5_11_dessin.txt"
des_corregida = "LosaAlberca5_11_descor.txt"

CALL process(raw_data, cut_rawdata,acc_corregida,vel_nocorregida,vel_corregida,des_nocorregida,des_corregida,mindes2)
WRITE(*,*)"mindes2 es: ",mindes2

k5_11 = mindes2

raw_data = "LosaAlberca5_12.txt"
cut_rawdata = "LosaAlberca5_12_cut.txt"
acc_corregida = "LosaAlberca5_12_acccor.txt"
vel_nocorregida = "LosaAlberca5_12_velsin.txt"
vel_corregida = "LosaAlberca5_12_velcor.txt"
des_nocorregida = "LosaAlberca5_12_dessin.txt"
des_corregida = "LosaAlberca5_12_descor.txt"

CALL process(raw_data, cut_rawdata,acc_corregida,vel_nocorregida,vel_corregida,des_nocorregida,des_corregida,mindes2)
WRITE(*,*)"mindes2 es: ",mindes2

k5_12 = mindes2

raw_data = "LosaAlberca5_13.txt"
cut_rawdata = "LosaAlberca5_13_cut.txt"
acc_corregida = "LosaAlberca5_13_acccor.txt"
vel_nocorregida = "LosaAlberca5_13_velsin.txt"
vel_corregida = "LosaAlberca5_13_velcor.txt"
des_nocorregida = "LosaAlberca5_13_dessin.txt"
des_corregida = "LosaAlberca5_13_descor.txt"

CALL process(raw_data, cut_rawdata,acc_corregida,vel_nocorregida,vel_corregida,des_nocorregida,des_corregida,mindes2)
WRITE(*,*)"mindes2 es: ",mindes2

k5_13 = mindes2

!Ahora obtenemos el promedio de todos los desplazamientos
promedio1 = (k5_1+k5_2+k5_3+k5_4+k5_5+k5_6+k5_7+k5_8+k5_9+k5_10+k5_11+k5_12+k5_13)/13

raw_data = "LosaAlberca10_1.txt"
cut_rawdata = "LosaAlberca10_1_cut.txt"
acc_corregida = "LosaAlberca10_1_acccor.txt"
vel_nocorregida = "LosaAlberca10_1_velsin.txt"
vel_corregida = "LosaAlberca10_1_velcor.txt"
des_nocorregida = "LosaAlberca10_1_dessin.txt"
des_corregida = "LosaAlberca10_1_descor.txt"

CALL process(raw_data, cut_rawdata,acc_corregida,vel_nocorregida,vel_corregida,des_nocorregida,des_corregida,mindes2)
WRITE(*,*)"mindes2 es: ",mindes2

k10_1 = mindes2

raw_data = "LosaAlberca10_2.txt"
cut_rawdata = "LosaAlberca10_2_cut.txt"
acc_corregida = "LosaAlberca10_2_acccor.txt"
vel_nocorregida = "LosaAlberca10_2_velsin.txt"
vel_corregida = "LosaAlberca10_2_velcor.txt"
des_nocorregida = "LosaAlberca10_2_dessin.txt"
des_corregida = "LosaAlberca10_2_descor.txt"

CALL process(raw_data, cut_rawdata,acc_corregida,vel_nocorregida,vel_corregida,des_nocorregida,des_corregida,mindes2)
WRITE(*,*)"mindes2 es: ",mindes2

k10_2 = mindes2

raw_data = "LosaAlberca10_3.txt"
cut_rawdata = "LosaAlberca10_3_cut.txt"
acc_corregida = "LosaAlberca10_3_acccor.txt"
vel_nocorregida = "LosaAlberca10_3_velsin.txt"
vel_corregida = "LosaAlberca10_3_velcor.txt"
des_nocorregida = "LosaAlberca10_3_dessin.txt"
des_corregida = "LosaAlberca10_3_descor.txt"

CALL process(raw_data, cut_rawdata,acc_corregida,vel_nocorregida,vel_corregida,des_nocorregida,des_corregida,mindes2)
WRITE(*,*)"mindes2 es: ",mindes2

k10_3 = mindes2

raw_data = "LosaAlberca10_4.txt"
cut_rawdata = "LosaAlberca10_4_cut.txt"
acc_corregida = "LosaAlberca10_4_acccor.txt"
vel_nocorregida = "LosaAlberca10_4_velsin.txt"
vel_corregida = "LosaAlberca10_4_velcor.txt"
des_nocorregida = "LosaAlberca10_4_dessin.txt"
des_corregida = "LosaAlberca10_4_descor.txt"

CALL process(raw_data, cut_rawdata,acc_corregida,vel_nocorregida,vel_corregida,des_nocorregida,des_corregida,mindes2)
WRITE(*,*)"mindes2 es: ",mindes2

k10_4 = mindes2

raw_data = "LosaAlberca10_5.txt"
cut_rawdata = "LosaAlberca10_5_cut.txt"
acc_corregida = "LosaAlberca10_5_acccor.txt"
vel_nocorregida = "LosaAlberca10_5_velsin.txt"
vel_corregida = "LosaAlberca10_5_velcor.txt"
des_nocorregida = "LosaAlberca10_5_dessin.txt"
des_corregida = "LosaAlberca10_5_descor.txt"

CALL process(raw_data, cut_rawdata,acc_corregida,vel_nocorregida,vel_corregida,des_nocorregida,des_corregida,mindes2)
WRITE(*,*)"mindes2 es: ",mindes2

k10_5 = mindes2

raw_data = "LosaAlberca10_6.txt"
cut_rawdata = "LosaAlberca10_6_cut.txt"
acc_corregida = "LosaAlberca10_6_acccor.txt"
vel_nocorregida = "LosaAlberca10_6_velsin.txt"
vel_corregida = "LosaAlberca10_6_velcor.txt"
des_nocorregida = "LosaAlberca10_6_dessin.txt"
des_corregida = "LosaAlberca10_6_descor.txt"

CALL process(raw_data, cut_rawdata,acc_corregida,vel_nocorregida,vel_corregida,des_nocorregida,des_corregida,mindes2)
WRITE(*,*)"mindes2 es: ",mindes2

k10_6 = mindes2

raw_data = "LosaAlberca10_7.txt"
cut_rawdata = "LosaAlberca10_7_cut.txt"
acc_corregida = "LosaAlberca10_7_acccor.txt"
vel_nocorregida = "LosaAlberca10_7_velsin.txt"
vel_corregida = "LosaAlberca10_7_velcor.txt"
des_nocorregida = "LosaAlberca10_7_dessin.txt"
des_corregida = "LosaAlberca10_7_descor.txt"

CALL process(raw_data, cut_rawdata,acc_corregida,vel_nocorregida,vel_corregida,des_nocorregida,des_corregida,mindes2)
WRITE(*,*)"mindes2 es: ",mindes2

k10_7 = mindes2

raw_data = "LosaAlberca10_8.txt"
cut_rawdata = "LosaAlberca10_8_cut.txt"
acc_corregida = "LosaAlberca10_8_acccor.txt"
vel_nocorregida = "LosaAlberca10_8_velsin.txt"
vel_corregida = "LosaAlberca10_8_velcor.txt"
des_nocorregida = "LosaAlberca10_8_dessin.txt"
des_corregida = "LosaAlberca10_8_descor.txt"

CALL process(raw_data, cut_rawdata,acc_corregida,vel_nocorregida,vel_corregida,des_nocorregida,des_corregida,mindes2)
WRITE(*,*)"mindes2 es: ",mindes2

k10_8 = mindes2

raw_data = "LosaAlberca10_9.txt"
cut_rawdata = "LosaAlberca10_9_cut.txt"
acc_corregida = "LosaAlberca10_9_acccor.txt"
vel_nocorregida = "LosaAlberca10_9_velsin.txt"
vel_corregida = "LosaAlberca10_9_velcor.txt"
des_nocorregida = "LosaAlberca10_9_dessin.txt"
des_corregida = "LosaAlberca10_9_descor.txt"

CALL process(raw_data, cut_rawdata,acc_corregida,vel_nocorregida,vel_corregida,des_nocorregida,des_corregida,mindes2)
WRITE(*,*)"mindes2 es: ",mindes2

k10_9 = mindes2

raw_data = "LosaAlberca10_10.txt"
cut_rawdata = "LosaAlberca10_10_cut.txt"
acc_corregida = "LosaAlberca10_10_acccor.txt"
vel_nocorregida = "LosaAlberca10_10_velsin.txt"
vel_corregida = "LosaAlberca10_10_velcor.txt"
des_nocorregida = "LosaAlberca10_10_dessin.txt"
des_corregida = "LosaAlberca10_10_descor.txt"

CALL process(raw_data, cut_rawdata,acc_corregida,vel_nocorregida,vel_corregida,des_nocorregida,des_corregida,mindes2)
WRITE(*,*)"mindes2 es: ",mindes2

k10_10 = mindes2

raw_data = "LosaAlberca10_11.txt"
cut_rawdata = "LosaAlberca10_11_cut.txt"
acc_corregida = "LosaAlberca10_11_acccor.txt"
vel_nocorregida = "LosaAlberca10_11_velsin.txt"
vel_corregida = "LosaAlberca10_11_velcor.txt"
des_nocorregida = "LosaAlberca10_11_dessin.txt"
des_corregida = "LosaAlberca10_11_descor.txt"

CALL process(raw_data, cut_rawdata,acc_corregida,vel_nocorregida,vel_corregida,des_nocorregida,des_corregida,mindes2)
WRITE(*,*)"mindes2 es: ",mindes2

k10_11 = mindes2

raw_data = "LosaAlberca10_12.txt"
cut_rawdata = "LosaAlberca10_12_cut.txt"
acc_corregida = "LosaAlberca10_12_acccor.txt"
vel_nocorregida = "LosaAlberca10_12_velsin.txt"
vel_corregida = "LosaAlberca10_12_velcor.txt"
des_nocorregida = "LosaAlberca10_12_dessin.txt"
des_corregida = "LosaAlberca10_12_descor.txt"

CALL process(raw_data, cut_rawdata,acc_corregida,vel_nocorregida,vel_corregida,des_nocorregida,des_corregida,mindes2)
WRITE(*,*)"mindes2 es: ",mindes2

k10_12 = mindes2

raw_data = "LosaAlberca10_13.txt"
cut_rawdata = "LosaAlberca10_13_cut.txt"
acc_corregida = "LosaAlberca10_13_acccor.txt"
vel_nocorregida = "LosaAlberca10_13_velsin.txt"
vel_corregida = "LosaAlberca10_13_velcor.txt"
des_nocorregida = "LosaAlberca10_13_dessin.txt"
des_corregida = "LosaAlberca10_13_descor.txt"

CALL process(raw_data, cut_rawdata,acc_corregida,vel_nocorregida,vel_corregida,des_nocorregida,des_corregida,mindes2)
WRITE(*,*)"mindes2 es: ",mindes2

k10_13 = mindes2

!Ahora obtenemos el promedio de todos los desplazamientos
promedio2 = (k10_1+k10_2+k10_3+k10_4+k10_5+k10_6+k10_7+k10_8+k10_9+k10_10+k10_11+k10_12+k10_13)/13

raw_data = "LosaAlberca75_1.txt"
cut_rawdata = "LosaAlberca75_1_cut.txt"
acc_corregida = "LosaAlberca75_1_acccor.txt"
vel_nocorregida = "LosaAlberca75_1_velsin.txt"
vel_corregida = "LosaAlberca75_1_velcor.txt"
des_nocorregida = "LosaAlberca75_1_dessin.txt"
des_corregida = "LosaAlberca75_1_descor.txt"

CALL process(raw_data, cut_rawdata,acc_corregida,vel_nocorregida,vel_corregida,des_nocorregida,des_corregida,mindes2)
WRITE(*,*)"mindes2 es: ",mindes2

k75_1 = mindes2

raw_data = "LosaAlberca75_2.txt"
cut_rawdata = "LosaAlberca75_2_cut.txt"
acc_corregida = "LosaAlberca75_2_acccor.txt"
vel_nocorregida = "LosaAlberca75_2_velsin.txt"
vel_corregida = "LosaAlberca75_2_velcor.txt"
des_nocorregida = "LosaAlberca75_2_dessin.txt"
des_corregida = "LosaAlberca75_2_descor.txt"

CALL process(raw_data, cut_rawdata,acc_corregida,vel_nocorregida,vel_corregida,des_nocorregida,des_corregida,mindes2)
WRITE(*,*)"mindes2 es: ",mindes2

k75_2 = mindes2

raw_data = "LosaAlberca75_3.txt"
cut_rawdata = "LosaAlberca75_3_cut.txt"
acc_corregida = "LosaAlberca75_3_acccor.txt"
vel_nocorregida = "LosaAlberca75_3_velsin.txt"
vel_corregida = "LosaAlberca75_3_velcor.txt"
des_nocorregida = "LosaAlberca75_3_dessin.txt"
des_corregida = "LosaAlberca75_3_descor.txt"

CALL process(raw_data, cut_rawdata,acc_corregida,vel_nocorregida,vel_corregida,des_nocorregida,des_corregida,mindes2)
WRITE(*,*)"mindes2 es: ",mindes2

k75_3 = mindes2

raw_data = "LosaAlberca75_4.txt"
cut_rawdata = "LosaAlberca75_4_cut.txt"
acc_corregida = "LosaAlberca75_4_acccor.txt"
vel_nocorregida = "LosaAlberca75_4_velsin.txt"
vel_corregida = "LosaAlberca75_4_velcor.txt"
des_nocorregida = "LosaAlberca75_4_dessin.txt"
des_corregida = "LosaAlberca75_4_descor.txt"

CALL process(raw_data, cut_rawdata,acc_corregida,vel_nocorregida,vel_corregida,des_nocorregida,des_corregida,mindes2)
WRITE(*,*)"mindes2 es: ",mindes2

k75_4 = mindes2

raw_data = "LosaAlberca75_5.txt"
cut_rawdata = "LosaAlberca75_5_cut.txt"
acc_corregida = "LosaAlberca75_5_acccor.txt"
vel_nocorregida = "LosaAlberca75_5_velsin.txt"
vel_corregida = "LosaAlberca75_5_velcor.txt"
des_nocorregida = "LosaAlberca75_5_dessin.txt"
des_corregida = "LosaAlberca75_5_descor.txt"

CALL process(raw_data, cut_rawdata,acc_corregida,vel_nocorregida,vel_corregida,des_nocorregida,des_corregida,mindes2)
WRITE(*,*)"mindes2 es: ",mindes2

k75_5 = mindes2

raw_data = "LosaAlberca75_6.txt"
cut_rawdata = "LosaAlberca75_6_cut.txt"
acc_corregida = "LosaAlberca75_6_acccor.txt"
vel_nocorregida = "LosaAlberca75_6_velsin.txt"
vel_corregida = "LosaAlberca75_6_velcor.txt"
des_nocorregida = "LosaAlberca75_6_dessin.txt"
des_corregida = "LosaAlberca75_6_descor.txt"

CALL process(raw_data, cut_rawdata,acc_corregida,vel_nocorregida,vel_corregida,des_nocorregida,des_corregida,mindes2)
WRITE(*,*)"mindes2 es: ",mindes2

k75_6 = mindes2

raw_data = "LosaAlberca75_7.txt"
cut_rawdata = "LosaAlberca75_7_cut.txt"
acc_corregida = "LosaAlberca75_7_acccor.txt"
vel_nocorregida = "LosaAlberca75_7_velsin.txt"
vel_corregida = "LosaAlberca75_7_velcor.txt"
des_nocorregida = "LosaAlberca75_7_dessin.txt"
des_corregida = "LosaAlberca75_7_descor.txt"

CALL process(raw_data, cut_rawdata,acc_corregida,vel_nocorregida,vel_corregida,des_nocorregida,des_corregida,mindes2)
WRITE(*,*)"mindes2 es: ",mindes2

k75_7 = mindes2

raw_data = "LosaAlberca75_8.txt"
cut_rawdata = "LosaAlberca75_8_cut.txt"
acc_corregida = "LosaAlberca75_8_acccor.txt"
vel_nocorregida = "LosaAlberca75_8_velsin.txt"
vel_corregida = "LosaAlberca75_8_velcor.txt"
des_nocorregida = "LosaAlberca75_8_dessin.txt"
des_corregida = "LosaAlberca75_8_descor.txt"

CALL process(raw_data, cut_rawdata,acc_corregida,vel_nocorregida,vel_corregida,des_nocorregida,des_corregida,mindes2)
WRITE(*,*)"mindes2 es: ",mindes2

k75_8 = mindes2

raw_data = "LosaAlberca75_9.txt"
cut_rawdata = "LosaAlberca75_9_cut.txt"
acc_corregida = "LosaAlberca75_9_acccor.txt"
vel_nocorregida = "LosaAlberca75_9_velsin.txt"
vel_corregida = "LosaAlberca75_9_velcor.txt"
des_nocorregida = "LosaAlberca75_9_dessin.txt"
des_corregida = "LosaAlberca75_9_descor.txt"

CALL process(raw_data, cut_rawdata,acc_corregida,vel_nocorregida,vel_corregida,des_nocorregida,des_corregida,mindes2)
WRITE(*,*)"mindes2 es: ",mindes2

k75_9 = mindes2

raw_data = "LosaAlberca75_10.txt"
cut_rawdata = "LosaAlberca75_10_cut.txt"
acc_corregida = "LosaAlberca75_10_acccor.txt"
vel_nocorregida = "LosaAlberca75_10_velsin.txt"
vel_corregida = "LosaAlberca75_10_velcor.txt"
des_nocorregida = "LosaAlberca75_10_dessin.txt"
des_corregida = "LosaAlberca75_10_descor.txt"

CALL process(raw_data, cut_rawdata,acc_corregida,vel_nocorregida,vel_corregida,des_nocorregida,des_corregida,mindes2)
WRITE(*,*)"mindes2 es: ",mindes2

k75_10 = mindes2

raw_data = "LosaAlberca75_11.txt"
cut_rawdata = "LosaAlberca75_11_cut.txt"
acc_corregida = "LosaAlberca75_11_acccor.txt"
vel_nocorregida = "LosaAlberca75_11_velsin.txt"
vel_corregida = "LosaAlberca75_11_velcor.txt"
des_nocorregida = "LosaAlberca75_11_dessin.txt"
des_corregida = "LosaAlberca75_11_descor.txt"

CALL process(raw_data, cut_rawdata,acc_corregida,vel_nocorregida,vel_corregida,des_nocorregida,des_corregida,mindes2)
WRITE(*,*)"mindes2 es: ",mindes2

k75_11 = mindes2

raw_data = "LosaAlberca75_12.txt"
cut_rawdata = "LosaAlberca75_12_cut.txt"
acc_corregida = "LosaAlberca75_12_acccor.txt"
vel_nocorregida = "LosaAlberca75_12_velsin.txt"
vel_corregida = "LosaAlberca75_12_velcor.txt"
des_nocorregida = "LosaAlberca75_12_dessin.txt"
des_corregida = "LosaAlberca75_12_descor.txt"

CALL process(raw_data, cut_rawdata,acc_corregida,vel_nocorregida,vel_corregida,des_nocorregida,des_corregida,mindes2)
WRITE(*,*)"mindes2 es: ",mindes2

k75_12 = mindes2

raw_data = "LosaAlberca75_13.txt"
cut_rawdata = "LosaAlberca75_13_cut.txt"
acc_corregida = "LosaAlberca75_13_acccor.txt"
vel_nocorregida = "LosaAlberca75_13_velsin.txt"
vel_corregida = "LosaAlberca75_13_velcor.txt"
des_nocorregida = "LosaAlberca75_13_dessin.txt"
des_corregida = "LosaAlberca75_13_descor.txt"

CALL process(raw_data, cut_rawdata,acc_corregida,vel_nocorregida,vel_corregida,des_nocorregida,des_corregida,mindes2)
WRITE(*,*)"mindes2 es: ",mindes2

k75_13 = mindes2

!Ahora obtenemos el promedio de todos los desplazamientos
promedio3 = (k75_1+k75_2+k75_3+k75_4+k75_5+k75_6+k75_7+k75_8+k75_9+k75_10+k75_11+k75_12+k75_13)/13

WRITE(*,*)"El desplazamiento promedio para archivos con 5 es : ",promedio1
WRITE(*,*)"El desplazamiento promedio para archivos con 10 es : ",promedio2
WRITE(*,*)"El desplazamiento promedio para archivos con 75 es : ",promedio3
