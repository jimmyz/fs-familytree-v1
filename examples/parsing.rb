dir = File.expand_path(File.join(File.dirname(__FILE__), '..', 'lib'))
require File.join(dir, 'fs_familytree_v1')

xml = File.read("../spec/fixtures/person/KJ86-3VD.xml")

familytree = FsFamilytreeV1::Familytree.parse xml
person = familytree.persons.person[0]

puts "Id: #{person.id}"
puts "Name: #{person.assertions.name[0].forms.form[0].fullText}"
puts "Gender: #{person.information.gender}"
birth = person.assertions.event.find{|e| e.type == 'Birth'}
puts "Birth: #{birth.date.normalized} in #{birth.place.normalized}"