require 'csv'
require 'date'

csv_text = File.read('BrowardWOwnerName.csv')

csv = CSV.parse(csv_text)

first_line = csv.shift

clean_csv = csv - first_line

@categories = []
@business_name = []
@finance = []
@finance_names = []
@finance_data = []

@armored = []

clean_csv.each do |row|
  separated = row[-1]
  @categories << separated
#############
# To find businesses opened in 2016 use following:
#   if row[24].split("/")[2] == "16"
#     @categories << separated
#   end
#############
#############
# To separate a specific type of category, pair this with an empty array before first loop

  if ["BANK", "BANKING", "BANKS", "FEDERAL SAVINGS",
    "FEDERAL SAVINGS & LOAN", "BANK MANAGEMENT",
    "COMMERCIAL BANK", "BANK (COMMERCIAL)"].include? separated
    @finance << row
  elsif ["ARMORED CAR SERVICE"].include? separated

    @armored << row
  end

  # if separated[0].include? "ARMORED"
  #   @armored << row
  # end

#############
end
@local_bank_name = []
@local_bank_data = []

@finance.each do |b_info|
  if ["JP MORGAN CHASE NA", "HSBC TECHNOLOGY & SERVICES USA INC", "SUNTRUST BANK", "WELLS FARGO BANK NA @MIAMI", "JP MORGAN CHASE BANK NA", "CHASE", "TD", "HSBC", "JP MORGAN CHASE BANK NA", "WELLS FARGO BANK NA", "WELLS FARGO BANK NA @HIALEAH", "WELLS FARGO BANK NA @ MIAMI SPRINGS", "WELLS FARGO BANK NA @CORAL GABLES", "WELLS FARGO BANK NA JOHN G STUMPF PRES @ N. MIAMI BEACH", "HSBC BANK USA", "HSBC PRIVATE BANK INTERNATIONAL", "TD BANK NATIONAL ASSOCIATION", "WELLS FARGO BANK NA @750 ARTHUR GODFREY RD", "WELLS FARGO BANK NA @MIAMI BEACH", "WELLS FARGO BANK NA @MIAMI GARDENS", "WELLS FARGO BANK NA @OPA-LOCKA", "WELLS FARGO BANK NA @HOMESTEAD",
  "TD BANK NA", "TD BANK N A", "WELLS FARGO BANK NA @8550 SW 24 ST",
  "HSBC BANK USA NA", "WELLS FARGO BANK NA @13700 N KENDDR @MIAMI",
  "WELLS FARGO BANK NA  @800 N MIAMI BEACH BLVD", "JP MORGAN CHASE BANK NA @HELEN LINES",
  "HSBC BANK USA NATIONAL ASSOCIATION", "JP MORGAN CHASE BANK N A", "WELLS FARGO BANK NA @ NORTH MIAMI BEACH",
  "JPMORGAN CHASE BANK NA", "TD BANK, NATIONAL ASSOCIATION", "JPMOGAN CHASE BANK NA",
  "JP MORGAN CHASE BANK N.A.", "JP MORGAN CHASE", "WELLS FARGO BANK NA @SUNNY ISLES BCH",
  "WELLS FARGO BANK NA @10815 SUNSET DR", "TD BANK NA @SUZANNE MOORE",
  "WELLS FARGO HOME MORTGAGE", "WELLS FARGO BANK N A", "TD BANK,N.A.",
  "TD BANK, N.A.", "CITIBANK N A", "CITIBANK FSB", "CITIBANK (FLORIDA) N A",
  "CITIBANK", "BB&T", "BB& T", "BB & T", "BANK OF AMERICA NA #5890", "BANK OF AMERICA NA #2707",
  "BANK OF AMERICA NA", "BANK OF AMERICA N A", "BANK OF AMERICA INVESTMENT SERVICES INC", "BANK OF AMERICA",
  "BANK BUILDERS INTERNATIONAL INC", "TD BANK", "CITIBANK NA", "WACHOVIA BANK,NA/A WELLS FARGO COMPANY"].exclude? b_info[1]
    @local_bank_name << b_info[1]
    @local_bank_data << Hash["name" => b_info[1], "address" => b_info[3], "contact person" => b_info[2], "phone" => b_info[4], "zipcode" => b_info[3].split(", ")[1].split(" ")[1]]
  end
end

# @armored_names = []
# @armored_info = []
#
# @armored.each do |a_info|
#   @armored_names << a_info[3]
#   @armored_info << Hash["name" => a_info[3], "address" => a_info[4], "contact person" => a_info[2], "zipcode" => a_info[4].split(", ")[1].split(" ")[1]]
# end



# @finance.each do |b_info|
#   if b_info[3].include? "ARMORED"
#     byebug
#     @armored_names << b_info[3]
#     @armored_info << b_info
#   end
  # @finance_names << b_info[3]
  # puts "Business Name: #{b_info[3]}"
  #
  # puts "Full Profile: #{b_info}"
# end
# byebug

a = @categories.inject(Hash.new(0)) { |total, e| total[e] += 1 ;total}
# byebug

industries_sorted = a.sort_by{|x,y|y}

industries_sorted.reverse!

industries_sorted.each do |industry_count|
  # byebug
  puts industry_count
  end
puts @categories.uniq.count
puts @categories.count
byebug
puts @local_bank_name.uniq
puts "Total banks: #{@local_bank_name.uniq.count}"
puts "Total branches: #{@local_bank_data.count}"
# byebug
# puts @armored_names
# puts @armored_info

@local_bank_data.sort_by! { |f| f["zipcode"] }

@local_bank_data.each do |finc|
puts "xxxxxxxxxxxxxxxxxxxxxx"
puts finc
puts "xxxxxxxxxxxxxxxxxxxxxx"
end
