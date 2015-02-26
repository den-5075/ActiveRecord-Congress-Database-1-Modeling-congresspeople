require_relative '../../db/config'

class Legislator < ActiveRecord::Base

  validates :title, :presence => true
  validates :firstname, :presence => true
  validates :lastname, :presence => true
  validates :party, :presence => true
  validates :district, :presence => true
  validates :state, :presence => true
  validates :in_office, :presence => true
  validates :gender, :presence => true
  validates :phone, :uniqueness => true
  validates :fax, :uniqueness => true
  validates :bioguide_id, :uniqueness => true, :presence => true
  validates :votesmart_id, :uniqueness => true
  validates :fec_id, :uniqueness => true
  validates :govtrack_id, :uniqueness => true, :presence => true
  validates :crp_id, :uniqueness => true, :presence => true
  validates :congresspedia_url, :presence => true
  validates :facebook_id, :uniqueness => true
  validates :birthdate, :presence => true


end