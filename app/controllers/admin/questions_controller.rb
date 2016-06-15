class Admin::QuestionsController < AdminController
  before_action :assign_question, only: %i(show edit update destroy)

  def index
    @questions = Question.all
  end

  def show
  end

  def new
    @question = Question.new
  end

  def create
    @question = Question.new(question_params)
    if @question.save
      redirect_to admin_question_path(@question.id),
                  notice: 'The question was added successfully!'
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @question.update_attributes(question_params)
      redirect_to admin_question_path(@question.id),
                  notice: 'The question was updated successfully!'
    else
      render :edit
    end
  end

  def destroy
    @question.destroy
    redirect_to admin_questions_path,
                notice: 'The question was destroyed successfully!'
  end
end

private

def question_params
  params.require(:question).permit(
    :body, :answers, :correct_answers, :explanation, :documentation_id,
    :answer_counter, :positive_rates, :negative_rates
  )
end

def assign_question
  @question = Question.find(params[:id])
end
