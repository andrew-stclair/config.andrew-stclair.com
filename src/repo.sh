#!/bin/sh

echo "Installing GPG Public Key"
gpg --dearmor -o /etc/apt/trusted.gpg.d/andrew-stclair-keyring.gpg << EndOfMessage
-----BEGIN PGP PUBLIC KEY BLOCK-----
mQINBGWXbFMBEADAcCiOGQDOlVFUkoyNX4P7jJHZ4AMaHXKKfuG5gv92KbLBvGfU
sG1R+i32h6rmtyMpIjp4vLLxOAPfYIuGdaY30ChVTvRH9m+hP2Ky5sB+LJSrwX9j
Jgeh3H4TRm2EqslnY/84HyxxGJRIySebOLi15/O2vROdneTzVItNeaS3J2XQvDaW
HJkGLd99IK/bYQnyzCaiTDcvmwQ7bkJUr7ezrOaZmA15X6jyJEs6UAxsBNsv3780
pljDxnZ52u0yItMW//ejw5k/vsKuqBGEv4IiXsbQfLZwnjA1x2VDGZ2a9s4MZRjM
JkI1TcYC64psPB01A2RcRXZTDdma7LV5VNHAtMFxdeFt12HKb2096734jYqP6Stg
erJF/RcBNir/GK92mzu4fdxO4rDPGy5bliDofsmuA3x3LV4sfK/eoO3hv9Q5Cd+F
5vFxA3RN3KjD79QhjSyD5us9nSuEg5MBDHsWTGm6jXXNONPSA+/pKwqwgyVvzP8K
3BZO0/5eOFjI+srW9Y1YpjSqML22crp+6YXIk83yXZtiHW8pHTEWTa5gVKu+Sz3F
KpASykAUmmOZD8/OWw+qNSrm4ck9Nv5RiBN3sgcicTkmpy9zOxWoiMIZKP4o4WfE
h7hI0ce7ZIlG7eXRHxhTXB2bl2uIg2TUq1/SMoNFM1bijRfa1fgwRNC6/QARAQAB
tA9BbmRyZXcgU3QgQ2xhaXKJAk4EEwEKADgWIQSpVh4bOOKflfq+UTw4EE0nQSrH
4QUCZZdsUwIbAwULCQgHAgYVCgkICwIEFgIDAQIeAQIXgAAKCRA4EE0nQSrH4am0
EACzMT8FGk69otbDEfmccxqTs/OQY8gcjEiEeCeEUtzrKP1eTRoTAqkAyz6l2kQL
6CBZMOdOin48vkzfm6SKNwVB2p4ZguPz5VCpPPKXGfvYCemMlxYSawfi9vdf964J
Oe2vFWxkAimYlNaMmXT7fhgoA994KpB63njdMAXnQqlw8wSxHAElUWje41BR/Zr1
r3H8WQzFysXhkFwFtn7Y6Q8nlwk6KaY9NrV+s9j79/XFQ+Zhjy4AglTsnA1owWZP
X7ulOOhPpFSIHmJfsJ+mrocwOr+GVSHsDxL6RRTuQur+oU3mTASGS0OvXGNafo3L
J17HEXF6G63tDjwBV36gKTOQJha5w9Sb84puBgVtPTTER3xsH+MsSHgYqZaBSxU1
y8mzqT0R6yxOqrvoRUEsmuQToZwt2BIbtNN9MCXTMWHSS0szKQePSM6XRoU0Z2L3
q2HsscMrzzVCdtjPbi064B+dVL9Jvvm2yYnFS3zBsjSvjwOqrKzDpOIVIpZ1VLJm
uzL4r6fjZbzeEb226fBnaUI44VkR+mm1IbJVLq6zc8cuhweeZkfYZ7jjglQDNUvC
Xg8Tez+4OLwEqqqL/zpfTZ5+Z16ToHC7jf8xflk48FVqErYPSOigUD+pEiOxx8WT
22n2VZV339WWaO16ipJ6a20Q1IUmnhQCDhRU2K4/VNk5HA==
=YdgW
-----END PGP PUBLIC KEY BLOCK-----
EndOfMessage

echo "Setting up apt list"
cat > /etc/apt/sources.list.d/andrew-stclair.list << EndOfMessage
deb https://repo.andrew-stclair.com/repository/apt-hosted/ bookworm main
EndOfMessage

echo "Swapping out debian mirrors"
sed 's|http://[a-z]*.debian.org/debian|https://repo.andrew-stclair.com/repository/debian|g' -i /etc/apt/sources.list
sed 's|https://[a-z]*.debian.org/debian|https://repo.andrew-stclair.com/repository/debian|g' -i /etc/apt/sources.list
sed 's|http://[a-z]*.debian.org/debian|https://repo.andrew-stclair.com/repository/debian|g' -i /etc/apt/sources.list.d/*
sed 's|https://[a-z]*.debian.org/debian|https://repo.andrew-stclair.com/repository/debian|g' -i /etc/apt/sources.list.d/*
