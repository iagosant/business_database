class Business < ActiveRecord::Base
validates_uniqueness_of :name, scope: [:start_date, :address, :mailing_addres]

def self.import(file)
CSV.foreach(file.path, headers: ture) do |row|
  Business.create! row.to_hash
end
end

end
