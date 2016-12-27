class Course < ActiveRecord::Base

  def self.text_search(query)
    if query.present?
      where("name ilike :q or department ilike :q or course_no ilike :q or full_title ilike :q", q: "%#{query}%")
    else
      Course.none
    end
  end

end
