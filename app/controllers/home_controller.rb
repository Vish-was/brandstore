class HomeController < ApplicationController
	before_action :authenticate_user!
	def index
	end

	def import
		require 'csv'  
		csv_text = File.read(params["file"].tempfile)
		csv = CSV.parse(csv_text, :headers => true)
		csv.each do |row|
  			project = Project.where(name: row["Project Name"])
  			project = Project.create(name: row["Project Name"]) if project.blank?
  			project.project_file.create(name: row["Project File"])
		end
		redirect_to request.referrer, notice: "File uploaded"
	end
end
