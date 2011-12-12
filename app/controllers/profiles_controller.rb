class ProfilesController < ApplicationController
  # GET /profiles
  # GET /profiles.xml
  def index
    @profiles = Profile.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @profiles }
    end
  end

  # GET /profiles/1
  # GET /profiles/1.xml
  def show
    @profile = Profile.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @profile }
    end
  end

  # GET /profiles/new
  # GET /profiles/new.xml
  def new
    @profile = Profile.new
    @profile.emergency_contacts.build
    @profile.social_moviments.build
    @profile.public_schools.build
    @abilities = Ability.all.collect{|a| [a.name, a.id]}
    @interesting_topics = InterestingTopic.all.collect{|a| [a.name, a.id]}
    @work_topics = WorkTopic.all.collect{|a| [a.name, a.id]}
    @foreign_languages = ForeignLanguage.all
    @languages_array = []
    @foreign_languages.each do |l|
      @profile.languages.build(:foreign_language_id => l.id)
      @languages_array << l.language
    end

    @projects = [['Comunicação', 1], ['Tecnologia da Informação', 2], ['Educação à Distância', 3], ['Gestão de Projetos', 4], ['Educação Cidadã', 5], ['Educação Popular', 6], ['Educação de Jovens e Adultos', 7], ['UniFreire', 8], ['Centro de Referência Paulo Freire', 9], ['Editora e Livraria Instituto Paulo Freire', 10], ['Casa da Cidadania Planetária', 11]]
  
    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @profile }
    end
  end

  # GET /profiles/1/edit
  def edit
    @profile = Profile.find(params[:id])
    
    @abilities = Ability.all.collect{|a| [a.name, a.id]}
    @interesting_topics = InterestingTopic.all.collect{|a| [a.name, a.id]}
    @work_topics = WorkTopic.all.collect{|a| [a.name, a.id]}
    @foreign_languages = ForeignLanguage.all
    @languages_array = []
    
    @foreign_languages.each do |l|
      @profile.languages.build(:foreign_language_id => l.id)
      @languages_array << l.language if !@profile.languages.collect(&:foreign_language_id).include? (l.id)
    end
    @projects = [['Comunicação', 1], ['Tecnologia da Informação', 2], ['Educação à Distância', 3], ['Gestão de Projetos', 4], ['Educação Cidadã', 5], ['Educação Popular', 6], ['Educação de Jovens e Adultos', 7], ['UniFreire', 8], ['Centro de Referência Paulo Freire', 9], ['Editora e Livraria Instituto Paulo Freire', 10], ['Casa da Cidadania Planetária', 11]]
  end

  # POST /profiles
  # POST /profiles.xml
  def create
    @profile = Profile.new(params[:profile])

    respond_to do |format|
      if @profile.save
        format.html { redirect_to(profiles_path, :notice => 'Perfil criado com sucesso.') }
        format.xml  { render :xml => @profile, :status => :created, :location => @profile }
        format.js 
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @profile.errors, :status => :unprocessable_entity }
        format.js 
      end
    end
  end

  # PUT /profiles/1
  # PUT /profiles/1.xml
  def update
    @profile = Profile.find(params[:id])

    respond_to do |format|
      if @profile.update_attributes(params[:profile])
        format.html { redirect_to(profiles_path, :notice => 'Perfil atualizado com sucesso.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @profile.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /profiles/1
  # DELETE /profiles/1.xml
  def destroy
    @profile = Profile.find(params[:id])
    @profile.destroy

    respond_to do |format|
      format.html { redirect_to(profiles_url) }
      format.xml  { head :ok }
    end
  end
end
