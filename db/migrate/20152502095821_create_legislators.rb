require_relative '../config'

class CreateLegislators < ActiveRecord::Migration

  def change
    create_table :legislators do |t|
      t.string :title, :null => false
      t.string :firstname, :null => false
      t.string :middlename
      t.string :lastname, :null => false
      t.string :name_suffix
      t.string :nickname
      t.string :party, :null => false
      t.string :district, :null => false
      t.string :state, :null => false
      t.string :in_office, :null => false
      t.string :gender, :null => false
      t.string :phone, :unique => true
      t.string :fax, :unique => true
      t.string :website
      t.string :webform
      t.string :congress_office
      t.string :bioguide_id, :unique => true, :null => false
      t.string :votesmart_id, :unique => true
      t.string :fec_id, :unique => true
      t.string :govtrack_id, :unique => true, :null => false
      t.string :crp_id, :unique => true, :null => false
      t.string :twitter_id
      t.string :congresspedia_url, :null => false
      t.string :youtube_url
      t.string :facebook_id, :unique => false
      t.string :official_rss
      t.string :senate_class
      t.string :birthdate, :null => false
      t.timestamps
    end
  end
end

