class QuestionsController < ApplicationController
  before_action :assign_question, only: %i(show edit update destroy)

  def index
    @questions = Question.all.decorate
  end

  def show
  end

  def new
    @documentations = Documentation.all.pluck(:name, :id)
    @question = Question.new.decorate
  end

  def create
    @question = Question.new(question_params)
    if @question.save
      redirect_to question_path(@question.id),
                  notice: 'The question was added successfully!'
    else
      render :new
    end
  end

  def edit
    @documentations = Documentation.all.pluck(:name, :id)
  end

  def update
    if @question.update_attributes(question_params)
      redirect_to question_path(@question.id),
                  notice: 'The question was updated successfully!'
    else
      render :edit
    end
  end

  def destroy
    @question.destroy
    redirect_to questions_path,
                notice: 'The question was destroyed successfully!'
  end
end

private

def question_params
  params.require(:question).permit(
    :body, { answers: [] }, { correct_answers: [] }, :explanation,
    :documentation_id, :answer_counter, :positive_rates, :negative_rates
  )
end

def assign_question
  @question = Question.find(params[:id]).decorate
end
