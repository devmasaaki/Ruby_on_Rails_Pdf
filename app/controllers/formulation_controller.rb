# frozen_string_literal: true

class FormulationController < ApplicationController

  def index
    
  end

  def get_all_formulations 
    @connection = ActiveRecord::Base.connection
    formulations = @connection.exec_query('select * from formulations')
    render :json => formulations.to_json
  end

  def get_formulation 
    @connection = ActiveRecord::Base.connection
    formulation = @connection.exec_query('select * from formulations where id="' + params[:id] + '" group by id')
    ingredients = @connection.exec_query('select ingredient_id, percentage from formulation_ingredients where formulation_id="' + params[:id] + '"');
    response = {'formulation' => formulation, 'ingredients' => ingredients}
    render :json => response.to_json
  end

  def get_all_ingredients 
    @connection = ActiveRecord::Base.connection
    ingredients = @connection.exec_query('select * from ingredients')
    render :json => ingredients.to_json
  end

  def submit
    text = ""
    params.each do |key, item|
      if ((key != 'controller') && (key != 'action')) then
        text += '<h1>' + key + ': ' + item + '</h1>'
      end
    end
    pdf = WickedPdf.new.pdf_from_string(text)
    time = Time.now.strftime '%Y%m%d%H%M%S'
    save_path = Rails.root.join('public', params[:name] + time + '.pdf')
    @formulation_form_params = save_path
    File.open(save_path, 'wb') do |file|
      file << pdf
    end

    response = {:success => time}
    render :json => response.to_json
  end

end
