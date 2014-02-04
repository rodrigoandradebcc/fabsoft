class WelcomeController < ApplicationController
  def index
    @projects = projects.first(3)
  end

  def about
  	@about = About.first
  end

  def partners
  	@partners = Partner.all
  end

  def projects
    @projects = Project.all
  end

  def members
    @control = true
  	@members = Member.all
  end
end
