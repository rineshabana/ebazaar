class InventoriesController < ApplicationController
  def index
    @inventories = Inventory.all
  end

  def new; end

  def edit; end
  def create; end

  def update; end

  def destroy; end
end
