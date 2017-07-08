json.extract! produkty, :id, :nazwa, :kalorie, :weglowodany, :bialko, :fat, :ile_gram, :created_at, :updated_at
json.url produkty_url(produkty, format: :json)