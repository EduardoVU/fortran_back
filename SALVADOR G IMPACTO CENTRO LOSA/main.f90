PROGRAM main
USE singular
IMPLICIT NONE

CHARACTER(len=100)::raw_data,cut_rawdata
CHARACTER(len=100)::acc_corregida,vel_nocorregida
CHARACTER(len=100)::vel_corregida,des_nocorregida
CHARACTER(len=100)::des_corregida
REAL(KIND=16)::mindes1,mindes2

REAL(KIND=16)::k5_1,k5_2,k5_3,k5_4,k5_5,k5_6,k5_7,k5_8,k5_9,k5_10,k5_11,k5_12,k5_13
REAL(KIND=16)::k10_1,k10_2,k10_3,k10_4,k10_5,k10_6,k10_7,k10_8,k10_9,k10_10,k10_11,k10_12,k10_13,k10_14
REAL(KIND=16)::k75_1,k75_2,k75_3,k75_4,k75_5,k75_6,k75_7,k75_8,k75_9,k75_10,k75_11,k75_12,k75_13,k75_14,k75_15
REAL(KIND=16)::promedio1,promedio2,promedio3

raw_data = "SALVADOR_G_CL_5KG_1.txt"
cut_rawdata = "SALVADOR_G_CL_5KG_1_cut.txt"
acc_corregida = "SALVADOR_G_CL_5KG_1_acccor.txt"
vel_nocorregida = "SALVADOR_G_CL_5KG_1_velsin.txt"
vel_corregida = "SALVADOR_G_CL_5KG_1_velcor.txt"
des_nocorregida = "SALVADOR_G_CL_5KG_1_dessin.txt"
des_corregida = "SALVADOR_G_CL_5KG_1_descor.txt"

CALL process(raw_data, cut_rawdata,acc_corregida,vel_nocorregida,vel_corregida,des_nocorregida,des_corregida,mindes2)
WRITE(*,*)"mindes2 es: ",mindes2

k5_1 = mindes2

raw_data = "SALVADOR_G_CL_5KG_2.txt"
cut_rawdata = "SALVADOR_G_CL_5KG_2_cut.txt"
acc_corregida = "SALVADOR_G_CL_5KG_2_acccor.txt"
vel_nocorregida = "SALVADOR_G_CL_5KG_2_velsin.txt"
vel_corregida = "SALVADOR_G_CL_5KG_2_velcor.txt"
des_nocorregida = "SALVADOR_G_CL_5KG_2_dessin.txt"
des_corregida = "SALVADOR_G_CL_5KG_2_descor.txt"

CALL process(raw_data, cut_rawdata,acc_corregida,vel_nocorregida,vel_corregida,des_nocorregida,des_corregida,mindes2)
WRITE(*,*)"mindes2 es: ",mindes2

k5_2 = mindes2

raw_data = "SALVADOR_G_CL_5KG_3.txt"
cut_rawdata = "SALVADOR_G_CL_5KG_3_cut.txt"
acc_corregida = "SALVADOR_G_CL_5KG_3_acccor.txt"
vel_nocorregida = "SALVADOR_G_CL_5KG_3_velsin.txt"
vel_corregida = "SALVADOR_G_CL_5KG_3_velcor.txt"
des_nocorregida = "SALVADOR_G_CL_5KG_3_dessin.txt"
des_corregida = "SALVADOR_G_CL_5KG_3_descor.txt"

CALL process(raw_data, cut_rawdata,acc_corregida,vel_nocorregida,vel_corregida,des_nocorregida,des_corregida,mindes2)
WRITE(*,*)"mindes2 es: ",mindes2

k5_3 = mindes2

raw_data = "SALVADOR_G_CL_5KG_4.txt"
cut_rawdata = "SALVADOR_G_CL_5KG_4_cut.txt"
acc_corregida = "SALVADOR_G_CL_5KG_4_acccor.txt"
vel_nocorregida = "SALVADOR_G_CL_5KG_4_velsin.txt"
vel_corregida = "SALVADOR_G_CL_5KG_4_velcor.txt"
des_nocorregida = "SALVADOR_G_CL_5KG_4_dessin.txt"
des_corregida = "SALVADOR_G_CL_5KG_4_descor.txt"

CALL process(raw_data, cut_rawdata,acc_corregida,vel_nocorregida,vel_corregida,des_nocorregida,des_corregida,mindes2)
WRITE(*,*)"mindes2 es: ",mindes2

k5_4 = mindes2

raw_data = "SALVADOR_G_CL_5KG_5.txt"
cut_rawdata = "SALVADOR_G_CL_5KG_5_cut.txt"
acc_corregida = "SALVADOR_G_CL_5KG_5_acccor.txt"
vel_nocorregida = "SALVADOR_G_CL_5KG_5_velsin.txt"
vel_corregida = "SALVADOR_G_CL_5KG_5_velcor.txt"
des_nocorregida = "SALVADOR_G_CL_5KG_5_dessin.txt"
des_corregida = "SALVADOR_G_CL_5KG_5_descor.txt"

CALL process(raw_data, cut_rawdata,acc_corregida,vel_nocorregida,vel_corregida,des_nocorregida,des_corregida,mindes2)
WRITE(*,*)"mindes2 es: ",mindes2

k5_5 = mindes2

raw_data = "SALVADOR_G_CL_5KG_6.txt"
cut_rawdata = "SALVADOR_G_CL_5KG_6_cut.txt"
acc_corregida = "SALVADOR_G_CL_5KG_6_acccor.txt"
vel_nocorregida = "SALVADOR_G_CL_5KG_6_velsin.txt"
vel_corregida = "SALVADOR_G_CL_5KG_6_velcor.txt"
des_nocorregida = "SALVADOR_G_CL_5KG_6_dessin.txt"
des_corregida = "SALVADOR_G_CL_5KG_6_descor.txt"

CALL process(raw_data, cut_rawdata,acc_corregida,vel_nocorregida,vel_corregida,des_nocorregida,des_corregida,mindes2)
WRITE(*,*)"mindes2 es: ",mindes2

k5_6 = mindes2

raw_data = "SALVADOR_G_CL_5KG_7.txt"
cut_rawdata = "SALVADOR_G_CL_5KG_7_cut.txt"
acc_corregida = "SALVADOR_G_CL_5KG_7_acccor.txt"
vel_nocorregida = "SALVADOR_G_CL_5KG_7_velsin.txt"
vel_corregida = "SALVADOR_G_CL_5KG_7_velcor.txt"
des_nocorregida = "SALVADOR_G_CL_5KG_7_dessin.txt"
des_corregida = "SALVADOR_G_CL_5KG_7_descor.txt"

CALL process(raw_data, cut_rawdata,acc_corregida,vel_nocorregida,vel_corregida,des_nocorregida,des_corregida,mindes2)
WRITE(*,*)"mindes2 es: ",mindes2

k5_7 = mindes2

raw_data = "SALVADOR_G_CL_5KG_8.txt"
cut_rawdata = "SALVADOR_G_CL_5KG_8_cut.txt"
acc_corregida = "SALVADOR_G_CL_5KG_8_acccor.txt"
vel_nocorregida = "SALVADOR_G_CL_5KG_8_velsin.txt"
vel_corregida = "SALVADOR_G_CL_5KG_8_velcor.txt"
des_nocorregida = "SALVADOR_G_CL_5KG_8_dessin.txt"
des_corregida = "SALVADOR_G_CL_5KG_8_descor.txt"

CALL process(raw_data, cut_rawdata,acc_corregida,vel_nocorregida,vel_corregida,des_nocorregida,des_corregida,mindes2)
WRITE(*,*)"mindes2 es: ",mindes2

k5_8 = mindes2

raw_data = "SALVADOR_G_CL_5KG_9.txt"
cut_rawdata = "SALVADOR_G_CL_5KG_9_cut.txt"
acc_corregida = "SALVADOR_G_CL_5KG_9_acccor.txt"
vel_nocorregida = "SALVADOR_G_CL_5KG_9_velsin.txt"
vel_corregida = "SALVADOR_G_CL_5KG_9_velcor.txt"
des_nocorregida = "SALVADOR_G_CL_5KG_9_dessin.txt"
des_corregida = "SALVADOR_G_CL_5KG_9_descor.txt"

CALL process(raw_data, cut_rawdata,acc_corregida,vel_nocorregida,vel_corregida,des_nocorregida,des_corregida,mindes2)
WRITE(*,*)"mindes2 es: ",mindes2

k5_9 = mindes2

raw_data = "SALVADOR_G_CL_5KG_10.txt"
cut_rawdata = "SALVADOR_G_CL_5KG_10_cut.txt"
acc_corregida = "SALVADOR_G_CL_5KG_10_acccor.txt"
vel_nocorregida = "SALVADOR_G_CL_5KG_10_velsin.txt"
vel_corregida = "SALVADOR_G_CL_5KG_10_velcor.txt"
des_nocorregida = "SALVADOR_G_CL_5KG_10_dessin.txt"
des_corregida = "SALVADOR_G_CL_5KG_10_descor.txt"

CALL process(raw_data, cut_rawdata,acc_corregida,vel_nocorregida,vel_corregida,des_nocorregida,des_corregida,mindes2)
WRITE(*,*)"mindes2 es: ",mindes2

k5_10 = mindes2

raw_data = "SALVADOR_G_CL_5KG_11.txt"
cut_rawdata = "SALVADOR_G_CL_5KG_11_cut.txt"
acc_corregida = "SALVADOR_G_CL_5KG_11_acccor.txt"
vel_nocorregida = "SALVADOR_G_CL_5KG_11_velsin.txt"
vel_corregida = "SALVADOR_G_CL_5KG_11_velcor.txt"
des_nocorregida = "SALVADOR_G_CL_5KG_11_dessin.txt"
des_corregida = "SALVADOR_G_CL_5KG_11_descor.txt"

CALL process(raw_data, cut_rawdata,acc_corregida,vel_nocorregida,vel_corregida,des_nocorregida,des_corregida,mindes2)
WRITE(*,*)"mindes2 es: ",mindes2

k5_11 = mindes2

raw_data = "SALVADOR_G_CL_5KG_12.txt"
cut_rawdata = "SALVADOR_G_CL_5KG_12_cut.txt"
acc_corregida = "SALVADOR_G_CL_5KG_12_acccor.txt"
vel_nocorregida = "SALVADOR_G_CL_5KG_12_velsin.txt"
vel_corregida = "SALVADOR_G_CL_5KG_12_velcor.txt"
des_nocorregida = "SALVADOR_G_CL_5KG_12_dessin.txt"
des_corregida = "SALVADOR_G_CL_5KG_12_descor.txt"

CALL process(raw_data, cut_rawdata,acc_corregida,vel_nocorregida,vel_corregida,des_nocorregida,des_corregida,mindes2)
WRITE(*,*)"mindes2 es: ",mindes2

k5_12 = mindes2

raw_data = "SALVADOR_G_CL_5KG_13.txt"
cut_rawdata = "SALVADOR_G_CL_5KG_13_cut.txt"
acc_corregida = "SALVADOR_G_CL_5KG_13_acccor.txt"
vel_nocorregida = "SALVADOR_G_CL_5KG_13_velsin.txt"
vel_corregida = "SALVADOR_G_CL_5KG_13_velcor.txt"
des_nocorregida = "SALVADOR_G_CL_5KG_13_dessin.txt"
des_corregida = "SALVADOR_G_CL_5KG_13_descor.txt"

CALL process(raw_data, cut_rawdata,acc_corregida,vel_nocorregida,vel_corregida,des_nocorregida,des_corregida,mindes2)
WRITE(*,*)"mindes2 es: ",mindes2

k5_13 = mindes2

!Ahora obtenemos el promedio de todos los desplazamientos
promedio1 = (k5_1+k5_2+k5_3+k5_4+k5_5+k5_6+k5_7+k5_8+k5_9+k5_10+k5_11+k5_12+k5_13)/13

raw_data = "SALVADOR_G_CL_10KG_1.txt"
cut_rawdata = "SALVADOR_G_CL_10KG_1_cut.txt"
acc_corregida = "SALVADOR_G_CL_10KG_1_acccor.txt"
vel_nocorregida = "SALVADOR_G_CL_10KG_1_velsin.txt"
vel_corregida = "SALVADOR_G_CL_10KG_1_velcor.txt"
des_nocorregida = "SALVADOR_G_CL_10KG_1_dessin.txt"
des_corregida = "SALVADOR_G_CL_10KG_1_descor.txt"

CALL process(raw_data, cut_rawdata,acc_corregida,vel_nocorregida,vel_corregida,des_nocorregida,des_corregida,mindes2)
WRITE(*,*)"mindes2 es: ",mindes2

k10_1 = mindes2

raw_data = "SALVADOR_G_CL_10KG_2.txt"
cut_rawdata = "SALVADOR_G_CL_10KG_2_cut.txt"
acc_corregida = "SALVADOR_G_CL_10KG_2_acccor.txt"
vel_nocorregida = "SALVADOR_G_CL_10KG_2_velsin.txt"
vel_corregida = "SALVADOR_G_CL_10KG_2_velcor.txt"
des_nocorregida = "SALVADOR_G_CL_10KG_2_dessin.txt"
des_corregida = "SALVADOR_G_CL_10KG_2_descor.txt"

CALL process(raw_data, cut_rawdata,acc_corregida,vel_nocorregida,vel_corregida,des_nocorregida,des_corregida,mindes2)
WRITE(*,*)"mindes2 es: ",mindes2

k10_2 = mindes2

raw_data = "SALVADOR_G_CL_10KG_3.txt"
cut_rawdata = "SALVADOR_G_CL_10KG_3_cut.txt"
acc_corregida = "SALVADOR_G_CL_10KG_3_acccor.txt"
vel_nocorregida = "SALVADOR_G_CL_10KG_3_velsin.txt"
vel_corregida = "SALVADOR_G_CL_10KG_3_velcor.txt"
des_nocorregida = "SALVADOR_G_CL_10KG_3_dessin.txt"
des_corregida = "SALVADOR_G_CL_10KG_3_descor.txt"

CALL process(raw_data, cut_rawdata,acc_corregida,vel_nocorregida,vel_corregida,des_nocorregida,des_corregida,mindes2)
WRITE(*,*)"mindes2 es: ",mindes2

k10_3 = mindes2

raw_data = "SALVADOR_G_CL_10KG_4.txt"
cut_rawdata = "SALVADOR_G_CL_10KG_4_cut.txt"
acc_corregida = "SALVADOR_G_CL_10KG_4_acccor.txt"
vel_nocorregida = "SALVADOR_G_CL_10KG_4_velsin.txt"
vel_corregida = "SALVADOR_G_CL_10KG_4_velcor.txt"
des_nocorregida = "SALVADOR_G_CL_10KG_4_dessin.txt"
des_corregida = "SALVADOR_G_CL_10KG_4_descor.txt"

CALL process(raw_data, cut_rawdata,acc_corregida,vel_nocorregida,vel_corregida,des_nocorregida,des_corregida,mindes2)
WRITE(*,*)"mindes2 es: ",mindes2

k10_4 = mindes2

raw_data = "SALVADOR_G_CL_10KG_5.txt"
cut_rawdata = "SALVADOR_G_CL_10KG_5_cut.txt"
acc_corregida = "SALVADOR_G_CL_10KG_5_acccor.txt"
vel_nocorregida = "SALVADOR_G_CL_10KG_5_velsin.txt"
vel_corregida = "SALVADOR_G_CL_10KG_5_velcor.txt"
des_nocorregida = "SALVADOR_G_CL_10KG_5_dessin.txt"
des_corregida = "SALVADOR_G_CL_10KG_5_descor.txt"

CALL process(raw_data, cut_rawdata,acc_corregida,vel_nocorregida,vel_corregida,des_nocorregida,des_corregida,mindes2)
WRITE(*,*)"mindes2 es: ",mindes2

k10_5 = mindes2

raw_data = "SALVADOR_G_CL_10KG_6.txt"
cut_rawdata = "SALVADOR_G_CL_10KG_6_cut.txt"
acc_corregida = "SALVADOR_G_CL_10KG_6_acccor.txt"
vel_nocorregida = "SALVADOR_G_CL_10KG_6_velsin.txt"
vel_corregida = "SALVADOR_G_CL_10KG_6_velcor.txt"
des_nocorregida = "SALVADOR_G_CL_10KG_6_dessin.txt"
des_corregida = "SALVADOR_G_CL_10KG_6_descor.txt"

CALL process(raw_data, cut_rawdata,acc_corregida,vel_nocorregida,vel_corregida,des_nocorregida,des_corregida,mindes2)
WRITE(*,*)"mindes2 es: ",mindes2

k10_6 = mindes2

raw_data = "SALVADOR_G_CL_10KG_7.txt"
cut_rawdata = "SALVADOR_G_CL_10KG_7_cut.txt"
acc_corregida = "SALVADOR_G_CL_10KG_7_acccor.txt"
vel_nocorregida = "SALVADOR_G_CL_10KG_7_velsin.txt"
vel_corregida = "SALVADOR_G_CL_10KG_7_velcor.txt"
des_nocorregida = "SALVADOR_G_CL_10KG_7_dessin.txt"
des_corregida = "SALVADOR_G_CL_10KG_7_descor.txt"

CALL process(raw_data, cut_rawdata,acc_corregida,vel_nocorregida,vel_corregida,des_nocorregida,des_corregida,mindes2)
WRITE(*,*)"mindes2 es: ",mindes2

k10_7 = mindes2

raw_data = "SALVADOR_G_CL_10KG_8.txt"
cut_rawdata = "SALVADOR_G_CL_10KG_8_cut.txt"
acc_corregida = "SALVADOR_G_CL_10KG_8_acccor.txt"
vel_nocorregida = "SALVADOR_G_CL_10KG_8_velsin.txt"
vel_corregida = "SALVADOR_G_CL_10KG_8_velcor.txt"
des_nocorregida = "SALVADOR_G_CL_10KG_8_dessin.txt"
des_corregida = "SALVADOR_G_CL_10KG_8_descor.txt"

CALL process(raw_data, cut_rawdata,acc_corregida,vel_nocorregida,vel_corregida,des_nocorregida,des_corregida,mindes2)
WRITE(*,*)"mindes2 es: ",mindes2

k10_8 = mindes2

raw_data = "SALVADOR_G_CL_10KG_9.txt"
cut_rawdata = "SALVADOR_G_CL_10KG_9_cut.txt"
acc_corregida = "SALVADOR_G_CL_10KG_9_acccor.txt"
vel_nocorregida = "SALVADOR_G_CL_10KG_9_velsin.txt"
vel_corregida = "SALVADOR_G_CL_10KG_9_velcor.txt"
des_nocorregida = "SALVADOR_G_CL_10KG_9_dessin.txt"
des_corregida = "SALVADOR_G_CL_10KG_9_descor.txt"

CALL process(raw_data, cut_rawdata,acc_corregida,vel_nocorregida,vel_corregida,des_nocorregida,des_corregida,mindes2)
WRITE(*,*)"mindes2 es: ",mindes2

k10_9 = mindes2

raw_data = "SALVADOR_G_CL_10KG_10.txt"
cut_rawdata = "SALVADOR_G_CL_10KG_10_cut.txt"
acc_corregida = "SALVADOR_G_CL_10KG_10_acccor.txt"
vel_nocorregida = "SALVADOR_G_CL_10KG_10_velsin.txt"
vel_corregida = "SALVADOR_G_CL_10KG_10_velcor.txt"
des_nocorregida = "SALVADOR_G_CL_10KG_10_dessin.txt"
des_corregida = "SALVADOR_G_CL_10KG_10_descor.txt"

CALL process(raw_data, cut_rawdata,acc_corregida,vel_nocorregida,vel_corregida,des_nocorregida,des_corregida,mindes2)
WRITE(*,*)"mindes2 es: ",mindes2

k10_10 = mindes2

raw_data = "SALVADOR_G_CL_10KG_11.txt"
cut_rawdata = "SALVADOR_G_CL_10KG_11_cut.txt"
acc_corregida = "SALVADOR_G_CL_10KG_11_acccor.txt"
vel_nocorregida = "SALVADOR_G_CL_10KG_11_velsin.txt"
vel_corregida = "SALVADOR_G_CL_10KG_11_velcor.txt"
des_nocorregida = "SALVADOR_G_CL_10KG_11_dessin.txt"
des_corregida = "SALVADOR_G_CL_10KG_11_descor.txt"

CALL process(raw_data, cut_rawdata,acc_corregida,vel_nocorregida,vel_corregida,des_nocorregida,des_corregida,mindes2)
WRITE(*,*)"mindes2 es: ",mindes2

k10_11 = mindes2

raw_data = "SALVADOR_G_CL_10KG_12.txt"
cut_rawdata = "SALVADOR_G_CL_10KG_12_cut.txt"
acc_corregida = "SALVADOR_G_CL_10KG_12_acccor.txt"
vel_nocorregida = "SALVADOR_G_CL_10KG_12_velsin.txt"
vel_corregida = "SALVADOR_G_CL_10KG_12_velcor.txt"
des_nocorregida = "SALVADOR_G_CL_10KG_12_dessin.txt"
des_corregida = "SALVADOR_G_CL_10KG_12_descor.txt"

CALL process(raw_data, cut_rawdata,acc_corregida,vel_nocorregida,vel_corregida,des_nocorregida,des_corregida,mindes2)
WRITE(*,*)"mindes2 es: ",mindes2

k10_12 = mindes2

raw_data = "SALVADOR_G_CL_10KG_13.txt"
cut_rawdata = "SALVADOR_G_CL_10KG_13_cut.txt"
acc_corregida = "SALVADOR_G_CL_10KG_13_acccor.txt"
vel_nocorregida = "SALVADOR_G_CL_10KG_13_velsin.txt"
vel_corregida = "SALVADOR_G_CL_10KG_13_velcor.txt"
des_nocorregida = "SALVADOR_G_CL_10KG_13_dessin.txt"
des_corregida = "SALVADOR_G_CL_10KG_13_descor.txt"

CALL process(raw_data, cut_rawdata,acc_corregida,vel_nocorregida,vel_corregida,des_nocorregida,des_corregida,mindes2)
WRITE(*,*)"mindes2 es: ",mindes2

k10_13 = mindes2

raw_data = "SALVADOR_G_CL_10KG_14.txt"
cut_rawdata = "SALVADOR_G_CL_10KG_14_cut.txt"
acc_corregida = "SALVADOR_G_CL_10KG_14_acccor.txt"
vel_nocorregida = "SALVADOR_G_CL_10KG_14_velsin.txt"
vel_corregida = "SALVADOR_G_CL_10KG_14_velcor.txt"
des_nocorregida = "SALVADOR_G_CL_10KG_14_dessin.txt"
des_corregida = "SALVADOR_G_CL_10KG_14_descor.txt"

CALL process(raw_data, cut_rawdata,acc_corregida,vel_nocorregida,vel_corregida,des_nocorregida,des_corregida,mindes2)
WRITE(*,*)"mindes2 es: ",mindes2

k10_14 = mindes2

!Ahora obtenemos el promedio de todos los desplazamientos
promedio2 = (k10_1+k10_2+k10_3+k10_4+k10_5+k10_6+k10_7+k10_8+k10_9+k10_10+k10_11+k10_12+k10_13+k10_14)/14

raw_data = "SALVADOR_G_CL_75KG_1.txt"
cut_rawdata = "SALVADOR_G_CL_75KG_1_cut.txt"
acc_corregida = "SALVADOR_G_CL_75KG_1_acccor.txt"
vel_nocorregida = "SALVADOR_G_CL_75KG_1_velsin.txt"
vel_corregida = "SALVADOR_G_CL_75KG_1_velcor.txt"
des_nocorregida = "SALVADOR_G_CL_75KG_1_dessin.txt"
des_corregida = "SALVADOR_G_CL_75KG_1_descor.txt"

CALL process(raw_data, cut_rawdata,acc_corregida,vel_nocorregida,vel_corregida,des_nocorregida,des_corregida,mindes2)
WRITE(*,*)"mindes2 es: ",mindes2

k75_1 = mindes2

raw_data = "SALVADOR_G_CL_75KG_2.txt"
cut_rawdata = "SALVADOR_G_CL_75KG_2_cut.txt"
acc_corregida = "SALVADOR_G_CL_75KG_2_acccor.txt"
vel_nocorregida = "SALVADOR_G_CL_75KG_2_velsin.txt"
vel_corregida = "SALVADOR_G_CL_75KG_2_velcor.txt"
des_nocorregida = "SALVADOR_G_CL_75KG_2_dessin.txt"
des_corregida = "SALVADOR_G_CL_75KG_2_descor.txt"

CALL process(raw_data, cut_rawdata,acc_corregida,vel_nocorregida,vel_corregida,des_nocorregida,des_corregida,mindes2)
WRITE(*,*)"mindes2 es: ",mindes2

k75_2 = mindes2

raw_data = "SALVADOR_G_CL_75KG_3.txt"
cut_rawdata = "SALVADOR_G_CL_75KG_3_cut.txt"
acc_corregida = "SALVADOR_G_CL_75KG_3_acccor.txt"
vel_nocorregida = "SALVADOR_G_CL_75KG_3_velsin.txt"
vel_corregida = "SALVADOR_G_CL_75KG_3_velcor.txt"
des_nocorregida = "SALVADOR_G_CL_75KG_3_dessin.txt"
des_corregida = "SALVADOR_G_CL_75KG_3_descor.txt"

CALL process(raw_data, cut_rawdata,acc_corregida,vel_nocorregida,vel_corregida,des_nocorregida,des_corregida,mindes2)
WRITE(*,*)"mindes2 es: ",mindes2

k75_3 = mindes2

raw_data = "SALVADOR_G_CL_75KG_4.txt"
cut_rawdata = "SALVADOR_G_CL_75KG_4_cut.txt"
acc_corregida = "SALVADOR_G_CL_75KG_4_acccor.txt"
vel_nocorregida = "SALVADOR_G_CL_75KG_4_velsin.txt"
vel_corregida = "SALVADOR_G_CL_75KG_4_velcor.txt"
des_nocorregida = "SALVADOR_G_CL_75KG_4_dessin.txt"
des_corregida = "SALVADOR_G_CL_75KG_4_descor.txt"

CALL process(raw_data, cut_rawdata,acc_corregida,vel_nocorregida,vel_corregida,des_nocorregida,des_corregida,mindes2)
WRITE(*,*)"mindes2 es: ",mindes2

k75_4 = mindes2

raw_data = "SALVADOR_G_CL_75KG_5.txt"
cut_rawdata = "SALVADOR_G_CL_75KG_5_cut.txt"
acc_corregida = "SALVADOR_G_CL_75KG_5_acccor.txt"
vel_nocorregida = "SALVADOR_G_CL_75KG_5_velsin.txt"
vel_corregida = "SALVADOR_G_CL_75KG_5_velcor.txt"
des_nocorregida = "SALVADOR_G_CL_75KG_5_dessin.txt"
des_corregida = "SALVADOR_G_CL_75KG_5_descor.txt"

CALL process(raw_data, cut_rawdata,acc_corregida,vel_nocorregida,vel_corregida,des_nocorregida,des_corregida,mindes2)
WRITE(*,*)"mindes2 es: ",mindes2

k75_5 = mindes2

raw_data = "SALVADOR_G_CL_75KG_6.txt"
cut_rawdata = "SALVADOR_G_CL_75KG_6_cut.txt"
acc_corregida = "SALVADOR_G_CL_75KG_6_acccor.txt"
vel_nocorregida = "SALVADOR_G_CL_75KG_6_velsin.txt"
vel_corregida = "SALVADOR_G_CL_75KG_6_velcor.txt"
des_nocorregida = "SALVADOR_G_CL_75KG_6_dessin.txt"
des_corregida = "SALVADOR_G_CL_75KG_6_descor.txt"

CALL process(raw_data, cut_rawdata,acc_corregida,vel_nocorregida,vel_corregida,des_nocorregida,des_corregida,mindes2)
WRITE(*,*)"mindes2 es: ",mindes2

k75_6 = mindes2

raw_data = "SALVADOR_G_CL_75KG_7.txt"
cut_rawdata = "SALVADOR_G_CL_75KG_7_cut.txt"
acc_corregida = "SALVADOR_G_CL_75KG_7_acccor.txt"
vel_nocorregida = "SALVADOR_G_CL_75KG_7_velsin.txt"
vel_corregida = "SALVADOR_G_CL_75KG_7_velcor.txt"
des_nocorregida = "SALVADOR_G_CL_75KG_7_dessin.txt"
des_corregida = "SALVADOR_G_CL_75KG_7_descor.txt"

CALL process(raw_data, cut_rawdata,acc_corregida,vel_nocorregida,vel_corregida,des_nocorregida,des_corregida,mindes2)
WRITE(*,*)"mindes2 es: ",mindes2

k75_7 = mindes2

raw_data = "SALVADOR_G_CL_75KG_8.txt"
cut_rawdata = "SALVADOR_G_CL_75KG_8_cut.txt"
acc_corregida = "SALVADOR_G_CL_75KG_8_acccor.txt"
vel_nocorregida = "SALVADOR_G_CL_75KG_8_velsin.txt"
vel_corregida = "SALVADOR_G_CL_75KG_8_velcor.txt"
des_nocorregida = "SALVADOR_G_CL_75KG_8_dessin.txt"
des_corregida = "SALVADOR_G_CL_75KG_8_descor.txt"

CALL process(raw_data, cut_rawdata,acc_corregida,vel_nocorregida,vel_corregida,des_nocorregida,des_corregida,mindes2)
WRITE(*,*)"mindes2 es: ",mindes2

k75_8 = mindes2

raw_data = "SALVADOR_G_CL_75KG_9.txt"
cut_rawdata = "SALVADOR_G_CL_75KG_9_cut.txt"
acc_corregida = "SALVADOR_G_CL_75KG_9_acccor.txt"
vel_nocorregida = "SALVADOR_G_CL_75KG_9_velsin.txt"
vel_corregida = "SALVADOR_G_CL_75KG_9_velcor.txt"
des_nocorregida = "SALVADOR_G_CL_75KG_9_dessin.txt"
des_corregida = "SALVADOR_G_CL_75KG_9_descor.txt"

CALL process(raw_data, cut_rawdata,acc_corregida,vel_nocorregida,vel_corregida,des_nocorregida,des_corregida,mindes2)
WRITE(*,*)"mindes2 es: ",mindes2

k75_9 = mindes2

raw_data = "SALVADOR_G_CL_75KG_10.txt"
cut_rawdata = "SALVADOR_G_CL_75KG_10_cut.txt"
acc_corregida = "SALVADOR_G_CL_75KG_10_acccor.txt"
vel_nocorregida = "SALVADOR_G_CL_75KG_10_velsin.txt"
vel_corregida = "SALVADOR_G_CL_75KG_10_velcor.txt"
des_nocorregida = "SALVADOR_G_CL_75KG_10_dessin.txt"
des_corregida = "SALVADOR_G_CL_75KG_10_descor.txt"

CALL process(raw_data, cut_rawdata,acc_corregida,vel_nocorregida,vel_corregida,des_nocorregida,des_corregida,mindes2)
WRITE(*,*)"mindes2 es: ",mindes2

k75_10 = mindes2

raw_data = "SALVADOR_G_CL_75KG_11.txt"
cut_rawdata = "SALVADOR_G_CL_75KG_11_cut.txt"
acc_corregida = "SALVADOR_G_CL_75KG_11_acccor.txt"
vel_nocorregida = "SALVADOR_G_CL_75KG_11_velsin.txt"
vel_corregida = "SALVADOR_G_CL_75KG_11_velcor.txt"
des_nocorregida = "SALVADOR_G_CL_75KG_11_dessin.txt"
des_corregida = "SALVADOR_G_CL_75KG_11_descor.txt"

CALL process(raw_data, cut_rawdata,acc_corregida,vel_nocorregida,vel_corregida,des_nocorregida,des_corregida,mindes2)
WRITE(*,*)"mindes2 es: ",mindes2

k75_11 = mindes2

raw_data = "SALVADOR_G_CL_75KG_12.txt"
cut_rawdata = "SALVADOR_G_CL_75KG_12_cut.txt"
acc_corregida = "SALVADOR_G_CL_75KG_12_acccor.txt"
vel_nocorregida = "SALVADOR_G_CL_75KG_12_velsin.txt"
vel_corregida = "SALVADOR_G_CL_75KG_12_velcor.txt"
des_nocorregida = "SALVADOR_G_CL_75KG_12_dessin.txt"
des_corregida = "SALVADOR_G_CL_75KG_12_descor.txt"

CALL process(raw_data, cut_rawdata,acc_corregida,vel_nocorregida,vel_corregida,des_nocorregida,des_corregida,mindes2)
WRITE(*,*)"mindes2 es: ",mindes2

k75_12 = mindes2

raw_data = "SALVADOR_G_CL_75KG_13.txt"
cut_rawdata = "SALVADOR_G_CL_75KG_13_cut.txt"
acc_corregida = "SALVADOR_G_CL_75KG_13_acccor.txt"
vel_nocorregida = "SALVADOR_G_CL_75KG_13_velsin.txt"
vel_corregida = "SALVADOR_G_CL_75KG_13_velcor.txt"
des_nocorregida = "SALVADOR_G_CL_75KG_13_dessin.txt"
des_corregida = "SALVADOR_G_CL_75KG_13_descor.txt"

CALL process(raw_data, cut_rawdata,acc_corregida,vel_nocorregida,vel_corregida,des_nocorregida,des_corregida,mindes2)
WRITE(*,*)"mindes2 es: ",mindes2

k75_13 = mindes2

raw_data = "SALVADOR_G_CL_75KG_14.txt"
cut_rawdata = "SALVADOR_G_CL_75KG_14_cut.txt"
acc_corregida = "SALVADOR_G_CL_75KG_14_acccor.txt"
vel_nocorregida = "SALVADOR_G_CL_75KG_14_velsin.txt"
vel_corregida = "SALVADOR_G_CL_75KG_14_velcor.txt"
des_nocorregida = "SALVADOR_G_CL_75KG_14_dessin.txt"
des_corregida = "SALVADOR_G_CL_75KG_14_descor.txt"

CALL process(raw_data, cut_rawdata,acc_corregida,vel_nocorregida,vel_corregida,des_nocorregida,des_corregida,mindes2)
WRITE(*,*)"mindes2 es: ",mindes2

k75_14 = mindes2

raw_data = "SALVADOR_G_CL_75KG_15.txt"
cut_rawdata = "SALVADOR_G_CL_75KG_15_cut.txt"
acc_corregida = "SALVADOR_G_CL_75KG_15_acccor.txt"
vel_nocorregida = "SALVADOR_G_CL_75KG_15_velsin.txt"
vel_corregida = "SALVADOR_G_CL_75KG_15_velcor.txt"
des_nocorregida = "SALVADOR_G_CL_75KG_15_dessin.txt"
des_corregida = "SALVADOR_G_CL_75KG_15_descor.txt"

CALL process(raw_data, cut_rawdata,acc_corregida,vel_nocorregida,vel_corregida,des_nocorregida,des_corregida,mindes2)
WRITE(*,*)"mindes2 es: ",mindes2

k75_15 = mindes2

!Ahora obtenemos el promedio de todos los desplazamientos
promedio3 = (k75_1+k75_2+k75_3+k75_4+k75_5+k75_6+k75_7+k75_8+k75_9+k75_10+k75_11+k75_12+k75_13+k75_14+k75_15)/15

WRITE(*,*)"El desplazamiento promedio para archivos con 5 es : ",promedio1
WRITE(*,*)"El desplazamiento promedio para archivos con 10 es : ",promedio2
WRITE(*,*)"El desplazamiento promedio para archivos con 75 es : ",promedio3
