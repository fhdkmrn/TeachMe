class Course < ActiveRecord::Base

  def self.text_search(query)
    if query.present?
      where("name ilike :q or department ilike :q or course_no ilike :q or full_title ilike :q
      or name @@ :p or department @@ :p or course_no @@ :p or full_title @@ :p", q: "%#{query}%", p: query).order('full_title DESC')
    else
      Course.none
    end
  end

end
