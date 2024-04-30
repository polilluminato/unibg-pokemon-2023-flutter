import 'dart:convert';

import 'package:unibg_pokemon/models/pokemon.dart';
import 'package:unibg_pokemon/models/pokemon_item.dart';
import 'package:http/http.dart' as http;

class PokemonRepository {
  PokemonRepository();

  Future<List<PokemonItem>?> getPokemonList() async {
    var response = await http.get(
      Uri.parse("https://pokeapi.co/api/v2/pokemon/?offset=0&limit=151"),
      headers: {
        'Content-Type': 'application/json',
      },
    );

    final responseBodyParsed = json.decode(response.body);

    return responseBodyParsed["results"]
        .map<PokemonItem>((json) => PokemonItem.fromJson(json))
        .toList();
  }

  Future<Pokemon> getSinglePokemon(int pokemonId) async {
    var response = await http.get(
      Uri.parse("https://pokeapi.co/api/v2/pokemon/$pokemonId"),
      headers: {
        'Content-Type': 'application/json',
      },
    );

    return Pokemon.fromJson(json.decode(response.body));
  }
}
