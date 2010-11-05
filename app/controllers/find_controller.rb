class FindController < ApplicationController
	
  def year_month
	  @page_title = "#{params[:year]} - #{params[:month]}"
		months_without_nulls = (1..9).to_a.to_s.split(//)
		if months_without_nulls.any? { |m| m == params[:month] }
		  then params[:month] = '0' + params[:month]
		end
		@posts = Post.by_year_month(params[:year], params[:month], [ '04', '06', '09', '11']).by_asc_date
  end

  def year
	  @page_title = params[:year]
		@posts = Post.by_year(params[:year]).by_asc_date
  end
	
	def o
    response.headers['Cache-Control'] = 'public, max-age=300'
		@page_title = t :about
		@content = t :content_about
	end

end
