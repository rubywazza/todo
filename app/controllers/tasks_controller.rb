class TasksController < ApplicationController
  # GET /tasks
  # GET /tasks.json
  before_filter :authenticate_user!

  def index
    @tasks = current_user.tasks

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @tasks } if current_user.account_type == "paid"
    end
  end

  def today
    @tasks = Task.where("user_id = ? and deadline = ?", current_user, Date.today)

    respond_to do |format|
        format.html # index.html.erb
        format.json { render json: @tasks }  if current_user.account_type == "paid"
    end
  end

  # GET /tasks/1
  # GET /tasks/1.json
  def show
    @task = Task.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @task } if current_user.account_type == "paid"
    end
  end

  # GET /tasks/new
  # GET /tasks/new.json
  def new
    @task = Task.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @task } if current_user.account_type == "paid"
    end
  end

  # GET /tasks/1/edit
  def edit
    @task = Task.find(params[:id])
  end

  # POST /tasks
  # POST /tasks.json
  def create
    @task = Task.new(params[:task])
	  @task.user_id = current_user.id
	  @task.is_finished = false
    @task.attachment = params[:file]

    respond_to do |format|
      if @task.save
        format.html { redirect_to @task, notice: 'Task was successfully created.' }
        format.json { render json: @task, status: :created, location: @task } if current_user.account_type == "paid"
      else
        format.html { render action: "new" }
        format.json { render json: @task.errors, status: :unprocessable_entity }
      end
    end
  end

  def done
    @task = Task.find(params[:task_id])
    @task.update_attributes({:is_finished => true})
    respond_to do |format|
      format.html { redirect_to tasks_url}
      format.json { render json: @tasks} if current_user.account_type == "paid"
    end
  end

  def notdone
     @task = Task.find(params[:task_id])
     @task.update_attributes({:is_finished => false})
     respond_to do |format|
       format.html { redirect_to tasks_url}
       format.json { render json: @tasks} if current_user.account_type == "paid"
     end
   end
  # PUT /tasks/1
  # PUT /tasks/1.json
  def update
    @task = Task.find(params[:id])

    respond_to do |format|
      if @task.update_attributes(params[:task])
        format.html { redirect_to @task, notice: 'Task was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @task.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /tasks/1
  # DELETE /tasks/1.json
  def destroy
    @task = Task.find(params[:id])
    @task.destroy

    respond_to do |format|
      format.html { redirect_to tasks_url }
      format.json { head :no_content }
    end
  end
end
