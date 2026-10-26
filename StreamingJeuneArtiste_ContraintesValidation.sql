describe artiste;
describe profession_artiste;
describe oeuvre;
describe genre_oeuvre;
describe plateforme_streaming;


alter table artiste
add constraint DateNaissance_Artiste check (DateNaissance_Artiste < '1994-01-01' And DateNaissance_Artiste < '2024-01-01');

alter table profession_artiste
add constraint Nom_Profession check (Nom_Profession LIKE 'Realisateur' OR Nom_Profession LIKE 'Acteur' OR Nom_Profession LIKE 'Compositeur' OR Nom_Profession LIKE 'Doubleur' OR Nom_Profession LIKE 'Cascadeur' OR Nom_Profession LIKE 'Directeur Artistique' OR Nom_Profession LIKE 'Comédien' OR Nom_Profession LIKE 'Chanteur');

alter table Oeuvre
add constraint Type_Oeuvre check (Type_Oeuvre LIKE ('serie','film','one man show','représentation théatrale')),
add constraint Date_Oeuvre check (Date_Oeuvre > '2019-01-01');

alter table genre_oeuvre
add constraint Nom_Genre check (Nom_Genre LIKE 'Horreur' OR Nom_Genre LIKE 'Drame' OR Nom_Genre LIKE 'Action' OR Nom_Genre LIKE 'Science-Fiction' OR Nom_Genre LIKE 'Thriller' OR Nom_Genre LIKE 'Comédie' OR Nom_Genre LIKE 'Fantaisie' OR Nom_Genre LIKE 'Western' OR Nom_Genre LIKE 'Aventure' OR Nom_Genre LIKE 'Documentaire' OR Nom_Genre LIKE 'Romance' OR Nom_Genre LIKE 'Dessin anime' OR Nom_Genre LIKE 'comedie musicale');

alter table plateforme_streaming
add constraint NbUtilisateur_Streaming check (NbUtilisateur_Streaming >= 0);