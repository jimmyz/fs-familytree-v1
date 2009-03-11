require 'rubygems'
gem 'jimmyz-happymapper'
require 'happymapper'

module FsFamilytreeV1

  class AlternateIds
    include HappyMapper
    
    tag :alternateIds
    has_many :id, String
  end

  class PersonInformation
    include HappyMapper
    
    tag :information
    element :gender, String
    element :living, Boolean
    has_one :alternateIds, AlternateIds 
  end
  
  class NamePiece
    include HappyMapper
    
    tag :piece
    attribute :type, String
    element :value, String
  end
  
  class Pieces
    include HappyMapper
    
    has_many :piece, NamePiece
  end
  
  class NameForm
    include HappyMapper
    
    tag :form
    element :fullText, String
    has_one :pieces, Pieces
    attribute :script, String # ('Spanish' | 'Portuguese' | 'Chinese' | 'Kana' | 'Hangul' | 'Cyrillic')
  end
  
  class Forms
    include HappyMapper
    
    has_many :form, NameForm
  end
  
  class Assertion
    def self.init(options = {})
      include HappyMapper
      
      attribute :id, String
      attribute :version, String
      attribute :submitter, String
      attribute :modified, DateTime
      attribute :modifiable, Boolean
      attribute :disputing, Boolean
      attribute :contributor, String
      attribute :tempId, String
    end
  end
  
  class Name < Assertion
    init
    
    attribute :type, String
    has_one :forms, Forms
  end
  
  class Gender < Assertion
    init
    
    element :value, String # ( Male | Female )
  end
  
  class DateAstro
    include HappyMapper
    
    tag :astro
    element :earliest, Integer
    element :latest, Integer
  end
  
  class Date
    include HappyMapper
    
    element :original, String
    element :normalized, String
    element :astro, DateAstro
  end
  
  class Place
    include HappyMapper
    
    element :original, String
    element :normalized, String, :attributes => {:placeId => String}
  end
  
  class PersonReference
    def self.init
      include HappyMapper
      
      attribute :role, String
      attribute :ref, String
      attribute :tempId, String
    end
  end
  
  class Spouse < PersonReference
    init
  end
  
  class Child < PersonReference
    init
  end
  
  class Parent < PersonReference
    init
  end
  
  class Event < Assertion
    init
    
    attribute :type, String
    attribute :title, String # not tested
    element :date, Date
    element :place, Place
    element :spouse, Spouse
  end
  
  class Fact < Assertion
    init
    
    attribute :type, String
    attribute :scope, String
    attribute :title, String
    element :detail, String
    has_one :child, Child
    has_one :parent, Parent
    has_one :spouse, Spouse # not tested
    element :place, Place # not tested
    element :spouse, Spouse # not tested
  end
  
  class Relationship < Assertion
    init
    
    attribute :scope, String
    has_one :child, Child
    has_one :parent, Parent
    has_one :spouse, Spouse
  end
  
  class Assertions
    include HappyMapper
    
    has_many :name, Name
    has_many :gender, Gender
    has_many :event, Event
    has_many :fact, Fact
    has_many :relationship, Relationship
  end

  class Person
    include HappyMapper
    
    attribute :id, String
    attribute :requestedId, String
    attribute :version, String
    attribute :modified, DateTime
    has_one :information, PersonInformation
    has_one :assertions, Assertions
  end

  class Persons
    include HappyMapper
    
    has_many :person, Person
  end
  
  class Familytree
    include HappyMapper
    
    attribute :version, String
    attribute :statusMessage, String
    attribute :statusCode, Integer
    has_one :persons, Persons
  end
end