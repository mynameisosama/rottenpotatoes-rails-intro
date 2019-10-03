module MoviesHelper
  # Checks if a number is odd:
  def oddness(count)
    count.odd? ?  "odd" :  "even"
  end
  
  def helper_class(field)
   (params[:sort].to_s == field) ? 'hilite' : nil
  end
  
  def sanitize_rating(default)
    (params.include?(:ratings)) ? params[:ratings].keys : default
  end
  
  def which_checked(rating)
     (params.include?(:ratings)) ? params[:ratings].include?(rating) : true
  end
  
  def valid_ratings()
     params.include?(:ratings)
  end
  
  def valid_sort_key()
     params.include?(:sort)
  end
  
  def update_session()
    session[:ratings] = params[:ratings] ? params[:ratings] : session[:ratings]
    session[:sort] = params[:sort] ? params[:sort] : session[:sort]
  end
  
  def invalid_params()
    invalid_rating = false
    invalid_sort_key= false
    if(!valid_ratings() and session.include?(:ratings))
      params[:ratings] = session[:ratings]
      invalid_rating = true
    end
    if(!valid_sort_key() and session.include?(:sort))
      params[:sort] = session[:sort]
      invalid_sort_key = true
    end
    return (invalid_rating or invalid_sort_key)
  end
end
