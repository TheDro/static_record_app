

class Region < ApplicationRecord
  establish_connection(adapter: "static", database: "none")
end