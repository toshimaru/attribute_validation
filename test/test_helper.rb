$LOAD_PATH.unshift File.expand_path('../../lib', __FILE__)
require 'attribute_validation'

require 'minitest/autorun'

require 'pry'
require 'sqlite3'

DB_NAME = 'test.db'
db = SQLite3::Database.new(DB_NAME)
db.execute <<-SQL
  CREATE TABLE IF NOT EXISTS users(
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    name STRING NOT NULL,
    age INTEGER NOT NULL,
    context_name STRING
  );
SQL
ActiveRecord::Base.establish_connection(
  adapter: 'sqlite3',
  database: DB_NAME
)
