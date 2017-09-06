# frozen_string_literal: true

$LOAD_PATH.unshift File.expand_path('../../lib', __FILE__)
require 'attribute_validation'

require 'minitest/autorun'

require 'sqlite3'

DB_NAME = 'test.db'
db = SQLite3::Database.new DB_NAME
db.execute <<-SQL
  create table users(id, name);
SQL
ActiveRecord::Base.establish_connection(
  adapter: 'sqlite3',
  database: DB_NAME
)

class User < ActiveRecord::Base
end
