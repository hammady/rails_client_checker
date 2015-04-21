module RailsClientChecker
class CheckerController < ApplicationController
  def check 
    render layout: false
  end

  def set_cookie
    if params[:key].present? && params[:val].present?
      cookies[params[:key]] = params[:val]
      render json: {status: 'OK'}
    else
      render status: :bad_request, json: {status: 'Missing key or val'}
    end
  end

  def get_cookie
    ret = {}
    if params[:key].present?
      ret[params[:key]] = cookies[params[:key]]
      cookies.delete params[:key]
    end
    render json: ret
  end
end
end
