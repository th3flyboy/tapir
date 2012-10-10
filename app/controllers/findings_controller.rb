class FindingsController < ApplicationController
  # GET /findings
  # GET /findings.json
  def index
    @findings = Tapir::Entities::Finding.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @findings }
    end
  end

  # GET /findings/1
  # GET /findings/1.json
  def show
    @finding = Tapir::Entities::Finding.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @finding }
    end
  end

  # GET /findings/new
  # GET /findings/new.json
  def new
    @finding = Tapir::Entities::Finding.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @finding }
    end
  end

  # GET /findings/1/edit
  def edit
    @finding = Tapir::Entities::Finding.find(params[:id])
  end

  # POST /findings
  # POST /findings.json
  def create
    @finding = Tapir::Entities::Finding.new(params[:tapir_entities_finding])

    respond_to do |format|
      if @finding.save
        format.html { redirect_to @finding, notice: 'Finding was successfully created.' }
        format.json { render json: @finding, status: :created, location: @finding }
      else
        format.html { render action: "new" }
        format.json { render json: @finding.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /findings/1
  # PUT /findings/1.json
  def update
    @finding = Tapir::Entities::Finding.find(params[:id])

    respond_to do |format|
      if @finding.update_attributes(params[:tapir_entities_finding])
        format.html { redirect_to @finding, notice: 'Finding was successfully updated.' }
        format.json { head :ok }
      else
        format.html { render action: "edit" }
        format.json { render json: @finding.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /findings/1
  # DELETE /findings/1.json
  def destroy
    @finding = Tapir::Entities::Finding.find(params[:id])
    @finding.destroy

    respond_to do |format|
      format.html { redirect_to findings_url }
      format.json { head :ok }
    end
  end
end
