Use streamingjeuneartiste;

CREATE TABLE Artiste(
   ID_Artiste INT,
   Nom_Artiste VARCHAR(50) NOT NULL,
   Prenom_Artiste VARCHAR(50) NOT NULL,
   DateNaissance_Artiste DATE NOT NULL,
   PRIMARY KEY(ID_Artiste)
);

CREATE TABLE Oeuvre(
   ID_Oeuvre INT,
   Nom_Oeuvre VARCHAR(50) NOT NULL,
   Durée_Oeuvre TIME NOT NULL,
   Date_Oeuvre DATE NOT NULL,
   Type_Oeuvre VARCHAR(50) NOT NULL,
   PRIMARY KEY(ID_Oeuvre)
);

CREATE TABLE Plateforme_Streaming(
   Nom_Streaming VARCHAR(50),
   NbUtilisateur_Streaming INT NOT NULL,
   PRIMARY KEY(Nom_Streaming)
);

CREATE TABLE Genre_Oeuvre(
   Nom_Genre VARCHAR(50),
   PRIMARY KEY(Nom_Genre)
);

CREATE TABLE Profession_Artiste(
   Nom_Profession VARCHAR(50),
   PRIMARY KEY(Nom_Profession)
);

CREATE TABLE Utilisateur(
   ID_Utilisateur INT,
   Nom_Utilisateur VARCHAR(50) NOT NULL,
   Prenom_Utilisateur VARCHAR(50) NOT NULL,
   PRIMARY KEY(ID_Utilisateur)
);

CREATE TABLE Être(
   ID_Artiste INT,
   Nom_Profession VARCHAR(50),
   PRIMARY KEY(ID_Artiste, Nom_Profession),
   FOREIGN KEY(ID_Artiste) REFERENCES Artiste(ID_Artiste),
   FOREIGN KEY(Nom_Profession) REFERENCES Profession_Artiste(Nom_Profession)
);

CREATE TABLE Participer(
   ID_Artiste INT,
   ID_Oeuvre INT,
   PRIMARY KEY(ID_Artiste, ID_Oeuvre),
   FOREIGN KEY(ID_Artiste) REFERENCES Artiste(ID_Artiste),
   FOREIGN KEY(ID_Oeuvre) REFERENCES Oeuvre(ID_Oeuvre)
);

CREATE TABLE Contient(
   Nom_Streaming VARCHAR(50),
   Nom_Genre VARCHAR(50),
   PRIMARY KEY(Nom_Streaming, Nom_Genre),
   FOREIGN KEY(Nom_Streaming) REFERENCES Plateforme_Streaming(Nom_Streaming),
   FOREIGN KEY(Nom_Genre) REFERENCES Genre_Oeuvre(Nom_Genre)
);

CREATE TABLE Attribuer(
   ID_Oeuvre INT,
   Nom_Genre VARCHAR(50),
   PRIMARY KEY(ID_Oeuvre, Nom_Genre),
   FOREIGN KEY(ID_Oeuvre) REFERENCES Oeuvre(ID_Oeuvre),
   FOREIGN KEY(Nom_Genre) REFERENCES Genre_Oeuvre(Nom_Genre)
);

CREATE TABLE Contenir(
   ID_Oeuvre INT,
   Nom_Streaming VARCHAR(50),
   PRIMARY KEY(ID_Oeuvre, Nom_Streaming),
   FOREIGN KEY(ID_Oeuvre) REFERENCES Oeuvre(ID_Oeuvre),
   FOREIGN KEY(Nom_Streaming) REFERENCES Plateforme_Streaming(Nom_Streaming)
);

CREATE TABLE Abonner(
   Nom_Streaming VARCHAR(50),
   ID_Utilisateur INT,
   PRIMARY KEY(Nom_Streaming, ID_Utilisateur),
   FOREIGN KEY(Nom_Streaming) REFERENCES Plateforme_Streaming(Nom_Streaming),
   FOREIGN KEY(ID_Utilisateur) REFERENCES Utilisateur(ID_Utilisateur)
);
