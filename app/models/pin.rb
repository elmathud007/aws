class Pin < ActiveRecord::Base
	acts_as_votable
	belongs_to :user

	has_attached_file :image, :styles => { :medium => "300x300>" },
					:download,
                    :storage => :s3,
                    :s3_credentials => Proc.new{|a| a.instance.s3_credentials }

  validates_attachment_content_type :image, :content_type => /\Aimage\/.*\Z/

  

  def s3_credentials
    {:bucket => "xxx", :access_key_id => "xxx", :secret_access_key => "xxx"}
  end
end
end
