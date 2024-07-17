class UsersController < ApplicationController
  load_and_authorize_resource
  def inscription
    respond_to do |format|
      format.html { render :inscription, locals: { feedback: {} } }
    end
  end

  def create_inscription
    required = %i[student_id course_id]
    form_complete = true
    required.each do |f|
      if params.key? f and !params[f].blank?
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

  def enrollement
    respond_to do |format|
      format.html { render :enrollement, locals: { feedback: {} } }
    end
  end

  def create_enrollement
    required = %i[student_id training_id]
    puts params

    form_complete = true
    required.each do |f|
      if params.key? f and !params[f].blank?
        # that's good news. do nothing
      else
        form_complete = false
      end
    end
    if form_complete
      form_status_msg = 'Thank you for your feedback!'
      puts params[:student_id]
      EnrollementTraining.create!(training_id: params[:student_id], student_id: params[:student_id])

    else
      form_status_msg = 'Please fill in all the remaining form fields and resubmit.'
    end
    respond_to do |format|
      format.html { render :enrollement, locals: { status_msg: form_status_msg, feedback: params } }
    end
  end
end
