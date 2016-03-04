module ApplicationHelper
	 # Returns the full title on a per-page basis.       # Documentation comment
  def full_title(page_title = '')                     # Method def, optional arg
    base_title = "Ideas Connect Us"  # Variable assignment
    if page_title.empty?                              # Boolean test
      base_title                                      # Implicit return
    else
      page_title + " | " + base_title                 # String concatenation
    end
  end

  def admin?
  	current_user && User.find(current_user.id).admin?
       
  end

 


end
