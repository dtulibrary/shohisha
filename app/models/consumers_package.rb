class ConsumersPackage < ActiveRecord::Base
  attr_accessible :package_id, :consumer_id, :fulltext_id
  
  belongs_to :consumer
  belongs_to :package
  belongs_to :fulltext

  validates :consumer, :presence => true
  validates :package, :presence => true
  validates :fulltext, :presence => true
end
