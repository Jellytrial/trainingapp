# frozen_string_literal: true

class ToppageController < ApplicationController
  def index
    @cates = Course.distinct.select(:category)
  end

  def search
    if params[:search].blank?
      redirect_to(root_path, alert: 'Empty Keyword!') and return
    else
      @keyword = params[:search].downcase
      @keyword_results = Course.all.where("lower(course_title) LIKE :search OR \
                lower(topic) LIKE :search OR lower(category) LIKE :search", search: "%#{@keyword}%")
    end
  end

  def cate_search
    if params[:category_name].blank?
      redirect_to(root_path, alert: 'Empty Category!') and return
    else
      @param = params[:category_name]
      @cates_res = Course.all.where('category=?', @param)
    end
  end
end
