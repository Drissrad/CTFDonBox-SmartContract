# 🎯 CTFDonBox - Smart Contract Solidity

Ce projet met en œuvre un smart contract de collecte de dons pour financer un événement de cybersécurité (CTF) dans un cadre universitaire.

## ✅ Fonctionnalités principales
- Accepte des dons en ETH anonymes
- Seul le président/trésorier peut retirer les fonds
- Retraits uniquement vers des adresses valides
- Historique des dons/retraits via des événements
- Affichage en temps réel du solde du contrat
- Transfert de propriété possible

## 📜 Fichier principal
- [`contracts/CTFDonBox.sol`](contracts/CTFDonBox.sol)

## 🧪 Tests recommandés (via Remix IDE)
1. **Envoyer un don** avec `Transact` + valeur ETH ➡️ `DonRecu` déclenché
2. **Retrait par owner** vers une adresse ➡️ succès + `RetraitEffectue`
3. **Retrait par une autre adresse** ➡️ erreur `Action reservee au proprietaire`
4. **Retrait supérieur au solde** ➡️ erreur `Solde insuffisant`
5. **Afficher solde** avec `getSoldeContrat()`
6. **Changer de propriétaire** avec `transfererPropriete(...)`

## 🚀 Déploiement
Utiliser [Remix IDE](https://remix.ethereum.org/) avec :
- Environnement : JavaScript VM (ou Injected Web3 pour Metamask)
- Version Solidity : 0.8.x

## 🔐 Auteur
Réalisé dans le cadre d’un TP universitaire en cybersécurité.

