class FactsController < ApplicationController

def index
 @facts=Fact.all
end

def new
  @fact = Fact.new
end

def create
    @fact = Fact.new(list_params)

    if @fact.save
      redirect_to @fact
    else
      render 'new'
    end
  end


def show
  @fact=Fact.find(params[:id])
end


def edit
  @fact = Fact.find(params[:id])
end

def update
    @fact = Fact.find(params[:id])

    if @fact.update(fact_params)
      redirect_to @fact
    else
      render 'edit'
    end
  end

def destroy
  fact = Fact.find(params[:id])
  fact.destroy

  redirect_to facts_path
end

private
def fact_params
  params.require(:fact).permit(:body, :category, :id)
end

end
