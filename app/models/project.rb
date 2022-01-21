class Project
  attr_accessor :title, :description, :skills, :hour_value, :date_limit, :work_regimen, :status, :user

  def initialize(hash_parameters)
    @title = hash_parameters[:title]
    @description = hash_parameters[:description]
    @skills = hash_parameters[:skills]
    @hour_value = hash_parameters[:hour_value]
    @date_limit = hash_parameters[:date_limit]
    @work_regimen = hash_parameters[:work_regimen]
    @status = hash_parameters[:status]
    @user = hash_parameters[:user]
  end

  def self.all
    projects = []
    response = Faraday.get("http://freelancertd7:3000/api/v1/projects/")

    if response.status == 200
      data = JSON.parse(response.body)
      data.each do |d|
        projects << Project.new({ title: d["project"]["title"], description: d["project"]["description"],
                                skills: d["project"]["skills"], hour_value: d["project"]["hour_value"],
                                date_limit: d["project"]["date_limit"], work_regimen: d["project"]["work_regimen"],
                                status: d["project"]["status"], user: d["project"]["user"]["email"] })
      end
    end
    return projects
  end
end