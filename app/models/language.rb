class Language < ActiveRecord::Base
  belongs_to :profile
  belongs_to :foreign_language
end
