class Fetcher < ActiveRecord::Base
  belongs_to :provider
  belongs_to :status
  belongs_to :transport
  belongs_to :retain
  belongs_to :deliver_period
  belongs_to :supply
  attr_accessible :basename, :charset, :directory, :directory_filter,
    :file_filter, :format, :passive, :password, :recursive, :remote_delete,
    :seperator, :set, :set_limit, :timeout, :username, :provider_id,
    :status_id, :transport_id, :retain_id, :deliver_period_id, :supply_id,
    :realm

  validates :provider, :presence => true
  validates :status, :presence => true
  validates :transport, :presence => true
  validates :retain, :presence => true
  validates :deliver_period, :presence => true
  validates :supply, :presence => true

  validates :set_limit, :inclusion => { :in => ['month', 'year'] }, :allow_blank => true
  validates :recursive, :numericality => { :only_integer => true}, :allow_blank => true
  validates :timeout, :numericality => { :only_interger => true}, :allow_blank => true
  validates :charset, :inclusion => { :in => ['utf-8', 'iso-8859-1'] }, :allow_blank => true
  validates :seperator, :format => { :with => /\A^[\/\\]$\z/, :message => "Only / or \\ allowed" }, :allow_blank => true

  scope :recent, :limit => 10, :order => 'created_at DESC'

  def self.from_param(param)
     param.each do |key, value|
       if /_id\z/.match(key) and self.accessible_attributes.include?(key)
         return where(key.to_sym => value)
       end
     end
     Fetcher.all
  end

end
