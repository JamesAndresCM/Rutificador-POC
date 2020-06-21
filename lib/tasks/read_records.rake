# frozen_string_literal: true

namespace :read_records do
  desc 'Read chilean electoral file'
  task :file, [:input_file] => :environment do |_, args|
    input_file = args[:input_file]
    insert_records_in_db(input_file)
  end
end

def insert_records_in_db(file)
  File.open(file, 'r') do |f|
    f.each_line do |line|
      split_line = line.split
      paternal = split_line[0]
      maternal = split_line[1]
      first_name = split_line[2]
      last_name = split_line[3]
      rut = split_line[4].tr('.', '').tr('-', '').to_i
      location = split_line[6..-2].join(' ')
      p Person.create(
        paternal: paternal,
        maternal: maternal,
        first_name: first_name,
        last_name: last_name,
        rut: rut,
        location: location
      )
    end
  end
end
