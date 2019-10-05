module MoviesHelper
  # Checks if a number is odd:
  def oddness(count)
    count.odd? ?  "odd" :  "even"
  end
  
  # Set appropriate class for sorted column
  def helper_class(field)
   (params[:sort].to_s == field) ? 'hilite' : nil
  end
  
  # incase ratings is not provided and session is empty filter for all ratings
  def sanitize_rating(default)
    (params.include?(:ratings)) ? params[:ratings].keys : default
  end
  
  # used to by checkbox to see which ratings are selected
  def which_checked(rating)
     (params.include?(:ratings)) ? params[:ratings].include?(rating) : true
  end
  
  # checks for ratings in request parameters
  def valid_ratings()
     params.include?(:ratings)
  end
  
  # checks for sort key in request parameters
  def valid_sort_key()
     params.include?(:sort)
  end
  
  # updates session with request parameters
  def update_session()
    session[:ratings] = params[:ratings] ? params[:ratings] : session[:ratings]
    session[:sort] = params[:sort] ? params[:sort] : session[:sort]
  end
  
  # checks if parameters are present in request
  # if it has to pick anything from session then its a redirect
  # if session is empty then don't redirect
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
