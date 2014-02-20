class Fetcher < ActiveRecord::Base

  SEPERATORS = [[ '\\ (Windows)', '\\'], ['/ (Unix)', '/']]
  ENCRYPTIONS = [[ 'Implicit', 'I' ], [ 'Eksplicit', 'E']]
  RECURSIVE = [[ 'Unlimited', '100' ], ['Only entry level', '0'],
    ['1 level below', '1'], ['2 levels below', '2'],['3 levels below', '3'],
    ['4 levels below', '4'], ['5 levels below', '5'],['6 levels below', '6']]

  belongs_to :provider
  belongs_to :status
  belongs_to :transport
  belongs_to :retain
  belongs_to :deliver_period
  belongs_to :supply
  attr_accessible :basename, :charset, :directory, :directory_filter,
    :file_filter, :format, :passive, :passkey, :recursive, :remote_delete,
    :seperator, :set, :set_limit, :timeout, :sleep_interval, :username, :provider_id,
    :status_id, :transport_id, :retain_id, :deliver_period_id, :supply_id,
    :realm, :port, :encryption

  validates :provider, :presence => true
  validates :status, :presence => true
  validates :transport, :presence => true
  validates :retain, :presence => true
  validates :deliver_period, :presence => true
  validates :supply, :presence => true

  validates :set_limit, :inclusion => { :in => ['month', 'year'] },
    :allow_blank => true
  validates :recursive, :numericality => { :only_integer => true},
    :allow_blank => true
  validates :timeout, :numericality => { :only_interger => true},
    :allow_blank => true
  validates :charset, :inclusion => { :in => ['utf-8', 'iso-8859-1'] },
    :allow_blank => true
  validates :seperator, :format => { :with => /\A^[\/\\]$\z/,
    :message => "Only / or \\ allowed" }, :allow_blank => true
  validates :port, :numericality => { :only_interger => true },
    :allow_blank => true
  validates :encryption, :inclusion => { :in => ['I', 'E'] },
    :allow_blank => true

  scope :recent, :limit => 10, :order => 'created_at DESC'

  def self.from_param(param)
     param.each do |key, value|
       if /_id\z/.match(key) and self.accessible_attributes.include?(key)
         return where(key.to_sym => value)
       end
     end
     Fetcher.all
  end

  def password
    passkey
  end

  def attributes
    super.merge({'password' => passkey})
  end
end
