module ApplicationHelper
  def categories
    Category.for_navbar
  end
end
