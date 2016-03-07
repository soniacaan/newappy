class MicropostType < ActiveRecord::Base
    enum type: [:business_idea, :social_idea, :projects, :management, :social_change]

end
