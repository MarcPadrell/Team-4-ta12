# TA12 - Diagramas ER
Team 4: Marc Nebot, Borja Montseny i Marc Padrell

TA12 -> Ex: 6, 7, 17, 11, 18 -> Borja 

TA12 -> Ex: 14, 13, 3, 5 -> Nebot 

TA12 -> Ex: 2, 8, 9, 12, 15 -> Marc P

<br>
Ejercicios asignados: 04, 10, 16 <br>
<br>
Ej04: <br>
<img src="https://cdn.discordapp.com/attachments/959500501957877760/966295185266991134/unknown.png">
<img src="https://cdn.discordapp.com/attachments/959500501957877760/966641394435391568/unknown.png">
<br>
<h4>Modelo Relacional:</h4> <br>
<b>PAIS</b>(ID_PAIS [PK], NUM_AÑOS_NO_INDEPENDIENTE, ES_INDEPENDIENTE)<br>
<b>FORMAR</b>(ID_PAIS[FK], ID_NOMBRE_BANDO[FK])<br>
<b>BANDO</b>(ID_NOMBRE_BANDO [PK], ID_PAIS[FK])<br>
<b>REALIZAR</b>(ID_NOMBRE_BANDO [FK], ID_GUERRA [FK])<br>
<b>GUERRA</b>(ID_GUERRA [PK], NOMBRE_GUERRA, AÑO_INICIO, AÑO_FINAL, ID_BANDO_GANADOR[FK], ID_BANDO_PERDEDOR[FK])
<br>
<hr>
<br>
Ej10: <br>
Diagrama Entitat-Relació:

![Exercici-10-ta12 drawio (1)](https://user-images.githubusercontent.com/79224406/164423783-ce10b2a3-93f5-4661-99df-ebb0c1b22a3d.png)
Model relacional: <br>

![image](https://user-images.githubusercontent.com/79224406/164423346-d632586e-b2cd-4486-b6ce-0ade096c0c06.png)
<br><br>
Ej16: <br>
![image](https://user-images.githubusercontent.com/103039613/164343445-79358ed2-0add-4427-a67e-f03d2309e3f0.png)
![image](https://user-images.githubusercontent.com/103039613/164432849-e4cd3f12-692b-4b03-bf63-3e58cf8b4e9c.png)

![image](https://user-images.githubusercontent.com/103039613/164432954-76efa8e5-d687-4575-a4ea-7cbb67426158.png)
