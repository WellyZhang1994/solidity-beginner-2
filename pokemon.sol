// SPDX-License-Identifier: MIT
pragma solidity ^0.8.17;

library PokemonLib {
    function find(PokemonGo.Pokemon[] storage _pokes, string calldata specificPokeName) view internal returns (PokemonGo.Pokemon storage){
        for (uint i = 0; i<= _pokes.length; i ++) {
            if (keccak256(abi.encodePacked(_pokes[i].name)) == keccak256(abi.encodePacked(specificPokeName))){
                return _pokes[i];
            }
        }
        revert("Specific Pokemon Not Found!");
    }
}

contract PokemonGo {
    using PokemonLib for Pokemon[];
    struct Pokemon {
        string name;
        uint attack;
        uint defense;
    }

    mapping(address => Pokemon[]) pokemonOwner;

    function createPokemon(string calldata _name, uint _attack, uint _defense)  external {
        Pokemon memory tempPoke = Pokemon({name: _name, attack: _attack, defense: _defense});
        Pokemon[] storage addressOfPokemon = pokemonOwner[msg.sender];
        addressOfPokemon.push(tempPoke);
    }

    function getPokemonByAddress() view external returns(Pokemon[] memory) {
        return pokemonOwner[msg.sender];
    }

    function getTheLatestPokemonByAddress() view external returns(Pokemon memory) {
        uint pokemonLength = pokemonOwner[msg.sender].length -1;
        return pokemonOwner[msg.sender][pokemonLength];
    }

    function increaseAttack(string calldata _pokemonName) payable external{
        require(msg.value > 0.1 ether);
        uint returnEther = msg.value - 0.1 ether;
        (bool success, ) = msg.sender.call{value:returnEther}("");
        require(success, "Address: unable to send value, recipient may have reverted");

        Pokemon[] storage pokemons = pokemonOwner[msg.sender];
        Pokemon storage targetPoke = pokemons.find(_pokemonName);
        targetPoke.attack ++;
    }

    function increaseDefense(string calldata _pokemonName) payable external{
        require(msg.value > 0.1 ether);
        uint returnEther = msg.value - 0.1 ether;
        (bool success, ) = msg.sender.call{value:returnEther}("");
        require(success, "Address: unable to send value, recipient may have reverted");
        Pokemon[] storage pokemons = pokemonOwner[msg.sender];
        Pokemon storage targetPoke = pokemons.find(_pokemonName);
        targetPoke.defense ++;
    }
}


