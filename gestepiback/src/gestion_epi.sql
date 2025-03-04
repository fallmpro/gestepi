-- Crée la base de données (si elle n'existe pas déjà)
CREATE DATABASE IF NOT EXISTS gestion_epi;
USE gestion_epi;

-- Table des utilisateurs
CREATE TABLE Utilisateur (
    id_utilisateur INT AUTO_INCREMENT PRIMARY KEY,
    nom VARCHAR(100) NOT NULL,
    prénom VARCHAR(100) NOT NULL,
    email VARCHAR(255) UNIQUE NOT NULL,
    mot_de_passe VARCHAR(255) NOT NULL,
    rôle ENUM('Gestionnaire', 'Cordiste') NOT NULL
);

-- Table des EPI
CREATE TABLE EPI (
    id_epi INT AUTO_INCREMENT PRIMARY KEY,
    nom_epi VARCHAR(255) NOT NULL,
    type_epi VARCHAR(100) NOT NULL,
    numéro_série VARCHAR(100) UNIQUE NOT NULL,
    date_achat DATE NOT NULL,
    durée_de_vie INT NOT NULL,
    id_utilisateur_responsable INT,
    FOREIGN KEY (id_utilisateur_responsable) REFERENCES Utilisateur(id_utilisateur) ON DELETE SET NULL
);

-- Table des contrôles
CREATE TABLE Contrôle (
    id_controle INT AUTO_INCREMENT PRIMARY KEY,
    id_epi INT NOT NULL,
    date_controle DATE NOT NULL,
    résultat ENUM('Conforme', 'Non conforme') NOT NULL,
    commentaires TEXT,
    id_utilisateur_controleur INT,
    FOREIGN KEY (id_epi) REFERENCES EPI(id_epi) ON DELETE CASCADE,
    FOREIGN KEY (id_utilisateur_controleur) REFERENCES Utilisateur(id_utilisateur) ON DELETE SET NULL
);

-- Table des alertes
CREATE TABLE Alerte (
    id_alerte INT AUTO_INCREMENT PRIMARY KEY,
    id_epi INT NOT NULL,
    date_alerte DATE NOT NULL,
    statut ENUM('Envoyée', 'Non envoyée') DEFAULT 'Non envoyée',
    FOREIGN KEY (id_epi) REFERENCES EPI(id_epi) ON DELETE CASCADE
);
