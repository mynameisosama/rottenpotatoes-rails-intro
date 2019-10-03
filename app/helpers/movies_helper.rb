module MoviesHelper
  # Checks if a number is odd:
  def oddness(count)
    count.odd? ?  "odd" :  "even"
  end
  
  def helper_class(field)
   (params[:sort].to_s == field) ? 'hilite' : nil
  end
  
  def helper_rating(rating, default)
    rating == nil ? default: rating.keys
  end
  
  def which_checked(rating)
    params[:ratings] ? params[:ratings].include?(rating) : true
  end
end
