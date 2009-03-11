require File.dirname(__FILE__) + '/spec_helper'

describe FsFamilytreeV1 do
  before(:each) do
    f = fixture_file('person/KJ86-3VD.xml')
    @familytree = FsFamilytreeV1::Familytree.parse f
  end
  
  it "it should parse familytree objects for a person read" do
    @familytree.version.should == '1.3.20081106.2911'
    @familytree.statusMessage.should == 'OK'
    @familytree.statusCode.should == 200
    @familytree.persons.should_not be_nil
    @familytree.persons.person.size.should == 1
    person = @familytree.persons.person[0]
      person.id.should == 'KJ86-3VD'
      person.requestedId.should == 'KJ86-3VD'
      person.version.should == '1220897348000'
      person.modified.should == DateTime.parse('2008-09-08T12:09:08-06:00')
      info = person.information
      info.gender.should == 'Male'
      info.living.should == false
      info.alternateIds.should_not be_nil
      info.alternateIds.id.size.should == 36
      info.alternateIds.id.first.should == 'afn.3QF9-L9'
    person.assertions.should_not be_nil
    names = person.assertions.name
      names.size.should == 20
      name = names.first
        name.id.should == 'aWZzLWZ0LnAuTTk0Mi1OODY6NDAwMDAyaWoyWk10Rmw0RGF4M0dSMDAx'
        name.version.should == '1172152583167'
        name.submitter.should == 'MMMM-MM8'
        name.modified.should == DateTime.parse('2007-02-22T06:56:23.167-07:00')
        name.modifiable.should == false
        name.disputing.should == false
        name.contributor.should == 'MMWG-V3Y'
        name.tempId.should == 'primaryName'
        name.type.should == 'Name'
        name.forms.should_not be_nil
        form = name.forms.form[0]
          form.fullText.should == 'Parker Felch'
          form.script.should == 'Spanish'
          form.pieces.should_not be_nil
          piece = form.pieces.piece[0]
            piece.type.should == 'Given'
            piece.value.should == 'Parker'
    genders = person.assertions.gender
      genders.size.should == 20
      gender = genders[0]
        gender.value.should == 'Male'
        gender.version.should == '1173994209749' # not going to test all inherited attributes
    events = person.assertions.event
      events.size.should == 57
      event = events[0]
        event.type.should == 'Birth'
        event.date.original.should == '2Nov1808'
        event.date.normalized.should == '2 November 1808'
        event.date.astro.earliest.should == 2381724
        event.date.astro.latest.should == 2381724
        event.place.original.should == 'Sandwich, Carroll, New Hampshire'
        event.place.normalized.should == 'Sandwich, Carroll, New Hampshire, United States'
        event.place.normalized.placeId.should == '802556'
      event = events.find{|e|e.type=='Marriage'}
        event.id.should == 'Y2ZzLWZ0LnAuTVg3Sy0yVzV8ZnMtZnQucC5NWDdLLTI0Qzo0MDAwMDBfZjJaSXRGMTRGMnRKMVYwMDA='
        event.spouse.should_not be_nil
        event.spouse.role.should == 'Woman'
        event.spouse.ref.should == 'KFB8-WLJ'
        event.spouse.tempId.should == 'tempSpouse'
    facts = person.assertions.fact
      facts.size.should == 67
      fact = facts[0]
        fact.type.should == 'Exists'
        fact.scope.should == 'person'
      fact = facts.find{|f|f.type == 'Lineage' && f.scope == 'parent-child'}
        fact.child.ref.should == 'K695-YSL'
        fact.detail.should == 'Biological'
      fact = facts.find{|f|f.id == 'cGZzLWZ0LnAuTUNDSC1RNFF8ZnMtZnQucC5NVzlKLVdKRzo0MDAwMDJoaTJaSXRHMTRFQk1aRkYwMDA='}
        fact.parent.ref.should == 'KJ86-3VW'
    relationships = person.assertions.relationship
      relationships.size.should == 79
      rel = relationships[0]
        rel.scope.should == 'parent-child'
        rel.child.ref.should == 'K695-YSL'
      rel = relationships.find{|r|r.id == 'cGZzLWZ0LnAuOVhUMi1XOER8ZnMtZnQucC45WFQyLVc4ODo0MDAwMDFzZTJaSXRJRzRLWmR4T2cwMDE='}
        rel.parent.ref.should == 'KJ86-3VW'
      rel = relationships.find{|r|r.id == 'Y2ZzLWZ0LnAuTTk0Mi1OODZ8ZnMtZnQucC5NNEo4LVAxMzo0MDAwMDJpajJaTXRGbDREYXgzR3MwMDA='}
        rel.spouse.ref.should == 'KFB8-WLJ'
        rel.spouse.role.should == 'Woman'
  end
end
