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

 
   def meta_keywords(tags = nil)
    if tags.present?
      content_for :meta_keywords, tags
    else
      content_for?(:meta_keywords) ? [content_for(:meta_keywords), APP_CONFIG['meta_keywords']].join(', ') : APP_CONFIG['meta_keywords']
    end
  end

  def meta_description(desc = nil)
    if desc.present?
      content_for :meta_description, desc
    else
      content_for?(:meta_description) ? content_for(:meta_description) : APP_CONFIG['meta_description']
    end
  end

   def title(title = nil)
    if title.present?
      content_for :title, title
    else
      content_for?(:title) ? APP_CONFIG['default_title'] + ' | ' + content_for(:title) : APP_CONFIG['default_title']
    end
  end

end
