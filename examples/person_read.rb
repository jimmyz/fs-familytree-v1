dir = File.expand_path(File.join(File.dirname(__FILE__), '..', 'lib'))
require File.join(dir, 'fs_familytree_v1')

com = FsCommunicator.new
# session would be obtained via use of fs-identity-v1 gem
# but can be pasted in to this example
com.session = 'USYS...' 

person = com.fs_familytree_v1.person 'me'

puts "Id: #{person.id}"
puts "Name: #{person.assertions.name[0].forms.form[0].fullText}"
puts "Gender: #{person.information.gender}"
birth = person.assertions.event.find{|e| e.type == 'Birth'}
puts "Birth: #{birth.date.normalized} in #{birth.place.normalized}"