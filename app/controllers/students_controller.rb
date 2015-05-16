class StudentsController < ApplicationController

  private

    def student_params
      params.require(:student).permit!
    end
end

