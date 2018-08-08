class PledgesController < ApplicationController
	# 可以想成是一個訂單頁面，只是換一個名稱
	# 募資網站 -> 贊助Pledge
	# 購物網站 -> 訂單Order

	before_action :is_login?
	before_action :get_project_support, only: [:create]

	def create
		@pledge = Pledge.create({
			user: current_user,
			project_support: @project_support,
			project_name: @project_support.project.name,
			support_name: @project_support.name,
			support_price: @project_support.price
			quantity: params[:quantity]
		})
		redirect_to mpg_payment_path(pledgeL: @pledge)
	end

	private

	def is_login?
		unless current_user
			flash[:error] = "您尚未登入"
			redirect_to login_path
			return
		end
	end

	def get_project_support
		@project_support = Projectsupport.is_published.find_by_id(params[:id])

		unless @project_support
			flash[:alert] = "沒有此贊助方案"
			redirect_to :root
			return
		end
	end
end
