
/*Yaln�zca Alt�n, T�rk liras�, Euro ve Yen d�viz t�r�nden hesab� olan m��terilerden; 
ayn� bankan�n ayn� �ubesinde ayn� d�viz t�r�nden birden fazla ve toplam� 9000 ila 24000 aras�nda olan 
hesab� bulunan ilk 20 m��terinin bankas�n�n ad�n� ve say�s�n� bulan T-SQL kodunu yaz�n�z.*/

select * from HESAP
select * from BANKA_SIRKET
select * from BANKA_SUBE

select t1.MusteriID, t1.DovizID, t1.SubeID, t1.sayi, BANKA_SIRKET.BankaAd, Meblag from 
(select top 20 MusteriID, SubeID, DovizID, count(*) as sayi from HESAP
where DovizID in ('TRY', 'ALT','YEN','EUR') 
group by  MusteriID, SubeID, DovizID
having count(*)>1 and sum(Meblag) between 9000 and 24000
) as t1
inner join HESAP on t1.MusteriID=HESAP.MusteriID
inner join BANKA_SUBE on t1.SubeID=BANKA_SUBE.SubeID
inner join BANKA_SIRKET on BANKA_SUBE.BankaID=BANKA_SIRKET.BankaID
AND HESAP.SubeID = t1.SubeID
AND HESAP.DovizID = t1.DovizID
order by MusteriID 


SELECT
    o.MusteriID, o.SubeID,o.DovizID ,d.intCount, Meblag, s.BankaAd
FROM  (
     SELECT Top 20 MusteriID, SubeID, DovizID, COUNT(*) as intCount
     FROM HESAP
	 Where DovizID in('ALT','TRY','EUR','YEN')
     GROUP BY MusteriID, SubeID, DovizID
     HAVING COUNT(*) > 1 And SUM(Meblag) BETWEEN 9000 AND 24000
) AS d
    INNER JOIN HESAP o ON o.MusteriID = d.MusteriID
	INNER JOIN BANKA_SUBE b ON b.SubeID=o.SubeID
	INNER JOIN BANKA_SIRKET s ON s.BankaID=b.BankaID
	AND o.SubeID = d.SubeID
	AND o.DovizID = d.DovizID
	order by MusteriID 


	--M��terinin ayn� bankan�n ayn� �ubesinde ayn� d�viz t�r�nde olan hesap bilgileri i�in 
	SELECT
    o.MusteriID, o.SubeID,o.DovizID ,d.intCount
FROM (
     SELECT MusteriID, SubeID, DovizID, COUNT(*) as intCount
     FROM HESAP
     GROUP BY MusteriID, SubeID, DovizID
     HAVING COUNT(*) > 1
) AS d
    INNER JOIN HESAP o ON o.MusteriID = d.MusteriID
	AND o.SubeID = d.SubeID
	AND o.DovizID = d.DovizID
	order by MusteriID 


	




	SELECT
     o.MusteriID, o.SubeID,o.DovizID ,d.intCount, Meblag
FROM  (
     SELECT TOP 20 MusteriID, SubeID, DovizID, COUNT(*) as intCount
     FROM HESAP
	 Where DovizID in('ALT','TRY','EUR','YEN')
     GROUP BY MusteriID, SubeID, DovizID
     HAVING COUNT(*) > 1 And SUM(Meblag) BETWEEN 9000 AND 24000
) AS d
    INNER JOIN HESAP o ON o.MusteriID = d.MusteriID
	AND o.SubeID = d.SubeID
	AND o.DovizID = d.DovizID
	order by MusteriID 




	SELECT
    o.MusteriID, o.SubeID,o.DovizID ,d.intCount, Meblag, s.BankaAd
FROM  (
     SELECT Top 20 MusteriID, SubeID, DovizID, COUNT(*) as intCount
     FROM HESAP
	 Where DovizID in('ALT','TRY','EUR','YEN')
     GROUP BY MusteriID, SubeID, DovizID
     HAVING COUNT(*) > 1 And SUM(Meblag) BETWEEN 9000 AND 24000
	 ) AS d
    INNER JOIN HESAP o ON o.MusteriID = d.MusteriID
	INNER JOIN BANKA_SUBE b ON b.SubeID=o.SubeID
	INNER JOIN BANKA_SIRKET s ON s.BankaID=b.BankaID
	AND o.SubeID = d.SubeID
	AND o.DovizID = d.DovizID
	order by MusteriID 

	

