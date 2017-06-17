class Business < ActiveRecord::Base

def self.import(file)
CSV.foreach(file.path, headers: ture) do |row|
  Business.create! row.to_hash
end
end
end
