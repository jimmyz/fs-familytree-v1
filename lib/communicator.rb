require 'fs_communicator'

module FsFamilytreeV1
  
  # This method gets mixed into the FsCommunicator so that
  # you can make calls on the fs_familytree_v1 module
  def fs_familytree_v1
    @com ||= Communicator.new self # self at this point refers to the FsCommunicator instance
  end
  
  class Communicator
    Base = '/familytree/v1/'
    
    # ==params
    # fs_communicator: FsCommunicator instance
    def initialize(fs_communicator)
      @fs_communicator = fs_communicator
    end
    
    def person(id, options = {})
      url = Base + 'person/' + id
      response = @fs_communicator.get(url)
      familytree = Familytree.parse response.body
      person = familytree.persons.person.find{|p| p.requestedId == id }
    end
  end
  
end

# Mix in the module so that the fs_familytree_v1 can be called
class FsCommunicator
  include FsFamilytreeV1
end