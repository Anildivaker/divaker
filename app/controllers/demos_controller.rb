class DemosController < ApplicationController
  before_action :set_demo, only:
   [:show, :new_sub_demo, :create_sub_demo]

  def new
    @demo = Demo.new
  end

  def create
    @demo = Demo.new(demo_params)
    if @demo.save
      redirect_to @demo
    else
      render new, status: :unprocessable_entity
    end
  end

  def show
    @demo =Demo.find(params[:id])
  end

  def new_sub_demo
    @sub_demo = @demo.sub_demo
  end

  def create_sub_demo
    @sub_demo = @demo.build_sub_demo(sub_demo_params)
    if @sub_demo.save
      redirect_to @demo
    else
      render new_sub_demo, status: :unprocessable_entity
    end
  end

  private

  def set_demo
    @demo = Demo.find_by(id: params[:id])
  end

  def demo_params
    params.require(:demo).permit(:d_name)
  end

  def sub_demo_params
    params.permit(:sub_demo)
  end
end
