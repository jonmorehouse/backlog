Given(/^entry for "(.*?)" exists$/) do |date_string|
  path = path_from_date_string(date_string)
  FileUtils.touch path

end
