class ExportsController < ApplicationController
  def main
  end

  def export
  	@number = params[:export][:number]
  	@projects = Project.count(@number)
  	redirect_to '/projects.csv'
    # respond_to do |format|
    #   format.html
    #   format.csv { send_data @projects.to_csv, filename: "projects- #{Date.today}.csv"}
    # end
  end
end
