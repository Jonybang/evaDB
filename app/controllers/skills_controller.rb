class SkillsController < ApplicationController

  private

    def skill_params
      params.require(:skill).permit!
    end
end

