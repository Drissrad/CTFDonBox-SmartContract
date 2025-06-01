// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract CTFDonBox {
    // Propriétaire du contrat (président/trésorier)
    address payable public owner;
    
    // Événements pour la transparence
    event DonRecu(address donateur, uint256 montant);
    event RetraitEffectue(address beneficiaire, uint256 montant);
    event ProprietaireModifie(address nouveauProprietaire);

    // Vérifie que seul le propriétaire peut exécuter
    modifier onlyOwner() {
        require(msg.sender == owner, "Action reservee au proprietaire");
        _;
    }

    // Constructeur : définit le propriétaire initial
    constructor() {
        owner = payable(msg.sender);
    }

    // Fonction pour recevoir les dons ETH
    receive() external payable {
        emit DonRecu(msg.sender, msg.value);
    }

    // Permet au propriétaire de retirer des fonds
    function retirerFonds(uint256 _montant, address payable _beneficiaire) external onlyOwner {
        require(_montant > 0, "Montant doit etre > 0");
        require(_montant <= address(this).balance, "Solde insuffisant");
        require(_beneficiaire != address(0), "Adresse invalide");
        
        _beneficiaire.transfer(_montant);
        emit RetraitEffectue(_beneficiaire, _montant);
    }

    // Vérifie le solde du contrat
    function getSoldeContrat() external view returns (uint256) {
        return address(this).balance;
    }

    // Permet de transférer la propriété (optionnel)
    function transfererPropriete(address payable _nouveauProprietaire) external onlyOwner {
        require(_nouveauProprietaire != address(0), "Adresse invalide");
        owner = _nouveauProprietaire;
        emit ProprietaireModifie(_nouveauProprietaire);
    }
}