
gem 'activerecord', '=4.2.7'
require 'active_record'
require 'mini_record'

ActiveRecord::Base.establish_connection(adapter: 'sqlite3', database: 'crm.sqlite3')

class Contact < ActiveRecord::Base

  field :first_name, as: :string
  field :last_name,  as: :string
  field :email,      as: :string
  field :note,       as: :text

    def full_name
      "#{ first_name } #{ last_name }"
    end

end

Contact.auto_upgrade!

# marty = Contact.find_by(:first_name => "Marty")
# Contact.delete(marty)
# Contact.create(:first_name => "George", :last_name => "McFly", :email => "george@mcfly.com")
# Contact.create(:first_name => "Lorraine", :last_name => "McFly", :email => "lorraine@mcfly.com")
# Contact.create(:first_name => "Biff", :last_name => "Tannen", :email => "biff@tannen.com")
# Contact.create(:first_name => "Doc", :last_name => "Brown", :email => "doc@brown.com")
