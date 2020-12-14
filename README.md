# MUMPS
Säteenaskellusta MUMPSilla (Skrolli 2020.4)

# Ajaminen Linuxilla

Asenna GT.M MUMPS-toteutus: https://sourceforge.net/projects/fis-gtm/

Tämän jälkeen voit ajaa koodin komentoriviltä seuraavasti:

```
export gtmroutines="$gtmroutines $PWD"
mumps pallo.m
gtm -run ^pallo
```
