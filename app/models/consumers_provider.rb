class ConsumersProvider < ActiveRecord::Base
  attr_accessible :provider_id, :consumer_id, :fulltext_id
  
  belongs_to :consumer
  belongs_to :provider
  belongs_to :fulltext
end
