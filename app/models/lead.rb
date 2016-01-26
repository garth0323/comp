class Lead < ActiveRecord::Base

  validates_presence_of :name, :email, :phone
  validates_format_of :email, with: /\A[^@\s]+@([^@\s]+\.)+[^@\s]+\z/
  validates_format_of :phone, with: /[0-9]{3}-[0-9]{3}-[0-9]{4}/, message: "Phone numbers must be in xxx-xxx-xxxx format."

end
