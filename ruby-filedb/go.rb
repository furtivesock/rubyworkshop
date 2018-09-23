db = FileDb::Database.new("fixtures/data.json")
table = db.table("movies")
table.join("directors", "director_id", "id")