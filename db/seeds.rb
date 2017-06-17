require 'csv'
require 'date'

csv_text = File.read('Public-2017 receipts.csv')
csv = CSV.parse(csv_text)
csv.shift
csv.each do |row|
b = Business.new
if row[9] == "Active"
  b.account_active = true
else b.account_active = false
end
b.business_address = row[4]
b.category_code = row[6]
b.category_name = row[7]
b.class_code = row[17]
b.class_name = row[18]
b.email = row[13]
b.mailing_addres = row[5]
b.name = row[3]
b.physical_location = row[2]
b.phone = row[12]
b.start_date = Date.strptime(row[15], "%m/%d/%y")
if row[10] == "Paid in Full"
b.taxes_current = true
else b.taxes_current = false
end
b.units = row[8]
b.save
end
