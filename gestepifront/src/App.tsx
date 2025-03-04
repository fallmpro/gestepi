import { BrowserRouter as Router, Routes, Route, Link } from "react-router-dom";
import { useState } from "react";
import "./App.css";

function App() {
  return (
    <Router>
      <div className="app-container">
        <nav className="navbar">
          <h1>Gestion des EPI</h1>
          <div className="nav-links">
            <Link to="/">Accueil</Link>
            <Link to="/saisie-epi">Saisie EPI</Link>
            <Link to="/saisie-controle">Saisie Contrôle</Link>
            <Link to="/historique">Historique</Link>
            <Link to="/alertes">Alertes</Link>
          </div>
        </nav>

        <div className="content">
          <Routes>
            <Route path="/" element={<Home />} />
            <Route path="/saisie-epi" element={<SaisieEPI />} />
            <Route path="/saisie-controle" element={<SaisieControle />} />
            <Route path="/historique" element={<Historique />} />
            <Route path="/alertes" element={<Alertes />} />
          </Routes>
        </div>
      </div>
    </Router>
  );
}

const Home = () => <div className="page">Bienvenue dans l'application de gestion des EPI</div>;
const SaisieEPI = () => <div className="page">Formulaire de saisie d'un EPI</div>;
const SaisieControle = () => <div className="page">Formulaire de saisie d'un contrôle</div>;
const Historique = () => <div className="page">Liste des EPI et leur historique</div>;
const Alertes = () => <div className="page">Alertes pour les contrôles à venir</div>;

export default App;
