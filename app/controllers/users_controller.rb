class UsersController < ApplicationController

def inscription
  respond_to do |format|
    format.html { render :inscription, locals: { feedback: {} } }
  end
end


def create_inscription

  puts params
  
  required = [:student_id, :course_id]
  form_complete = true
  required.each do |f|
    if params.has_key? f and not params[f].blank?
      # that's good news. do nothing
    else
      form_complete = false
    end
  end
  if form_complete
    form_status_msg = 'Thank you for your feedback!'
    puts params[:student_id]
    puts params[:course_id]
    CourseEnrollement.create!(student_id: params[:student_id], course_id: params[:course_id])

  else
    form_status_msg = 'Please fill in all the remaining form fields and resubmit.'
  end
  respond_to do |format|

    
    format.html { render :inscription, locals: { status_msg: form_status_msg, feedback: params } }
  end
end

def contact
  respond_to do |format|
    format.html { render :contact, locals: { feedback: {} } }
  end









end

end