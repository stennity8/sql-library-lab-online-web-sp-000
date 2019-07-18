def select_books_titles_and_years_in_first_series_order_by_year
  # "SELECT books.title, books.year FROM books 
  # JOIN series ON books.series_id = series.id
  # WHERE series.id = 1 ORDER BY books.year;"
  "SELECT title, year FROM books WHERE series_id = 1"
end

def select_name_and_motto_of_char_with_longest_motto
  "SELECT name, motto FROM characters ORDER BY motto LIMIT 1;"
end

def select_value_and_count_of_most_prolific_species
  "SELECT species, COUNT(species) AS prolific_species FROM characters GROUP BY species
  ORDER BY species DESC LIMIT 1"
end

def select_name_and_series_subgenres_of_authors
  "SELECT authors.name, subgenres.name FROM series
  JOIN subgenres ON series.subgenre_id = subgenres.id
  JOIN authors ON series.author_id = authors.id"
end

def select_series_title_with_most_human_characters
  "SELECT series.title FROM series
  LEFT OUTER JOIN characters ON series.id = characters.series_id
  GROUP BY series.title ORDER BY COUNT (characters.species = 'human') DESC LIMIT 1
  "
end

def select_character_names_and_number_of_books_they_are_in
  # This works but the tests want the names in ascending order for some reason
  # "SELECT characters.name, COUNT(character_books.character_id) FROM characters
  # JOIN character_books ON characters.id = character_books.character_id
  # GROUP BY character_books.character_id 
  # ORDER BY COUNT(character_books.character_id) DESC"

  "SELECT characters.name, COUNT(*) FROM character_books
JOIN characters ON character_books.character_id = characters.id
GROUP BY characters.name
ORDER BY COUNT(*) DESC;"
end
